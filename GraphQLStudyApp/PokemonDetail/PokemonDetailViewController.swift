//
//  PokemonDetailViewController.swift
//  GraphQLStudyApp
//
//  Created by Masataka Miyagawa on 2020/04/05.
//  Copyright © 2020 Masataka Miyagawa. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    private var presenter: PokemonDetailPresenterInput!
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typesLabel: UILabel!
    @IBOutlet weak var weaknessLabel: UILabel!
    @IBOutlet weak var evolutionsLabel: UILabel!
    
    var pokemonId: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setup(self.pokemonId!)
    }
    
    private func setup(_ id: String) {
        self.presenter = PokemonDetailPresenter(view: self)
        presenter.getPokemonDetail(id: id)
    }

    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension PokemonDetailViewController: PokemonDetailPresenterOutput {
    func updateItem(detail: PokemonDetailItem) {
        let url = URL(string: detail.image)
        let task = URLSession.shared.dataTask(with: url!, completionHandler: { data, response, error in
            guard let imageData = data else {
                return
            }
            
            DispatchQueue.global().async { [weak self] in
                guard let image = UIImage(data: imageData) else {
                    return
                }

                DispatchQueue.main.async {
                    self?.iconImage?.image = image
                    self?.numberLabel.text = "No." + detail.number
                    self?.nameLabel.text = detail.name
                    
                    var typesText = "types: "
                    for (index, type) in detail.types.enumerated() {
                        typesText += type
                        if index < detail.types.endIndex - 1 {
                            typesText += ", "
                        }
                    }
                    self?.typesLabel.text = typesText
                    
                    var weaknessText = "weakness: "
                    for (index, weak) in detail.weaknesses.enumerated() {
                        weaknessText += weak
                        if index < detail.weaknesses.endIndex - 1 {
                            weaknessText += ", "
                        }
                    }
                    self?.weaknessLabel.text = weaknessText
                    
                    var evolutionsText = "evolutions: "
                    for (index, evolution) in detail.evolutions.enumerated() {
                        evolutionsText += evolution
                        if index < detail.evolutions.endIndex - 1 {
                            evolutionsText += ", "
                        }
                    }
                    self?.evolutionsLabel.text = evolutionsText

                    self?.view.setNeedsDisplay()
                }
            }
        })
        task.resume()

    }
    
}
