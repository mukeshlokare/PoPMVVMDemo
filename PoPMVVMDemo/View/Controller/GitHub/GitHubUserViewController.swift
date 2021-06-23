//
//  GitHubUserViewController.swift
//  PoPMVVMDemo
//
//  Created by abc on 23/06/21.
//

import UIKit

class GitHubUserViewController: UIViewController, Storyboarded {

    @IBOutlet weak var usernameLabel: UILabel!
    
    weak var coordinator: MainCoordinator?
    var repository : Repository?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureLabel()
    }

    private func configureLabel(){
        if let cloneURL = repository?.cloneURL{
            self.usernameLabel.text = "\(cloneURL)"
        }
    }
}
