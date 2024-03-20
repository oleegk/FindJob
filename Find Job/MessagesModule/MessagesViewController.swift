//
//  MessagesViewController.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class MessagesViewController: UIViewController {
    
    weak var coordinator: MessagesViewControllerCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .black
    }
}
