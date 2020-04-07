//
//  ViewController.swift
//  GraphQLStudyApp
//
//  Created by Masataka Miyagawa on 2020/04/03.
//  Copyright © 2020 Masataka Miyagawa. All rights reserved.
//

import Apollo
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pokemonListTableView: UITableView!
    
    private var presenter: PokemonListPresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        createList()
    }
    
    private func setup() {
        self.presenter = PokemonListPresenter(view: self)

        pokemonListTableView.estimatedRowHeight = 64
        pokemonListTableView.rowHeight = UITableView.automaticDimension
        pokemonListTableView.register(UINib(nibName: "PokemonItemCell", bundle: nil), forCellReuseIdentifier: "PokemonItemCell")
        
        pokemonListTableView.dataSource = self
        pokemonListTableView.delegate = self
    }
    
    private func createList() {
        // リストを生成
        presenter.createPokemonList()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfPokemons
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonItemCell") as! PokemonItemCell
        
        // cellに表示項目をセット
        if let item = presenter.pokemon(forRow: indexPath.row) {
            cell.configure(item: item)
        }
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell 選択時の処理を書く
        if let item = presenter.pokemon(forRow: indexPath.row) {
            let storyboard = UIStoryboard(name: "PokemonDetail", bundle: nil)
            let detailVC = storyboard.instantiateViewController(withIdentifier: "detail") as! PokemonDetailViewController
            detailVC.pokemonId = item.id
            self.present(detailVC, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}

extension ViewController: PokemonListPresenterOutput {
    func updateUsers() {
        pokemonListTableView.reloadData()
    }
}

