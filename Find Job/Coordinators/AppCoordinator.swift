//
//  AppCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
        let tabBarCoordinator = TabBarCoordinator()
        tabBarCoordinator.start()
        self.add(coordinator: tabBarCoordinator)
        self.window.rootViewController = tabBarCoordinator.tabBarController
    }
}
