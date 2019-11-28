//
//  CALayer.swift
//  SocialNetwork
//
//  Created by Taras Kiriienko on 28/11/2019.
//  Copyright © 2019 Taras Kiriienko. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    
    func setupShadow(color: UIColor = .lightGray, alpha: Float = 0.3, x: CGFloat = 0, y: CGFloat = 0, blur: CGFloat = 12, spread: CGFloat = 0) {
        masksToBounds = false
        
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        
        if spread == 0 {
            shadowPath = nil
            return
        }
        
        let dxValue = -spread
        let rect = bounds.insetBy(dx: dxValue, dy: dxValue)
        shadowPath = UIBezierPath(rect: rect).cgPath
    }
    
}
