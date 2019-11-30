//
//  AlertViewController.swift
//  SocialNetwork
//
//  Created by Taras Kiriienko on 30/11/2019.
//  Copyright © 2019 Taras Kiriienko. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    // MARK: Methods
    
    func showAlert(title: String?, message: String?, action: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: action))
        present(alert, animated: true, completion: nil)
    }
    
}
