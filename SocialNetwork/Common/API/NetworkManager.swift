//
//  NetworkManager.swift
//  SocialNetwork
//
//  Created by Taras Kiriienko on 30/11/2019.
//  Copyright © 2019 Taras Kiriienko. All rights reserved.
//

import Foundation
import Moya
import Moya_ModelMapper
import Result

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private let provider = MoyaProvider<ApiTarget>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    // MARK: Methods - Auth
    
    func getPeople(completion: @escaping ([Person]?, Problem?) -> Void) {
        request(.getPeople) { result in
            self.proceedResponse(result) { response, error in
                guard let response = response else {
                    completion(nil, error)
                    return
                }
                
                let people = try? response.map(to: [Person].self)
                completion(people, nil)
            }
        }
    }
    
    func addPerson(_ person: Person, completion: @escaping (Problem?) -> Void) {
        request(.addPerson(person)) { result in
            self.proceedResponse(result) { response, error in
                guard let _ = response else {
                    completion(error)
                    return
                }
                
                completion(nil)
            }
        }
    }
    
    func updatePerson(_ person: Person, completion: @escaping (Problem?) -> Void) {
        request(.updatePerson(person)) { result in
            self.proceedResponse(result) { response, error in
                guard let _ = response else {
                    completion(error)
                    return
                }
                
                completion(nil)
            }
        }
    }
    
}

extension NetworkManager {
    
    func request(_ target: ApiTarget, completion: @escaping Completion) {
        provider.request(target, completion: completion)
    }
    
    func proceedResponse(_ result: Result<Moya.Response, MoyaError>, completion: @escaping (Moya.Response?, Problem?) -> Void) {
        switch result {
        case let .success(response):
            do {
                let _ = try response.filterSuccessfulStatusCodes()
                completion(response, nil)
            } catch {
                let problem = try? response.map(to: Problem.self)
                completion(nil, problem)
            }
        case let .failure(error):
            completion(nil, Problem(error: error.localizedDescription))
        }
    }
    
}
