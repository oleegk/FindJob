//
//  MessagesViewControllerCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class MessagesViewControllerCoordinator: BaseCoordinator {
    
    var navigationController = UINavigationController()
    
    override func start() {
        let messagesViewController = MessagesViewController()
        messagesViewController.coordinator = self
        navigationController.setViewControllers([messagesViewController], animated: true)
    }
}
