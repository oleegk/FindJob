//
//  CodeViewControllerCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class CodeViewControllerCoordinator: BaseCoordinator {
    
    weak var parentCoordinator: LoginViewControllerCoordinator?
    weak var tabBarCoordinator: TabBarCoordinator?
    weak var tabBarController: CustomTabBarController?
    weak var vacanciesModels: VacanciesModels?
    var navigationController = UINavigationController()
    let viewModel = CodeViewModel()
    

    
    override func start() {
        let codeViewController = CodeViewController()
        codeViewController.viewModel = viewModel
        viewModel.coordinator = self
        navigationController.pushViewController(codeViewController, animated: true)
        viewModel.deleteOneVC()
    }
    
    func openFavoritesScreen(){
        let favoritesViewControllerCoordinator = FavoritesViewControllerCoordinator()
        favoritesViewControllerCoordinator.navigationController = navigationController
        favoritesViewControllerCoordinator.vacanciesModels = vacanciesModels
        favoritesViewControllerCoordinator.tabBarCoordinator = tabBarCoordinator

        add(coordinator: favoritesViewControllerCoordinator)
        favoritesViewControllerCoordinator.start()
    }
}

