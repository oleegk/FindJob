//
//  SearchModel.swift
//  Find Job
//
//  Created by Олег Ковалев on 27.03.2024.
//

import UIKit

class VacanciesModels {
    
    var vacancies: [Vacancy] = []
    
    func getVacancies(completion: @escaping () -> ()) {
        APIManager.shared.getVacancy { vacancies in
            self.vacancies = vacancies
            completion()
        }
    }
}
