//
//  HPLoginViewController.swift
//  HerPlan
//
//  Created by admin on 11/11/21.
//  Copyright © 2021 Bacancy. All rights reserved.
//

import UIKit

class HPLoginViewController: UIViewController {
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logIn(_ sender: UIButton) {
        if email.text!.isEmpty || password.text!.isEmpty {
            let alert = UIAlertController(title: "invalid" , message: "Please fill all the fields.", preferredStyle: .alert)
            let saveAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alert.addAction(saveAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
