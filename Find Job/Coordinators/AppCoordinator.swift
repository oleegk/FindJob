//
//  AppCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        self.window.makeKeyAndVisible()
    }
    
    override func start() {
        getVacancy() { [weak self] vacancies in
            DispatchQueue.main.async {
                let tabBarCoordinator = TabBarCoordinator(vacancies: vacancies)
                tabBarCoordinator.start()
                self?.add(coordinator: tabBarCoordinator)
                self?.window.rootViewController = tabBarCoordinator.tabBarController
            }
        }
    }
    
    func getVacancy(completion: @escaping ([Vacancy]) -> ()) {
        APIManager.shared.getVacancy { vacancies in
            completion(vacancies)
            }
        }
    }
