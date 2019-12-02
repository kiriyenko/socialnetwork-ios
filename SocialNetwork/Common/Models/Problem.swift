//
//  Problem.swift
//  SocialNetwork
//
//  Created by Taras Kiriienko on 30/11/2019.
//  Copyright © 2019 Taras Kiriienko. All rights reserved.
//

import Mapper

struct Problem: Mappable {
    
    var error: String
    
    // MARK: Inits
    
    init(error: String) {
        self.error = error
    }
    
    init(map: Mapper) throws {
        error = try map.from("error")
    }
    
}
