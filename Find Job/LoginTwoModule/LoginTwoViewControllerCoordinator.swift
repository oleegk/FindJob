//
//  LoginTwoViewControllerCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class LoginTwoViewControllerCoordinator: BaseCoordinator {
    
    weak var parentCoordinator: LoginOneViewControllerCoordinator?
    var navigationController: UINavigationController?
    var loginTwoViewModel = LoginTwoViewModel()
    var customTabBarController: CustomTabBarController?

    
    override func start() {
        let loginTwoViewController = LoginTwoViewController()
        loginTwoViewController.viewModel = loginTwoViewModel
        loginTwoViewModel.coordinator = self
        loginTwoViewModel.tabBarController = customTabBarController
        navigationController?.pushViewController(loginTwoViewController, animated: true)
        loginTwoViewModel.deleteOneVC()
    }
    
    func openSearchScreen(){
        print("openSearchScreen LoginTwoViewControllerCoordinator")
        let favoritesViewControllerCoordinator = FavoritesViewControllerCoordinator()
        favoritesViewControllerCoordinator.navigationController = navigationController
        add(coordinator: favoritesViewControllerCoordinator)
        favoritesViewControllerCoordinator.start()

    }
}

