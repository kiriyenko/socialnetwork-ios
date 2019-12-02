//
//  ApiTarget.swift
//  SocialNetwork
//
//  Created by Taras Kiriienko on 30/11/2019.
//  Copyright © 2019 Taras Kiriienko. All rights reserved.
//

import Foundation
import Moya

enum ApiTarget {
    case getPeople
    case addPerson(_ person: Person)
    case updatePerson(_ person: Person)
}

extension ApiTarget: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://frogogo-test.herokuapp.com")!
    }
    
    var path: String {
        switch self {
        case .getPeople, .addPerson:
            return "/users.json"
        case let .updatePerson(person):
            return String(format: "/users/%i.json", person.ident ?? 0)
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPeople:
            return .get
        case .addPerson:
            return .post
        case .updatePerson:
            return .patch
        }
    }
    
    var task: Task {
        switch self {
        case .getPeople:
            return .requestPlain
        case let .addPerson(person):
            return .requestParameters(parameters: person.parameters(), encoding: JSONEncoding.default)
        case let .updatePerson(person):
            return .requestParameters(parameters: person.parameters(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var sampleData: Data {
        return "ok".utf8Encoded
    }
    
}

private extension String {
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
    
}

