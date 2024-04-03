//
//  FavoritesViewModel.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit
import CoreData

class FavoritesViewModel {
    
    var coordinator: CollectionViewCoordinatorProtocol?
    var detailVacancyViewModel: DetailVacancyViewModel?
    var vacanciesModels: VacanciesModels?
    var updateNumberOfVacancy: (() -> Void)?
    var isFavoriteVacancies: [Vacancy] = [] {
        didSet {
            if let updateNumberOfVacancy = updateNumberOfVacancy {
                updateNumberOfVacancy()
            }
        }
    }
    var vacancyDataBase: [VacancyDataBase] = []
    

    func numberOfVacancy() -> String {
        if isFavoriteVacancies.count % 100 >= 11 && isFavoriteVacancies.count % 100 <= 14 {
            return "\(isFavoriteVacancies.count) вакансий"
        } else {
            switch isFavoriteVacancies.count % 10 {
            case 1:
                return "\(isFavoriteVacancies.count) вакансия"
            case 2, 3, 4:
                return "\(isFavoriteVacancies.count) вакансии"
            default:
                return "\(isFavoriteVacancies.count) вакансий"
            }
        }
    }
    
    func updateBudge() {
        if let vacancies = vacanciesModels?.vacancies {
            for vacancy in vacancies {

                if let isFavorite = vacancy.isFavorite {
                    if isFavorite {
                        DispatchQueue.main.async {
                            self.badgeCountPlus()
                        }
                    }
                }
            }
        }
    }
    
    func isFavoriteTapped(_ isFavorite: Bool, index: Int) {
        guard let vacancyID = isFavoriteVacancies[index].id else { return }
        isFavoriteVacancies[index].isFavorite = isFavorite
        
        if isFavorite {
            badgeCountPlus()
            updateIsFavoriteProperty(vacancyID, isFavorite)
        }
        else {
            badgeCountMinus()
            updateIsFavoriteProperty(vacancyID, isFavorite)
        }
    }
    
    func isFavoriteVacancyCount() -> Int {
        var isFavoriteVacancyCount = 0
        if let vacancies = vacanciesModels?.vacancies {
            vacancies.forEach { vacancy in
                if let isFavorite = vacancy.isFavorite {
                    if isFavorite {
                        isFavoriteVacancyCount += 1
                    }
                }
            }
        }
        if isFavoriteVacancyCount == 0 {
            isFavoriteVacancies = []
        }
        return isFavoriteVacancyCount
    }
    
    func updateIsFavoriteVacancies(_ index: Int) -> Vacancy? {
        if let vacancies = vacanciesModels?.vacancies {
            isFavoriteVacancies = []
            vacancies.forEach { vacancy in
                if let isFavorite = vacancy.isFavorite {
                    if isFavorite {
                        isFavoriteVacancies.append(vacancy)
                    }
                }
            }
            
        }
        return isFavoriteVacancies[index]
    }
    
    
    func returnUpdateIsFavoritePropertyVacancies() -> [Vacancy]? { nil }
    
    private func updateIsFavoriteProperty(_ vacancyID: String, _ isFavorite: Bool) {
        if let vacancies = vacanciesModels?.vacancies {
            for (index, currentVacancy) in vacancies.enumerated() {
                if  currentVacancy.id == vacancyID {
                    vacanciesModels?.vacancies[index].isFavorite = isFavorite
                }
            }
        }
    }
    
    func openDetailScreen(for vacancyID: String) {
        if let vacancies = vacanciesModels?.vacancies {
            vacancies.forEach { vacancy in
                if vacancy.id == vacancyID {
                    coordinator?.openDetailScreen(for: vacancy)
                }
            }
        }
    }
}



extension FavoritesViewModel: CollectionViewModelProtocol {}
