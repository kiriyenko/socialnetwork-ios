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
        
        if manageType == .edit { setupPerson() }
    }
    
    private func setupPerson() {
        guard let person = person else { return }
        if let name = person.name { nameInput.text = name }
        if let surname = person.surname { surnameInput.text = surname }
        if let email = person.email { emailInput.text = email }
    }
    
    // MARK: Validators
        
    private func validateInputs() -> Bool {
        let isInputsValid = nameInput.hasText && surnameInput.hasText && emailInput.hasText
        
        if !isInputsValid {
            showAlert(title: "Error", message: "Please, fill up all inputs", action: nil)
            return false
        } else if !emailInput.hasEmail() {
            showAlert(title: "Error", message: "Please, enter correct email", action: nil)
            return false
        }
        
        return true
    }
    
    // MARK: Methods
    
    func setPerson(_ person: Person) {
        self.person = person
    }
    
    private func finishManagment(problem: Problem?) {
        if let problem = problem {
            self.showAlert(title: "Error", message: problem.error, action: nil)
            return
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: Actions
    
    @IBAction func finishButtonTouched(_ sender: Any) {
        if !validateInputs() { return }
        
        var updatedPerson = Person(ident: nil, name: nameInput.text, surname: surnameInput.text, email: emailInput.text, avatarUrl: nil)
        
        if manageType == .create {
            PeopleManager.shared.addPerson(updatedPerson) { problem in
                self.finishManagment(problem: problem)
                return
            }
        }
        
        guard let person = person else { return }
        updatedPerson.ident = person.ident ?? 0
        
        PeopleManager.shared.updatePerson(updatedPerson) { problem in
            self.finishManagment(problem: problem)
        }
    }
    
}
