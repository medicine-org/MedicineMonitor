//
//  MedicationCell.swift
//  MedicineMonitor
//
//  Created by Anish Adhikari on 4/15/18.
//  Copyright © 2018 Anish Adhikari. All rights reserved.
//

import UIKit

class MedicationCell: UITableViewCell {
    
    @IBOutlet weak var medicationPillTitleLabel: UILabel!
    @IBOutlet weak var medicationPillQuantityLabel: UILabel!
    @IBOutlet weak var medicationPillImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
