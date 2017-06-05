//
//  circleView.swift
//  devslopes-social
//
//  Created by Guillermo Greco Jr. on 6/4/17.
//  Copyright © 2017 Guillermo Greco Jr. All rights reserved.
//

import UIKit

class circleView: UIImageView {

   
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width/2
        clipsToBounds = true
    }

}
