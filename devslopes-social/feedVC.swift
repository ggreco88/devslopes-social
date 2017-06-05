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

class feedVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

     
    }
    
    @IBAction func signOutBtn(_ sender: Any) {
        
        
        try! Auth.auth().signOut()
        
        
        let removeSuccessful: Bool = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print(removeSuccessful)
        performSegue(withIdentifier: "gotToSignIn", sender: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        
    }

    

}
