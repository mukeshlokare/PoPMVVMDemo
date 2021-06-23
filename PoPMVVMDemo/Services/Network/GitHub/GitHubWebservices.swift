//
//  GitHubWebservices.swift
//  PoPMVVMDemo
//
//  Created by Mukesh Lokare on 03/12/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation

protocol GitHubWebservicesProtocol {
    func fetchRepositories(parameter: GitHubRepoListParameter, completionHandler: @escaping(ApiResponse<[Repository]>)->())
}
 
struct GitHubWebservices: GitHubWebservicesProtocol {
   
    private let service: NetworkManager<GitHub>
    
    init(service: NetworkManager<GitHub> = NetworkManager<GitHub>()) {
        self.service = service
    }
        
    internal func fetchRepositories(parameter: GitHubRepoListParameter, completionHandler: @escaping (ApiResponse<[Repository]>) -> ()) {
        service.requestObject(path: .userRepositories(parameter.name), completionHandler: completionHandler)
    }
    
}
