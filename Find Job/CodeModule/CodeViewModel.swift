//
//  LoginTwoViewModel.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit


class CodeViewModel {
    weak var coordinator: CodeViewControllerCoordinator?
    weak var tabBarController: CustomTabBarController?
    
    var email = ""
    var registrationCompleted = false

    
    func didTapButton() {
        tabBarController?.registrationCompleted = true
        tabBarController?.selectedIndex = 0
        coordinator?.openFavoritesScreen()
    }
    func deleteOneVC() {
        if let viewControllers = coordinator?.navigationController.viewControllers {
            for viewController in viewControllers {
                if viewController is LoginViewController {
                    coordinator?.navigationController.viewControllers.removeAll { $0 == viewController }
                    break
                }
            }
        }
    }
}
