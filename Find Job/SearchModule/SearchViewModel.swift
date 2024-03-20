//
//  SearchViewModel.swift
//  Find Job
//
//  Created by Олег Ковалев on 15.03.2024.
//



import UIKit

class SearchViewModel {
    weak var coordinator: SearchViewControllerCoordinator?
    
    var vacancies: [Vacancy]
    
    init(vacancies: [Vacancy]) {
        self.vacancies = vacancies
        
    }
    
    func numberOfVacancy() -> String {
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
    
    func openDetailScreen(for index: Int, isFavorites: Bool) {
        coordinator?.openDetailScreen(for: index, isFavorite: isFavorites)
    }
}
