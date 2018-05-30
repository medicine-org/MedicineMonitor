//
//  MedicineCell.swift
//  MedicineMonitor
//
//  Created by Anish Adhikari on 4/10/18.
//  Copyright © 2018 Anish Adhikari. All rights reserved.
//

import UIKit

class MedicineCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var status1ImageView: UIImageView!
    @IBOutlet weak var status2ImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
