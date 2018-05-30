//
//  MedicationViewController.swift
//  MedicineMonitor
//
//  Created by Anish Adhikari on 4/15/18.
//  Copyright © 2018 Anish Adhikari. All rights reserved.
//

import UIKit

class MedicationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 70
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell") as! MedicationCell
        if indexPath.row == 0 {
            cell.medicationPillTitleLabel.text = "AK-Spore HC Ophth Oint"
            cell.medicationPillImageView.image = UIImage(named: "icons8-pill-filled-50")
            cell.medicationPillQuantityLabel.text = ""
        } else if indexPath.row == 1 {
            cell.medicationPillTitleLabel.text = "Parafon Forte DSC"
            cell.medicationPillImageView.image = UIImage(named: "icons8-pill-filled-50-2")
            cell.medicationPillQuantityLabel.text = "500 mg"

        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
