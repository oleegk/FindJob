//
//  CollectionViewCoordinatorProtocol.swift
//  Find Job
//
//  Created by Олег Ковалев on 30.03.2024.
//

import UIKit

protocol CollectionViewCoordinatorProtocol {
    var tabBarCoordinator: TabBarCoordinator? { get set }
    var viewModel: CollectionViewModelProtocol { get set }
    var navigationController: UINavigationController { get set }
    func openDetailScreen(for vacancy: Vacancy)
}
