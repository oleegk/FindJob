//
//  SearchViewControllerCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class SearchViewControllerCoordinator: BaseCoordinator {
    
    var navigationController = UINavigationController()
    
    override func start() {
        let searchViewController = SearchViewController()
        searchViewController.coordinator = self
        navigationController.setViewControllers([searchViewController], animated: true)
        
    }
}
