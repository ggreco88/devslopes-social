//
//  ViewController.swift
//  devslopes-social
//
//  Created by Guillermo Greco Jr. on 6/3/17.
//  Copyright © 2017 Guillermo Greco Jr. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import Firebase
import FBSDKLoginKit
import FirebaseAuth

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil{
                print("Guillermo: Unable to authenticate with Facebook")
            }
            else if (result?.isCancelled == true){
                print("Guillermo: user cancelled Facebook authentication")
            }
            else{
                print("Guillermo: Successfully authenticated with facebook")
                let crededntial = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(crededntial)
            }
        }
        
    }
    
    func firebaseAuth(_ credential: AuthCredential){
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil {
                print("Guillermo: Unable to authenticate to Firebase")
            }
            else {
                print("Guillermo: Successfully authenticated to Firebase")
            }
        }
    }
    
    
}

