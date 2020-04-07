//
//  PokemonItemCell.swift
//  GraphQLStudyApp
//
//  Created by Masataka Miyagawa on 2020/04/05.
//  Copyright © 2020 Masataka Miyagawa. All rights reserved.
//

import UIKit

class PokemonItemCell: UITableViewCell {
        
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    private var task: URLSessionTask?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(item: PokemonListItem) {
        // icon と nameをセットする処理
        let url = URL(string: item.image)
        let task = URLSession.shared.dataTask(with: url!, completionHandler: { data, response, error in
            guard let imageData = data else {
                return
            }
            
            DispatchQueue.global().async { [weak self] in
                guard let image = UIImage(data: imageData) else {
                    return
                }

                DispatchQueue.main.async {
                    self?.iconImageView?.image = image
                    self?.nameLabel.text = item.name

                    self?.setNeedsLayout()
                }
            }
        })
        task.resume()
    }
}
