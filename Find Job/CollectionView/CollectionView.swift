//
//  CollectionView.swift
//  Find Job
//
//  Created by Олег Ковалев on 19.03.2024.
//

import UIKit

class CollectionView: UICollectionView {
    
    var viewModel: CollectionViewModelProtocol?
    
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
        self.backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension CollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.vacanciesModels?.vacancies.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.cellTappedClosure = { [weak self] in
            guard let self else { return }
            if let tappedVacancyID = viewModel?.vacanciesModels?.vacancies[indexPath.row].id {
                self.viewModel?.openDetailScreen(for: tappedVacancyID)
            }
        }
        
        
        
        cell.isFavoriteTappedClosure = { [weak self] isFavorite in
            self?.viewModel?.isFavoriteTapped(isFavorite, index: indexPath.row)
            if let tappedVacancyID = self?.viewModel?.vacanciesModels?.vacancies[indexPath.row].id {
                self?.viewModel?.saveChangesInDataBase(id: tappedVacancyID, isFavorite: isFavorite)
            }
        }
        
        if let updateVacancy = viewModel?.returnUpdateIsFavoritePropertyVacancies() {
            cell.configure(updateVacancy[indexPath.row])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 300)
    }
}
