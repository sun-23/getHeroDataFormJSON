//
//  CellHeroTableViewCell.swift
//  superHeroJSON
//
//  Created by sun on 26/4/2562 BE.
//  Copyright © 2562 sun. All rights reserved.
//

import UIKit

class CellHeroTableViewCell: UITableViewCell {

    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageUrl: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
