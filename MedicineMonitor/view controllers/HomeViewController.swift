//
//  HomeViewController.swift
//  MedicineMonitor
//
//  Created by Anish Adhikari on 4/10/18.
//  Copyright © 2018 Anish Adhikari. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 180
        //print("loaded")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicineCell") as! MedicineCell
       
        let shadowColor = UIColor.white
        let shadowOffsetWidth: Int = 10
        let shadowOffsetHeight = 10
        let shadowOpacity: Float = 0.5
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = false
        
        cell.layer.shadowColor = shadowColor.cgColor
        cell.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        cell.layer.shadowOpacity = shadowOpacity
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.00).cgColor
        
        if (indexPath.row == 0) {
            cell.timeLabel.text = "8:00"
            cell.status1ImageView.image = UIImage(named: "icons8-checked-checkbox-26")
            cell.status2ImageView.image = UIImage(named: "icons8-unchecked-checkbox-26")
        } else if (indexPath.row == 1) {
            cell.timeLabel.text = "18:00"
            cell.status1ImageView.image = UIImage(named: "icons8-unchecked-checkbox-26")
            cell.status2ImageView.image = UIImage(named: "icons8-unchecked-checkbox-26")
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    @IBAction func takeVideoButtonTap(_ sender: Any) {
        performSegue(withIdentifier: "videoSegue", sender: nil)
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
