//
//  HPCreatePasswordViewController.swift
//  HerPlan
//
//  Created by Kuldipsinh Chavda on 11/11/21.
//  Copyright © 2021 Bacancy. All rights reserved.
//


import UIKit
import FBSDKLoginKit

class HPCreatePasswordViewController: UIViewController {
     
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var address: UITextField!
    @IBOutlet var city: UITextField!
    @IBOutlet var state: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var phone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
 
    //MARK:- ACTION METHODS
    @IBAction func signInWithFacebook(_ sender: UIButton) {
        let fbLoginManager : LoginManager = LoginManager()
        //fbLoginManager.logOut()
        
        fbLoginManager.logIn(permissions:["public_profile", "email"], from: self, handler: { (result, error) -> Void in
            if ((error) != nil)
            {
                // Process error
                //  print(error)
            }
            else if (result?.isCancelled)!
            {
                // Handle cancellations
                // print(error)
            }
            else
            {
                let fbloginresult : LoginManagerLoginResult = result!
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                    // fbLoginManager.logOut()
                }
            }
        })
    }
    
    
 //MARK:- FAACEBOOK LOGIN
    func getFBUserData () {
        if((AccessToken.current) != nil){
            GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(normal), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    
                    print((result! as AnyObject))
                    //  print(((result! as AnyObject).value(forKey: "id") as? String)!)
                    
                }
            })
        }
    }

    @IBAction func createPassword(_ sender: UIButton) {
        
        if firstName.text!.isEmpty || lastName.text!.isEmpty || address.text!.isEmpty || state.text!.isEmpty || city.text!.isEmpty || email.text!.isEmpty || phone.text!.isEmpty  {
            let alert = UIAlertController(title: "invalid" , message: "Please fill all the fields.", preferredStyle: .alert)
            let saveAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alert.addAction(saveAction)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        else {
            
        if CommonMethods.isValidEmail(string: email.text!) == true{
            let aVc = storyboard?.instantiateViewController(withIdentifier: "HPSignUpViewController") as! HPSignUpViewController
            navigationController?.pushViewController(aVc, animated: true)
        }
        else {
            let alert = UIAlertController(title: "invalid" , message: "Please enter a valid Email.", preferredStyle: .alert)
            let saveAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alert.addAction(saveAction)
            self.present(alert, animated: true, completion: nil)
            }
        
        }
    }
}
