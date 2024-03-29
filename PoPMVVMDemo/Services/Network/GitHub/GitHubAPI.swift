//
//  GitHubAPI.swift
//  PoPMVVMDemo
//  PoPMVVMDemo
//
//  Created by Mukesh Lokare on 03/12/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation
import Moya

// MARK: - Provider setup

private func JSONResponseDataFormatter(_ data: Data) -> String {
  do {
    let dataAsJSON = try JSONSerialization.jsonObject(with: data)
    let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
    return String(data: prettyData, encoding: .utf8) ?? ""
  } catch {
    if JSONSerialization.isValidJSONObject(data) {
        return String(data: data, encoding: .utf8) ?? ""
    }
    return ""
  }
}

let configuration = NetworkLoggerPlugin.Configuration(
    formatter: NetworkLoggerPlugin.Configuration.Formatter(
        requestData: JSONResponseDataFormatter,
        responseData: JSONResponseDataFormatter
    ),
    logOptions: .verbose
)
let GitHubProvider = MoyaProvider<GitHub>(plugins: [NetworkLoggerPlugin(configuration: configuration)])

// MARK: - Provider support

public enum GitHub {
  case zen
  case userProfile(String)
  case userRepositories(String)
}

extension GitHub: TargetType {
    
  public var baseURL: URL { return URL(string: "https://api.github.com")! }
  public var path: String {
    switch self {
    case .zen:
      return "/zen"
    case .userProfile(let name):
      return "/users/\(name.urlEscapedString)"
    case .userRepositories(let name):
      return "/users/\(name.urlEscapedString)/repos"
    }
  }
  public var method: Moya.Method {
    return .get
  }
  public var parameters: [String: Any]? {
    switch self {
    case .userRepositories(_):
      return ["sort": "pushed"]
    default:
      return nil
    }
  }
  public var task: Task {
    return Task.requestPlain
  }
  public var headers: [String : String]? {
    return nil
  }
  public var sampleData: Data {
    switch self {
    case .zen:
      return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!
    case .userProfile(let name):
      return "{\"login\": \"\(name)\", \"id\": 100}".data(using: String.Encoding.utf8)!
    case .userRepositories(_):
      return "[{\"name\": \"Repo Name\"}]".data(using: String.Encoding.utf8)!
    }
  }
}

public func url(_ route: TargetType) -> String {
  return route.baseURL.appendingPathComponent(route.path).absoluteString
}
