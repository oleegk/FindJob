//
//  SearchViewModel.swift
//  Find Job
//
//  Created by Олег Ковалев on 15.03.2024.
//



import UIKit
import CoreData



class SearchViewModel {
    weak var vacanciesModels: VacanciesModels?
    var coordinator: CollectionViewCoordinatorProtocol?
    var detailVacancyViewModel: DetailVacancyViewModel?
    var isFavoriteVacancies: [Vacancy] = []
    var updateNumberOfVacancy: (() -> Void)?
    var vacancyDataBase: [VacancyDataBase] = []
    
    
    func numberOfVacancy() -> String {
        if let vacancies = vacanciesModels?.vacancies {
            if vacancies.count % 100 >= 11 && vacancies.count % 100 <= 14 {
                return "Ещё \(vacancies.count) вакансий"
            } else {
                switch vacancies.count % 10 {
                case 1:
                    return "Ещё \(vacancies.count) вакансия"
                case 2, 3, 4:
                    return "Ещё \(vacancies.count) вакансии"
                default:
                    return "Ещё \(vacancies.count) вакансий"
                }
            }
        }
        return ""
    }
    
    func updateBudge() {
        DispatchQueue.main.async {
            if let vacancies = self.returnUpdateIsFavoritePropertyVacancies() {
                var isFavoriteCount = 0
                for vacancy in vacancies {
                    if let isFavorite = vacancy.isFavorite {
                        if isFavorite {
                            isFavoriteCount += 1
                        }
                    }
                }
                self.coordinator?.tabBarCoordinator?.tabBarController.badgeCount = isFavoriteCount
                self.coordinator?.tabBarCoordinator?.tabBarController.installBadgeValue()
                
            }
        }
    }
    
    func isFavoriteTapped(_ isFavorite: Bool, index: Int) {
        if isFavorite {
            badgeCountPlus()
            vacanciesModels?.vacancies[index].isFavorite = true
        } else {
            badgeCountMinus()
            vacanciesModels?.vacancies[index].isFavorite = false
        }
    }
    
    func returnUpdateIsFavoritePropertyVacancies() -> [Vacancy]? {
        let context = self.getContext()
        let fetchRequest: NSFetchRequest<VacancyDataBase> = VacancyDataBase.fetchRequest()
        
        do {
            self.vacancyDataBase = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        for object in vacancyDataBase {
            if let vacancies = vacanciesModels?.vacancies {
                for (index, value) in vacancies.enumerated() {
                    if value.id == object.id {
                        vacanciesModels?.vacancies[index].isFavorite = object.isFavorite
                    }
                }
            }
        }
        return vacanciesModels?.vacancies
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
    
    func updateIsFavoriteVacancies(_ index: Int) -> Vacancy? { return nil }
    
    func isFavoriteVacancyCount() -> Int { 0 }
    
}


extension SearchViewModel: CollectionViewModelProtocol {}
