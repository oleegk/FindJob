//
//  LoginViewControllerCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class LoginViewControllerCoordinator: BaseCoordinator {
    
    weak var tabBarCoordinator: TabBarCoordinator?
    weak var vacanciesModels: VacanciesModels?
    let navigationController = UINavigationController()
    let viewModel = LoginViewModel()
    let codeViewControllerCoordinator = CodeViewControllerCoordinator()
    
    override func start() {
        let loginViewController = LoginViewController()
        loginViewController.viewModel = viewModel
        viewModel.coordinator = self
        navigationController.viewControllers = [loginViewController]
    }
    
    func openLoginTwoScreen(_ email: String){
        codeViewControllerCoordinator.navigationController = navigationController
        codeViewControllerCoordinator.viewModel.email = email
        codeViewControllerCoordinator.viewModel.tabBarController = tabBarCoordinator?.tabBarController
        codeViewControllerCoordinator.tabBarCoordinator = tabBarCoordinator
        codeViewControllerCoordinator.vacanciesModels = vacanciesModels
        
        add(coordinator: codeViewControllerCoordinator)
        codeViewControllerCoordinator.start()
    }
}
