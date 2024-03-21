//
//  CollectionView.swift
//  Find Job
//
//  Created by Олег Ковалев on 19.03.2024.
//

import UIKit

class CollectionView: UICollectionView {
    
    weak var viewModel: SearchViewModel?

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        super.init(frame: .zero, collectionViewLayout: layout)
        
        if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension CollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.cellTappedClosure = { [weak self] in
            self?.viewModel?.openDetailScreen(for: indexPath.row, isFavorites: cell.isFavoriteImageView.isFavorite)
        }
        
        cell.isFavoriteTappedClosure = { [weak self] isFavorite in
            if isFavorite {
                self?.viewModel?.coordinator?.parentCoordinator?.tabBarController.badgeCount += 1
                self?.viewModel?.coordinator?.parentCoordinator?.tabBarController.installBadgeValue()
                self?.viewModel?.vacancies[indexPath.row].isFavorite = true
            } else {
                self?.viewModel?.coordinator?.parentCoordinator?.tabBarController.badgeCount -= 1
                self?.viewModel?.coordinator?.parentCoordinator?.tabBarController.installBadgeValue()
                self?.viewModel?.vacancies[indexPath.row].isFavorite = false
            }
            
        }

        if let vacancies = viewModel?.vacancies {
            cell.configure(vacancies[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 300)
    }
}
