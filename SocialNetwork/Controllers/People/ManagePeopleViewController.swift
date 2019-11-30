//
//  ManagePeopleViewController.swift
//  SocialNetwork
//
//  Created by Taras Kiriienko on 29/11/2019.
//  Copyright © 2019 Taras Kiriienko. All rights reserved.
//

import UIKit

enum ManageType: String {
    case create = "Add Person"
    case edit = "Edit Person"
}

class ManagePeopleViewController: BaseViewController {
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var surnameInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var finishButton: UIButton!
    
    private var manageType: ManageType = .create
    private var person: Person?
    
    // MARK: Setups
    
    override func setupView() {
        super.setupView()
        manageType = person != nil ? .edit : .create
        
        title = manageType.rawValue
        let finishButtonTitle = manageType == .create ? "Add Person" : "Save Person"
        finishButton.setTitle(finishButtonTitle, for: .normal)
        
        finishButton.layer.cornerRadius = 10
    }
    
    // MARK: Validators
        
    private func isInputsValid() -> Bool {
        return nameInput.hasText && surnameInput.hasText && emailInput.hasText
    }
     
    private func isEmailValid() -> Bool {
        guard let email = emailInput.text else { return false }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    // MARK: Methods
    
    func setPerson(_ person: Person) {
        self.person = person
    }
    
    // MARK: Actions
    
    @IBAction func finishButtonTouched(_ sender: Any) {
        if !isInputsValid() {
            showAlert(title: "Error", message: "All inputs must be filled!", action: nil)
            return
        } else if !isEmailValid() {
            showAlert(title: "Error", message: "Enter the correct email!", action: nil)
            return
        }
        
        navigationController?.popViewController(animated: true)
    }
    
}
