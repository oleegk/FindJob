//
//  SearchViewControllerCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit




class SearchViewControllerCoordinator: BaseCoordinator {
    
    weak var tabBarCoordinator: TabBarCoordinator?
    weak var vacanciesModels: VacanciesModels?
    var viewModel: CollectionViewModelProtocol = SearchViewModel()
    var navigationController = UINavigationController()
    
    override func start() {
        let searchViewController = SearchViewController()
        searchViewController.viewModel = viewModel
        searchViewController.cellCollectionView.viewModel = viewModel
        searchViewController.cellCollectionView.reloadData()
        
        viewModel.coordinator = self
        viewModel.vacanciesModels = vacanciesModels
        
        self.viewModel.vacanciesModels?.getVacancies {
            self.viewModel.updateBudge()
        }
        
        navigationController.setViewControllers([searchViewController], animated: true)
    }
    
    func openDetailScreen(for vacancy: Vacancy) {
        let detailVacancyViewControllerCoordinator = DetailVacancyViewControllerCoordinator()
        detailVacancyViewControllerCoordinator.navigationController = navigationController
        detailVacancyViewControllerCoordinator.vacancy = vacancy
        detailVacancyViewControllerCoordinator.vacanciesModels = vacanciesModels
        
        detailVacancyViewControllerCoordinator.parentCoordinator = self
        detailVacancyViewControllerCoordinator.tabBarCoordinator = tabBarCoordinator
        
        add(coordinator: detailVacancyViewControllerCoordinator)
        detailVacancyViewControllerCoordinator.start()
    }
}


extension SearchViewControllerCoordinator: CollectionViewCoordinatorProtocol {}
