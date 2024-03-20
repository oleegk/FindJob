//
//  ResponsesViewController.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class ResponsesViewController: UIViewController {
    
    weak var coordinator: ResponsesViewControllerCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .black
    }
}
