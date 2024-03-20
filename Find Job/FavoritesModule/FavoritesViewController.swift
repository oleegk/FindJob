//
//  FavoritesViewController.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var viewModel: FavoritesViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavBarAndItem()
    }
    
    func setupView() {
        view.backgroundColor = .darkGray
    }
}
