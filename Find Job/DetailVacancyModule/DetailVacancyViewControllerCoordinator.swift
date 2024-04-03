//
//  DetailVacancyViewControllerCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 20.03.2024.
//

import UIKit

class DetailVacancyViewControllerCoordinator: BaseCoordinator {
    
    weak var parentCoordinator: SearchViewControllerCoordinator?
    weak var tabBarCoordinator: TabBarCoordinator?
    weak var vacanciesModels: VacanciesModels?
    var navigationController: UINavigationController?
    var vacancy: Vacancy?

    override func start() {
        if let vacancy = vacancy {
            let detailVacancyViewModel = DetailVacancyViewModel()
            detailVacancyViewModel.vacancy = vacancy
            detailVacancyViewModel.vacanciesModels = vacanciesModels
            
            let detailVacancyViewController = DetailVacancyViewController()
            detailVacancyViewController.viewModel = detailVacancyViewModel
            detailVacancyViewController.configure()
            detailVacancyViewModel.coordinator = self
            parentCoordinator?.viewModel.detailVacancyViewModel = detailVacancyViewModel
            
            navigationController?.pushViewController(detailVacancyViewController, animated: true)
        }
    }

    func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
