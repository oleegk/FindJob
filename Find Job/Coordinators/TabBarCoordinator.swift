//
//  TabBarCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class TabBarCoordinator: BaseCoordinator {
    
    var vacancies: [Vacancy]
    
    init(vacancies: [Vacancy]) {
        self.vacancies = vacancies
    }
    
    var tabBarController = CustomTabBarController()
    
    override func start() {

        let searchViewControllerCoordinator = SearchViewControllerCoordinator(vacancies: vacancies)
        let loginOneViewControllerCoordinator = LoginOneViewControllerCoordinator()
        let responsesViewControllerCoordinator = ResponsesViewControllerCoordinator()
        let messagesViewControllerCoordinator = MessagesViewControllerCoordinator()
        let profileViewControllerCoordinator = ProfileViewControllerCoordinator()
        
        loginOneViewControllerCoordinator.parentCoordinator = self
        searchViewControllerCoordinator.parentCoordinator = self
        
        
        add(coordinator: searchViewControllerCoordinator)
        add(coordinator: loginOneViewControllerCoordinator)
        add(coordinator: responsesViewControllerCoordinator)
        add(coordinator: messagesViewControllerCoordinator)
        add(coordinator: profileViewControllerCoordinator)
        
        searchViewControllerCoordinator.navigationController.tabBarItem = addTabBarItem(image: UIImage(named: "search"), title: "Поиск", tag: 0)
        loginOneViewControllerCoordinator.navigationController.tabBarItem = addTabBarItem(image: UIImage(named: "favorites"), title: "Избранные", tag: 1)
        responsesViewControllerCoordinator.navigationController.tabBarItem = addTabBarItem(image: UIImage(named: "responses"), title: "Отклики", tag: 2)
        messagesViewControllerCoordinator.navigationController.tabBarItem = addTabBarItem(image: UIImage(named: "messages"), title: "Сообщения", tag: 3)
        profileViewControllerCoordinator.navigationController.tabBarItem = addTabBarItem(image: UIImage(named: "profile"), title: "Профиль", tag: 4)

        searchViewControllerCoordinator.start()
        loginOneViewControllerCoordinator.start()
        responsesViewControllerCoordinator.start()
        messagesViewControllerCoordinator.start()
        profileViewControllerCoordinator.start()
        
        tabBarController.viewControllers = [
            searchViewControllerCoordinator.navigationController,
            loginOneViewControllerCoordinator.navigationController,
            responsesViewControllerCoordinator.navigationController,
            messagesViewControllerCoordinator.navigationController,
            profileViewControllerCoordinator.navigationController
        ]
        tabBarController.installBadgeValue()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === childCoordinator {
                print("Удален координатор childCoordinator из ТаБарКоординатора")
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
