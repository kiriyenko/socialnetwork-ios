//
//  PeopleViewController.swift
//  SocialNetwork
//
//  Created by Taras Kiriienko on 28/11/2019.
//  Copyright © 2019 Taras Kiriienko. All rights reserved.
//

import UIKit

class PeopleViewController: BaseViewController {
    
    @IBOutlet weak var contentTableView: UITableView!
    
    // MARK: Setups
    
    override func setupView() {
        super.setupView()
        contentTableView.tableFooterView = UIView()
        contentTableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }
    
    // MARK: Actions
    
    @IBAction func addButtonTouched(_ sender: Any) {
        HapticManager.shared.generateFeedback(.selection)
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "ManagePeopleViewController") as? ManagePeopleViewController else { return }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension PeopleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleTableViewCell") as! PeopleTableViewCell
        cell.configure()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        HapticManager.shared.generateFeedback(.selection)
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "ManagePeopleViewController") as? ManagePeopleViewController else { return }
        viewController.setPerson(Person(name: "Name", surname: "Surname", email: "email@example.com"))
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! PeopleTableViewCell
        cell.highlight()
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! PeopleTableViewCell
        cell.unhighlight()
    }
    
}
