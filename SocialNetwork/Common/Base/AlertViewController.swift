//
//  AlertViewController.swift
//  SocialNetwork
//
//  Created by Taras Kiriienko on 30/11/2019.
//  Copyright © 2019 Taras Kiriienko. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    private var waitView: WaitView?
    
    // MARK: Methods - Show Alert
    
    func showAlert(title: String?, message: String?, action: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: action))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: Methods - Show Waiting
    
    func showWaiting() {
        waitView = Bundle.main.loadNibNamed("WaitView", owner: self, options: nil)?[0] as? WaitView
        guard let waitView = waitView else { return }
        
        let window = UIApplication.shared.keyWindow!
        waitView.frame = window.bounds
        window.addSubview(waitView)
    }
    
    func hideWaiting() {
        guard let _waitView = waitView else { return }
        _waitView.hide()
        waitView = nil
    }
    
}
