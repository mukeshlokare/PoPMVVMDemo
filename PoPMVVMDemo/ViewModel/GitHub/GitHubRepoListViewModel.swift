//
//  GitHubListViewModel.swift
//  PoPMVVMDemo
//
//  Created by Mukesh Lokare on 03/12/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation

protocol GitHubRepoListViewProtocol {
    //Output
    var repository : [Repository]? { get }
    var repositoryDidChange: ((GitHubRepoListViewProtocol) -> ())? { get set } // function to call when instance did change

    //Initializer
    init(gitHubWebService:GitHubWebservices?)
    
    //Function
    func fetchRepositories(username:String, completion:@escaping emptyCompletionHandler)
}

class GitHubRepoListViewModel: GitHubRepoListViewProtocol {
    
    private var gitHubWebService: GitHubWebservices?
    
    var repository: [Repository]?{
        didSet{
            self.repositoryDidChange?(self)
        }
    }
    
    var repositoryDidChange: ((GitHubRepoListViewProtocol) -> ())?
    
    required init(gitHubWebService:GitHubWebservices?) {
        self.gitHubWebService = gitHubWebService
    }
    
    
    func fetchRepositories(username:String, completion: @escaping emptyCompletionHandler) {
        
        let parameter = GitHubRepoListParameter(name:username)
        
        self.gitHubWebService?.fetchRepositories(parameter: parameter, completionHandler: { (response) in

            switch response {
            case .success(value: let response) :
                if response.count > 0 {
                    self.repository = response
                }
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
            completion()
        })
    }
}
