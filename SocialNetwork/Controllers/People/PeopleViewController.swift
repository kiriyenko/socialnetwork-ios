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
    
    private var people = [Person]()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        refreshControl.tintColor = .darkColor
        return refreshControl
    }()
    
    // MARK: Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }
    
    // MARK: Setups
    
    override func setupView() {
        super.setupView()
        contentTableView.tableFooterView = UIView()
        contentTableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        contentTableView.refreshControl = refreshControl
    }
    
    // MARK: Methods
    
    private func loadData() {
        PeopleManager.shared.getPeople { problem in
            if let problem = problem {
                self.showAlert(title: "Error", message: problem.error, action: nil)
                return
            }
            
            self.people = PeopleManager.shared.people.reversed()
            self.contentTableView.reloadData()
        }
    }
    
    // MARK: Actions
    
    @IBAction func addButtonTouched(_ sender: Any) {
        HapticManager.shared.generateFeedback(.selection)
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "ManagePeopleViewController") as? ManagePeopleViewController else { return }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: Targets
    
    @objc private func refreshData() {
        PeopleManager.shared.getPeople { problem in
            if let problem = problem {
                self.showAlert(title: "Error", message: problem.error, action: nil)
                return
            }
            
            self.people = PeopleManager.shared.people.reversed()
            self.contentTableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
}

extension PeopleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleTableViewCell") as! PeopleTableViewCell
        let person = people[indexPath.row]
        cell.configure(person: person)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        HapticManager.shared.generateFeedback(.selection)
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "ManagePeopleViewController") as? ManagePeopleViewController else { return }
        let person = people[indexPath.row]
        viewController.setPerson(person)
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
