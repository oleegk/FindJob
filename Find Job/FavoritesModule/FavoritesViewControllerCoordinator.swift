//
//  FavoritesViewControllerCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class FavoritesViewControllerCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController?
    var favoritesViewModel = FavoritesViewModel()

    override func start() {
        let favoritesViewController = FavoritesViewController()
        favoritesViewModel.coordinator = self        
        favoritesViewController.viewModel = favoritesViewModel

        navigationController?.pushViewController(favoritesViewController, animated: true)
    }
}
