//
//  feedVC.swift
//  devslopes-social
//
//  Created by Guillermo Greco Jr. on 6/4/17.
//  Copyright © 2017 Guillermo Greco Jr. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class feedVC: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    @IBAction func signOutBtn(_ sender: Any) {
        
        
        try! Auth.auth().signOut()
        
        
        let removeSuccessful: Bool = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print(removeSuccessful)
        performSegue(withIdentifier: "gotToSignIn", sender: nil)
    }

    

}
