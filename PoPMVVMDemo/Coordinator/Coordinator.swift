//
//  Coordinator.swift
//  PoPMVVMDemo
//
//  Created by Mukesh Lokare on 20/06/21.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
