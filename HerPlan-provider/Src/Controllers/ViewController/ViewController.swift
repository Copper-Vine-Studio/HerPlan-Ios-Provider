//
//  ViewController.swift
//  SampleProject
//
//  Created by Bacancy Technology on 30/12/19.
//  Copyright © 2021 Bacancy Technology. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
             super.viewWillAppear(animated)
             navigationController?.setNavigationBarHidden(true, animated: animated)
         }
         
         override func viewWillDisappear(_ animated: Bool) {
             super.viewWillDisappear(animated)
             navigationController?.setNavigationBarHidden(false, animated: animated)
         }
    
    @IBAction func SignIn(_ sender: UIButton) {
        let aVc = self.storyboard?.instantiateViewController(identifier: "HPCreatePasswordViewController") as! HPCreatePasswordViewController
        navigationController?.pushViewController(aVc, animated: true)
    }
    
    @IBAction func LognIn(_ sender: UIButton) {
        let aVc = self.storyboard?.instantiateViewController(identifier: "HPLoginViewController") as! HPLoginViewController
        navigationController?.pushViewController(aVc, animated: true)
    }
  
}


//if let token = AccessToken.current,
//        !token.isExpired {
//    let token = token.tokenString
//    let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["field": "email,name"], tokenString: token, version: nil, httpMethod: .get)
//    request.start { (connection, result, error) in
//
//        print("\(result!)")
//        // User is logged in, do work such as go to next view controller.
//    }
//
//        // User is logged in, do work such as go to next view controller.
//    }
//else{
//    let loginButton = FBLoginButton()
//    loginButton.center = view.center
//    loginButton.delegate = self
//    loginButton.permissions = ["public_profile", "email"]
//    view.addSubview(loginButton)
//}
//func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
//    let token = result?.token?.tokenString
//    let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["field": "email,name"], tokenString: token, version: nil, httpMethod: .get)
//    request.start { (connection, result, error) in
//
//        print("\(result ?? "")")
//    }
//}
//
//func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
//}
