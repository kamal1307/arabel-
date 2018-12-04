   //
//  MenuTableViewCell.swift
//  arabelFM1.0
//
//  Created by Admin on 27/09/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var label_Menu: UILabel!
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
            
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
