//
//  CustomTabBarController.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    var viewModel: CodeViewModel?
    var registrationCompleted = false
    var badgeCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        tabBar.barStyle = .black
        tabBar.items?[1].setBadgeTextAttributes([.foregroundColor: UIColor.white, .backgroundColor: UIColor.red], for: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        selectedIndex = 1
    }
    
    
    func installBadgeValue() {
        if badgeCount > 0 {
            tabBar.items?[1].badgeValue = "\(badgeCount)"
        } else {
            tabBar.items?[1].badgeValue = nil
        }
    }
}

extension CustomTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if !registrationCompleted {
            selectedIndex = 1
        }
    }
}
