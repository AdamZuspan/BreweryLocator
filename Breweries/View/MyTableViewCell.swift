//
//  MyTableViewCell.swift
//  Breweries
//
//  Created by Admin on 8/25/18.
//  Copyright © 2018 MobileAppsCompany. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var dividerTopImage: UIImageView!
    @IBOutlet weak var dividerImage: UIImageView!
    @IBOutlet weak var myCell: UILabel!
    @IBOutlet weak var myCellState: UILabel!
    @IBOutlet weak var myCellCity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
