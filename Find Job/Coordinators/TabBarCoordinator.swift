//
//  TabBarCoordinator.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class TabBarCoordinator: BaseCoordinator {
    
    let tabBarController = CustomTabBarController()
    let vacanciesModels = VacanciesModels()
    
    override func start() {        
        let searchViewControllerCoordinator = SearchViewControllerCoordinator()
        let loginViewControllerCoordinator = LoginViewControllerCoordinator()
        let responsesViewControllerCoordinator = ResponsesViewControllerCoordinator()
        let messagesViewControllerCoordinator = MessagesViewControllerCoordinator()
        let profileViewControllerCoordinator = ProfileViewControllerCoordinator()
        
        loginViewControllerCoordinator.tabBarCoordinator = self
        searchViewControllerCoordinator.tabBarCoordinator = self
        searchViewControllerCoordinator.vacanciesModels = vacanciesModels
        loginViewControllerCoordinator.vacanciesModels = vacanciesModels
        
        
        
        add(coordinator: searchViewControllerCoordinator)
        add(coordinator: loginViewControllerCoordinator)
        add(coordinator: responsesViewControllerCoordinator)
        add(coordinator: messagesViewControllerCoordinator)
        add(coordinator: profileViewControllerCoordinator)
        
        searchViewControllerCoordinator.navigationController.tabBarItem = addTabBarItem(image: UIImage(named: "search"), title: "Поиск", tag: 0)
        loginViewControllerCoordinator.navigationController.tabBarItem = addTabBarItem(image: UIImage(named: "favorites"), title: "Избранные", tag: 1)
        responsesViewControllerCoordinator.navigationController.tabBarItem = addTabBarItem(image: UIImage(named: "responses"), title: "Отклики", tag: 2)
        messagesViewControllerCoordinator.navigationController.tabBarItem = addTabBarItem(image: UIImage(named: "messages"), title: "Сообщения", tag: 3)
        profileViewControllerCoordinator.navigationController.tabBarItem = addTabBarItem(image: UIImage(named: "profile"), title: "Профиль", tag: 4)

        searchViewControllerCoordinator.start()
        loginViewControllerCoordinator.start()
        responsesViewControllerCoordinator.start()
        messagesViewControllerCoordinator.start()
        profileViewControllerCoordinator.start()
        
        tabBarController.viewControllers = [
            searchViewControllerCoordinator.navigationController,
            loginViewControllerCoordinator.navigationController,
            responsesViewControllerCoordinator.navigationController,
            messagesViewControllerCoordinator.navigationController,
            profileViewControllerCoordinator.navigationController
        ]
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
