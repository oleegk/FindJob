//
//  FavoritesViewControllerCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit


class FavoritesViewControllerCoordinator: BaseCoordinator {

    var navigationController = UINavigationController()
    var viewModel: CollectionViewModelProtocol = FavoritesViewModel()
    var tabBarCoordinator: TabBarCoordinator?
    weak var vacanciesModels: VacanciesModels?
    

    override func start() {
        let favoritesViewController = FavoritesViewController()
        viewModel.vacanciesModels = vacanciesModels
        favoritesViewController.viewModel = viewModel
        favoritesViewController.cellCollectionView.viewModel = viewModel
        viewModel.coordinator = self
        navigationController.pushViewController(favoritesViewController, animated: true)
    }
    
    func openDetailScreen(for vacancy: Vacancy) {
        let detailVacancyViewControllerCoordinator = DetailVacancyViewControllerCoordinator()
        detailVacancyViewControllerCoordinator.navigationController = navigationController
        detailVacancyViewControllerCoordinator.vacancy = vacancy
        detailVacancyViewControllerCoordinator.vacanciesModels = vacanciesModels


        add(coordinator: detailVacancyViewControllerCoordinator)
        detailVacancyViewControllerCoordinator.tabBarCoordinator = tabBarCoordinator
        detailVacancyViewControllerCoordinator.start()
    }
}


extension FavoritesViewControllerCoordinator: CollectionViewCoordinatorProtocol {}

