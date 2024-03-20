//
//  ProfileViewController.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    weak var coordinator: ProfileViewControllerCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .black
    }
}
