//
//  Extension.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

extension BaseCoordinator {
    func addTabBarItem(image: UIImage?, title: String, tag: Int) -> UITabBarItem {
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        tabBarItem.title = title
        return tabBarItem
    }
}

extension UITextField {
    func setLeftImage(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 8, y: 0, width: 20, height: 20)
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 34, height: 20))
        containerView.addSubview(imageView)
        
        leftView = containerView
        leftViewMode = .always
    }
}

