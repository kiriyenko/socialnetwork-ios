//
//  BaseViewController.swift
//  SocialNetwork
//
//  Created by Taras Kiriienko on 28/11/2019.
//  Copyright © 2019 Taras Kiriienko. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    // MARK: Setups
    
    func setupView() {
        // configure navigation bar appearance
        configureNavigationBar()
        
        // jumpy large title bar fix - also set table view top to superview
        extendedLayoutIncludesOpaqueBars = true
    }
    
    // MARK: Methods
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .darkColor
    }
    
}
