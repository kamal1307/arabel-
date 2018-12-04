//
//  ProgammationCell.swift
//  arabelFM1.0
//
//  Created by Admin on 21/11/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ProgammationCell: UITableViewCell {

    @IBOutlet weak var imgProgra: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
