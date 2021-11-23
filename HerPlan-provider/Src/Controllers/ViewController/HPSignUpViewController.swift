//
//  HPSignUpViewController.swift
//  HerPlan
//
//  Created by Kuldipsinh Chavda on 11/11/21.
//  Copyright © 2021 Bacancy. All rights reserved.
//

import UIKit

class HPSignUpViewController: UIViewController {

    @IBOutlet var password: UITextField!
    @IBOutlet var reEnterpassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func SignIn(_ sender: UIButton) {
        
        if password.text!.isEmpty || reEnterpassword.text!.isEmpty {
            let alert = UIAlertController(title: "invalid" , message: "Please fill all the fields.", preferredStyle: .alert)
            let saveAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alert.addAction(saveAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        else{
        
        if CommonMethods.isPasswordValid(password.text ?? "") {
            
        }
        else {
            let alert = UIAlertController(title: "invalid" , message: "Please enter a storng password.", preferredStyle: .alert)
            let saveAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alert.addAction(saveAction)
            self.present(alert, animated: true, completion: nil)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
