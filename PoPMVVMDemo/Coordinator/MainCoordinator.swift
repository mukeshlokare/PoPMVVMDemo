//
//  MainCoordinator.swift
//  PoPMVVMDemo
//
//  Created by Mukesh Lokare on 20/06/21.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = GitHubRepoListViewController.gitHubStoryboardInstantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToGitHubUserScene(repo: Repository) {
        let vc = GitHubUserViewController.gitHubStoryboardInstantiate()
        vc.repository = repo
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
