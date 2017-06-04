//
//  RoundButton.swift
//  devslopes-social
//
//  Created by Guillermo Greco Jr. on 6/4/17.
//  Copyright © 2017 Guillermo Greco Jr. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

   
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 5.0, height: 1.0)
        
        imageView?.contentMode = .scaleAspectFit
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width/2
    }

}
