//
//  LoginTwoViewModel.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit


class LoginTwoViewModel {
    
    var registrationCompleted = false
    weak var coordinator: LoginTwoViewControllerCoordinator?
    weak var tabBarController: CustomTabBarController?
    
    
    func didTapButton() {
        tabBarController?.registrationCompleted = true
        tabBarController?.selectedIndex = 0
        print("tapButton LoginTwoViewModel")
        coordinator?.openSearchScreen()
    }
    
    func deleteOneVC() {
        if let viewControllers = coordinator?.navigationController?.viewControllers {
            for viewController in viewControllers {
                if viewController is LoginOneViewController {
                    coordinator?.navigationController?.viewControllers.removeAll { $0 == viewController }
                    break
                }
            }
        }
    }
}
