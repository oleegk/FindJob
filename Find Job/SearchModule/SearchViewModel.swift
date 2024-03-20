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
}
