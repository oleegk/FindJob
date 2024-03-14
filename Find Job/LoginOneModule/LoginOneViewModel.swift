//
//  LoginOneViewModel.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit


class LoginOneViewModel {
    weak var coordinator: LoginOneViewControllerCoordinator?
    
    func didTapButton() {
        coordinator?.openLoginTwoScreen()
    }
}


