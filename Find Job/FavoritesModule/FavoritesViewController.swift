//
//  FavoritesViewController.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class FavoritesViewController: UIViewController {

    var viewModel: CollectionViewModelProtocol?
    
    private lazy var favoriteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Избранное"
        label.font = Constants.Fonts.SFProDisplaySemibold20Title2
        label.textColor = .white
        return label
    }()
    
    private lazy var vacancyCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        label.textColor = Constants.Color.grey3
        return label
    }()
    
    let cellCollectionView = FavoriteCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupConstraint()
        setupNavBarAndItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cellCollectionView.reloadData()
        viewModel?.updateNumberOfVacancy = {
            self.updateNumberOfVacancy()
        }
    }
    
    func updateNumberOfVacancy() {
        vacancyCountLabel.text = viewModel?.numberOfVacancy()
    }
    
    func setupView() {
        view.backgroundColor = .black
        view.addSubview(favoriteLabel)
        view.addSubview(vacancyCountLabel)
        view.addSubview(cellCollectionView)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            favoriteLabel.topAnchor.constraint(equalTo: view.topAnchor
                                               , constant: 64),
            favoriteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor
                                               , constant: 16),
            vacancyCountLabel.topAnchor.constraint(equalTo: view.topAnchor
                                               , constant: 112),
            vacancyCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor
                                               , constant: 16),
            
            cellCollectionView.topAnchor.constraint(equalTo: vacancyCountLabel.bottomAnchor, constant: 10),
            cellCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cellCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cellCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        
        ])
    }
}


