//
//  MenuViewController.swift
//  MedicineMonitor
//
//  Created by Anish Adhikari on 5/3/18.
//  Copyright © 2018 Anish Adhikari. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var number = "2026409965"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickedContactButton(_ sender: Any) {
        guard let number = URL(string: "tel://" + number) else { return }
        UIApplication.shared.open(number)
    }
    
    @IBAction func clickedLogOutButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Logout", message: "Do you want to log out?", preferredStyle: .alert)
        let logoutAction = UIAlertAction(title: "Logout", style: .default, handler: {(action: UIAlertAction!) in
            
            NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        alertController.addAction(logoutAction)
        
        present(alertController, animated: true)
    
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
