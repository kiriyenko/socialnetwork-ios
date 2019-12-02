//
//  PeopleManager.swift
//  SocialNetwork
//
//  Created by Taras Kiriienko on 30/11/2019.
//  Copyright © 2019 Taras Kiriienko. All rights reserved.
//

import Foundation

class PeopleManager: NSObject {
    
    static let shared = PeopleManager()
    
    var people = [Person]()
    
    // MARK: Methods
    
    func getPeople(completion: @escaping (Problem?) -> Void) {
        NetworkManager.shared.getPeople { response, problem in
            if let problem = problem {
                completion(problem)
                return
            }
            
            guard let response = response else {
                completion(Problem(error: "Failed load people list"))
                return
            }
            
            self.people = response
            completion(nil)
        }
    }
    
    func addPerson(_ person: Person, completion: @escaping (Problem?) -> Void) {
        NetworkManager.shared.addPerson(person) { problem in
            if let problem = problem {
                completion(problem)
                return
            }
            
            completion(nil)
        }
    }
    
    func updatePerson(_ person: Person, completion: @escaping (Problem?) -> Void) {
        NetworkManager.shared.updatePerson(person) { problem in
            if let problem = problem {
                completion(problem)
                return
            }
            
            completion(nil)
        }
    }
    
}
