//
//  SearchViewControllerCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class SearchViewControllerCoordinator: BaseCoordinator {
    
    var vacancies: [Vacancy]
    
    init(vacancies: [Vacancy]) {
        self.vacancies = vacancies
    }
    
    var navigationController = UINavigationController()
    
    override func start() {
        let searchViewModel = SearchViewModel(vacancies: vacancies)
        let searchViewController = SearchViewController()
        searchViewController.viewModel = searchViewModel
        searchViewModel.coordinator = self
        navigationController.setViewControllers([searchViewController], animated: true)
        
    }
    
    func openDetailScreen(for index: Int, isFavorite: Bool) {
        let detailVacancyViewControllerCoordinator = DetailVacancyViewControllerCoordinator()
        detailVacancyViewControllerCoordinator.navigationController = navigationController
        detailVacancyViewControllerCoordinator.vacancy = vacancies[index]
        detailVacancyViewControllerCoordinator.isFavorite = isFavorite
        add(coordinator: detailVacancyViewControllerCoordinator)
        detailVacancyViewControllerCoordinator.start()
    }
}
