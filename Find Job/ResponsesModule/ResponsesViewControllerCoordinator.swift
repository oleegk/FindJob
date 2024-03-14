//
//  ResponsesViewControllerCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class ResponsesViewControllerCoordinator: BaseCoordinator {
    
    var navigationController = UINavigationController()

    
    override func start() {
        let responsesViewController = ResponsesViewController()
        responsesViewController.coordinator = self
        navigationController.setViewControllers([responsesViewController], animated: true)
    }
}
