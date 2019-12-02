//
//  Person.swift
//  SocialNetwork
//
//  Created by Taras Kiriienko on 30/11/2019.
//  Copyright © 2019 Taras Kiriienko. All rights reserved.
//

import Mapper

struct Person: Mappable {
    
    var ident: Int?
    var name: String?
    var surname: String?
    var email: String?
    var avatarUrl: String?
    
    var fullName: String {
        guard let name = name, let surname = surname else { return "" }
        return "\(name) \(surname)"
    }
    
    // MARK: Inits
    
    init(ident: Int?, name: String?, surname: String?, email: String?, avatarUrl: String?) {
        self.ident = ident
        self.name = name
        self.surname = surname
        self.email = email
        self.avatarUrl = avatarUrl
    }
    
    init(map: Mapper) throws {
        ident = map.optionalFrom("id")
        name = map.optionalFrom("first_name")
        surname = map.optionalFrom("last_name")
        email = map.optionalFrom("email")
        avatarUrl = map.optionalFrom("avatar_url")
    }
        
    // MARK: Methods
    
    func parameters() -> [String: String] {
        return [
            "first_name": name ?? "",
            "last_name": surname ?? "",
            "email": email ?? ""
        ]
    }
    
}
