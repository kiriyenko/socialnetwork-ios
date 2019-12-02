//
//  String.swift
//  SocialNetwork
//
//  Created by Taras Kiriienko on 02/12/2019.
//  Copyright © 2019 Taras Kiriienko. All rights reserved.
//

import UIKit

extension UITextField {
    
    func hasEmail() -> Bool {
        guard let text = text else { return false }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: text)
    }
    
}
