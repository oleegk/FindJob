//
//  CustomTabBarController.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    var viewModel: LoginTwoViewModel?
    var registrationCompleted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        tabBar.barStyle = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        selectedIndex = 1
        
    }
}

extension CustomTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if !registrationCompleted {
            selectedIndex = 1
        }
    }
}
