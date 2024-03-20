//
//  DetailVacancyViewControllerCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 20.03.2024.
//

import UIKit

class DetailVacancyViewControllerCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController?
    
    var vacancy: Vacancy?
    var isFavorite: Bool?

    override func start() {
        let detailVacancyViewModel = DetailVacancyViewModel()
        let detailVacancyViewController = DetailVacancyViewController()
        detailVacancyViewController.viewModel = detailVacancyViewModel
        detailVacancyViewModel.coordinator = self
        navigationController?.pushViewController(detailVacancyViewController, animated: true)
    }
}
