//
//  WaitView.swift
//  SocialNetwork
//
//  Created by Taras Kiriienko on 02/12/2019.
//  Copyright © 2019 Taras Kiriienko. All rights reserved.
//

import UIKit

class WaitView: UIView {
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    private var animationDuration: TimeInterval = 0.3
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        runShowAnimation()
        setupView()
    }
    
    // MARK: Setups
    
    private func setupView() {
        holderView.layer.cornerRadius = 10
        indicatorView.startAnimating()
    }
    
    // MARK: Methods
    
    private func runShowAnimation() {
        alpha = 0
        UIView.animate(withDuration: animationDuration) {
            self.alpha = 1
        }
    }
    
    private func runHideAnimation(completion: @escaping () -> Void = {}) {
        alpha = 1
        UIView.animate(withDuration: animationDuration, animations: {
            self.alpha = 0
        }) { _ in
            completion()
        }
    }
    
    func hide() {
        removeFromSuperview()
    }
    
}
