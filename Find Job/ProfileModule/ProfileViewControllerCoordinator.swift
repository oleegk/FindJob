//
//  ProfileViewControllerCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class ProfileViewControllerCoordinator: BaseCoordinator {
    
    var navigationController = UINavigationController()
    
    override func start() {
        let profileViewController = ProfileViewController()
        profileViewController.coordinator = self
        navigationController.setViewControllers([profileViewController], animated: true)
    }
}
