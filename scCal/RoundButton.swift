//
//  RoundButton.swift
//  scCal
//
//  Created by 이승철 on 2017. 11. 26..
//  Copyright © 2017년 이승철. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
