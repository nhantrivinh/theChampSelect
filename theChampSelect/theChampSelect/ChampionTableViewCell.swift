//
//  ChampionTableViewCell.swift
//  theChampSelect
//
//  Created by AndAnotherOne on 4/7/16.
//  Copyright © 2016 AndAnotherOne. All rights reserved.
//

import UIKit

class ChampionTableViewCell: UITableViewCell {
    @IBOutlet weak var champ_image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(champion: Champion) {
        name.text = champion.name
        champ_image.image = champion.getChampionImage()
    }


}
