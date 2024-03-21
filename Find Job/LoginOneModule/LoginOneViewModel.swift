//
//  LoginOneViewModel.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

protocol LoginViewModelProtocol {
    func didTapButton(_ email: String)
    func isValidEmail(_ email: String) -> Bool
}

class LoginOneViewModel {
    weak var coordinator: LoginOneViewControllerCoordinator?
    
    func didTapButton(_ email: String) {
        coordinator?.openLoginTwoScreen(email)
    }
    
    
    func updateBudge() {
        if let vacancies = coordinator?.parentCoordinator?.vacancies {
            for vacancy in vacancies {
                if let isFavorite = vacancy.isFavorite {
                    if isFavorite {
                        coordinator?.parentCoordinator?.tabBarController.badgeCount += 1
                    }
                }
            }
        }
    }
}


extension LoginOneViewModel: LoginViewModelProtocol {
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        
        return emailPredicate.evaluate(with: email)
    }
}


