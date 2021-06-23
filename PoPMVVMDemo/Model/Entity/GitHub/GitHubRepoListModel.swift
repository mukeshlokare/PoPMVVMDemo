//
//  RepositoryModel.swift
//  PoPMVVMDemo
//
//  Created by Mukesh Lokare on 03/12/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation

struct Repository: Codable {

    var keysURL: String
    var statusesURL: String
    var issuesURL: String
    var defaultBranch: String
    var issueEventsURL: String?
    var id: Int
    var owner: Owner
    var cloneURL: String
    var URL: String
    var fullname: String
    
    enum CodingKeys: String, CodingKey {
        case keysURL = "keys_url"
        case statusesURL = "statuses_url"
        case issuesURL = "issues_url"
        case defaultBranch = "default_branch"
        case issueEventsURL = "issues_events_url"
        case id = "id"
        case owner = "owner"
        case cloneURL = "clone_url"
        case URL = "url"
        case fullname = "full_name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.keysURL = try container.decodeIfPresent(String.self, forKey: .keysURL) ?? ""
        self.statusesURL = try container.decodeIfPresent(String.self, forKey: .statusesURL) ?? ""
        self.issuesURL = try container.decodeIfPresent(String.self, forKey: .issuesURL) ?? ""
        self.defaultBranch = try container.decodeIfPresent(String.self, forKey: .defaultBranch) ?? ""
        self.issueEventsURL = try container.decodeIfPresent(String.self, forKey: .issueEventsURL) ?? ""
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.owner = try container.decodeIfPresent(Owner.self, forKey: .owner)!
        self.cloneURL = try container.decodeIfPresent(String.self, forKey: .cloneURL) ?? ""
        self.URL = try container.decodeIfPresent(String.self, forKey: .URL) ?? ""
        self.fullname = try container.decodeIfPresent(String.self, forKey: .fullname) ?? ""
    }
}

struct Owner: Codable {

    let id: Int
    let organizationsURL: String
    let receivedEventsURL: String
    let followingURL: String
    let login: String
    let avatarURL: String
    let reposURL: String
    let followersURL: String

 
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case organizationsURL = "organizations_url"
        case receivedEventsURL = "received_events_url"
        case followingURL = "following_url"
        case login = "login"
        case avatarURL = "avatar_url"
        case reposURL = "repos_url"
        case followersURL = "followers_url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.organizationsURL =  try container.decodeIfPresent(String.self, forKey: .organizationsURL) ?? ""
        self.receivedEventsURL = try  container.decodeIfPresent(String.self, forKey: .receivedEventsURL) ?? ""
        self.followingURL = try container.decodeIfPresent(String.self, forKey: .followingURL) ?? ""
        self.login = try container.decodeIfPresent(String.self, forKey: .login) ?? ""
        self.avatarURL = try container.decodeIfPresent(String.self, forKey: .avatarURL) ?? ""
        self.reposURL = try container.decodeIfPresent(String.self, forKey: .reposURL) ?? ""
        self.followersURL = try container.decodeIfPresent(String.self, forKey: .followersURL) ?? ""
    }
}
