//
//  APIManager.swift
//  Find Job
//
//  Created by Олег Ковалев on 15.03.2024.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    let urlString = "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14"
    
    func getVacancy(_ completion: @escaping ([Vacancy]) -> ()) {
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            if let vacancyModel = try? JSONDecoder().decode(VacanciesModel.self, from: data) {
                print("Success decoding")
                completion(vacancyModel.vacancies)
            } else {
                print("FAIL")
            }
        }
        task.resume()
    }
    

}
