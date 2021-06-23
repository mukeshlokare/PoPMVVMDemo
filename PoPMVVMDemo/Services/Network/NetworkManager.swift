//
//  NetworkManager.swift
//  PoPMVVMDemo
//
//  Created by Mukesh Lokare on 03/12/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import Security
import Moya

protocol NetworkManagerProtocol {
    
    associatedtype Provider

    func requestObject<T: Codable>(path: Provider, completionHandler: @escaping(ApiResponse<T>)->())
    func performRequest(path: Provider, completionHandler: @escaping(ApiResponse<Any>)->())
    func performRequest(url:String, parameters:AnyDict, method:HTTPMethod, encoding:ParameterEncoding, headers:HTTPHeaders, completionHandler: @escaping(ApiResponse<Any>)->())
    func cancelTask(taskName:String)
}
struct NetworkManager<U: TargetType>: NetworkManagerProtocol {
    
    private let provider: MoyaProvider<U>
    
    init(provider: MoyaProvider<U> = MoyaProvider<U>()) {
      self.provider = provider
    }
    
    private let manager: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        configuration.timeoutIntervalForRequest = TimeInterval(AppConstant.maxRequestTime)
        configuration.timeoutIntervalForResource = TimeInterval(AppConstant.maxRequestTime)
        return Session(
            configuration: configuration)
    }()
    
    internal func requestObject<T: Codable>(path: U, completionHandler: @escaping(ApiResponse<T>)->()) {
        
        self.provider.request(path) { result in
            switch result {
            
            case .success(let value):
                do {
                    print("success :\(String(describing: String(data: value.data, encoding: .utf8)))")
                    let model: T = try JSONDecoder().decode(T.self, from: value.data )
                    print("Success 😍: \(model)")
                    completionHandler(.success(value: model))
                } catch let error {
                    print("Error 😥: \(error)")
                    completionHandler(.failure(error: error))
                }
            case .failure(let error):
                print("Error 😥: \(error)")
                completionHandler(.failure(error: error))
            }
        }
        
    }
    
    
    internal func performRequest(path: U, completionHandler: @escaping(ApiResponse<Any>)->()) {
        
        self.provider.request(path) { result in
            switch result {
            
            case .success(let value):
                completionHandler(.success(value: value.data))
            case .failure(let error):
                print("Error 😥: \(error)")
                completionHandler(.failure(error: error))
            }
        }
    }
    
    internal func performRequest(url:String, parameters:AnyDict, method:HTTPMethod, encoding:ParameterEncoding,headers:HTTPHeaders, completionHandler: @escaping(ApiResponse<Any>)->()) {
        manager.request(url,
                        method: method,
                        parameters: parameters,
                        encoding: encoding,
                        headers: headers).responseJSON { (response) in
                            switch response.result {
                            case .success(let value):
                                completionHandler(.success(value: value))
                            case .failure(let error):
                                completionHandler(.failure(error: error))
                            }
        }
    }
    internal func cancelTask(taskName:String) {
        Alamofire.Session.default.session.getAllTasks { tasks in
            tasks.forEach {
                var task:URLSessionTask?
                task = $0
                if let task = task, let urlString = task.originalRequest?.url?.absoluteString, urlString.contains(taskName)  {
                    $0.cancel()
                }
            }
        }
    }
}
