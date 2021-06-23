//
//  GitHubRepoListViewController.swift
//  PoPMVVMDemo
//
//  Created by Mukesh Lokare on 03/12/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import UIKit

class GitHubRepoListViewController: UIViewController, Storyboarded {
    
    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var gitHubViewModel : GitHubRepoListViewProtocol!
    private var dataSource : GitHubListTableViewDataSource<GitHubTableViewCell,Repository>!
    
     var coordinator: MainCoordinator?

    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("coordinator \(String(describing: coordinator))")
        self.configureTableView() //Configure table
        self.configureSearchBar() //Configure Searchbar
        self.callViewModelToBindUI() //API Call
    }
    
    private func configureTableView(){
        //        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(view: GitHubTableViewCell.self)
    }
    
    private func configureSearchBar(){
        self.searchBar.delegate = self
    }
    
    private func updateDataSource(){
        self.dataSource = GitHubListTableViewDataSource(cellIdentifier: "GitHubTableViewCell", items: self.gitHubViewModel.repository ?? [Repository](), configureCell: { (cell, repository) in
            cell.usernameLabel.text = repository.fullname
            cell.profileImageView.image = UIImage(systemName:"heart.fill")
        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }
    
    private func callViewModelToBindUI(){
        gitHubViewModel = GitHubRepoListViewModel(gitHubWebService: GitHubWebservices())
        gitHubViewModel.fetchRepositories(username: "muk") {
            self.updateDataSource()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear")
    }
    
}

//MARK:- UISearchBarDelegate
extension GitHubRepoListViewController: UISearchBarDelegate{
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        gitHubViewModel.fetchRepositories(username: searchText) {
            self.updateDataSource()
        }
    }
}

//MARK:- UITableViewDelegate
extension GitHubRepoListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) Cell Clicked")
        
        if let repo = self.gitHubViewModel.repository?[indexPath.row]{
            print("coordinator \(String(describing: coordinator))")
            coordinator?.goToGitHubUserScene(repo: repo)
        }
        
    }
}
