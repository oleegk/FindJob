//
//  ViewController.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class SearchViewController: UIViewController {
    
    weak var coordinator: SearchViewControllerCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .systemGray2
    }
}

