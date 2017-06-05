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
import SwiftKeychainWrapper

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID){
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
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
                self.performSegue(withIdentifier: "goToFeed", sender: nil)
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
                self.completeSignIn(id: (user?.uid)!)
                
                
            }
        }
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        if let email = emailField.text, let password = passwordField.text {
            
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil{
                    print("Guillermo: User successfully authenticated with firebase via email sign in")
                    self.completeSignIn(id: (user?.uid)!)
                    
                }
                else{
                    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil{
                            print("Guillermo: Unable to authenticate with Firebase using email")
                        } else{
                            print("Guillermo: Successfully authenticated via to firebase via email")
                            self.completeSignIn(id: (user?.uid)!)
                        }
                    })
                }
            })
        }
    
        
        
    }
    
    func completeSignIn(id: String){
        
        let keychainResult = KeychainWrapper.standard.set( id, forKey: KEY_UID)
        print("Guillermo: Data saved to the keychain \(keychainResult)")
        self.performSegue(withIdentifier: "goToFeed", sender: nil)
        }
}

    


