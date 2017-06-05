//
//  PostCell.swift
//  devslopes-social
//
//  Created by Guillermo Greco Jr. on 6/5/17.
//  Copyright © 2017 Guillermo Greco Jr. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

}
