//
//  File.swift
//  Find Job
//
//  Created by Олег Ковалев on 29.03.2024.
//

import UIKit

class FavoriteCollectionView: CollectionView {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.isFavoriteVacancyCount() ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        
        cell.cellTappedClosure = { [weak self] in
            guard let self else { return }
            if let tappedVacancyID = viewModel?.isFavoriteVacancies[indexPath.row].id {
                self.viewModel?.openDetailScreen(for: tappedVacancyID)
            }
        }
        
        
        cell.isFavoriteTappedClosure = { [weak self] isFavorite in
            self?.viewModel?.isFavoriteTapped(isFavorite, index: indexPath.row)
            
            if let tappedVacancyID = self?.viewModel?.isFavoriteVacancies[indexPath.row].id {
                self?.viewModel?.saveChangesInDataBase(id: tappedVacancyID, isFavorite: isFavorite)
            }
            self?.reloadData()
        }
        
        
        if let vacancy = viewModel?.updateIsFavoriteVacancies(indexPath.row) {
            cell.configure(vacancy)
        }
        return cell
    }
}
