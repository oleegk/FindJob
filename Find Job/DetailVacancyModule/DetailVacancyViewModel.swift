//
//  DetailVacancyViewModel.swift
//  Find Job
//
//  Created by Олег Ковалев on 20.03.2024.
//

import UIKit
import CoreData

class DetailVacancyViewModel {
    weak var coordinator: DetailVacancyViewControllerCoordinator?
    weak var vacanciesModels: VacanciesModels?
    var vacancy: Vacancy?
    
    
    func setupSchedules(schedules: [String]) -> String {
        var finishString = ""
        schedules.forEach { schedule in
            if finishString.isEmpty {
                let firstWordCapitalized = schedule.prefix(1).capitalized + schedule.dropFirst()
                finishString += firstWordCapitalized
            }
            finishString += ", " + schedule
        }
        return finishString
    }
    
    func setupAddress(_ address: Address) -> String {
        return "\(address.town ?? ""), \(address.street ?? ""), \(address.house ?? "")"
    }
    
    func backButtonTapped() {
        coordinator?.backButtonTapped()
    }
    
    func updateFavoriteStatus(_ value: Bool) {
        vacancy?.isFavorite = value
        value ? badgeCountPlus() : badgeCountMinus()

        let vacancyID = vacancy?.id
        if let vacancies = vacanciesModels?.vacancies {
            for (index, currentVacancy) in vacancies.enumerated() {
                if currentVacancy.id == vacancyID {
                    vacanciesModels?.vacancies[index].isFavorite = value
                    self.saveChangesInDataBase(id: vacancyID ?? "", isFavorite: value)
                }
            }
        }
    }
    
    
    private func saveChangesInDataBase(id: String, isFavorite: Bool) {
        let context = getContext()
        let fetchRequest: NSFetchRequest<VacancyDataBase> = VacancyDataBase.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let existingVacancy = results.first {
                existingVacancy.isFavorite = isFavorite
            } else {
                let newVacancy = VacancyDataBase(context: context)
                newVacancy.id = id
                newVacancy.isFavorite = isFavorite
            }
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    private func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    private func badgeCountPlus() {
        coordinator?.tabBarCoordinator?.tabBarController.badgeCount += 1
        coordinator?.tabBarCoordinator?.tabBarController.installBadgeValue()
    }
    
    private func badgeCountMinus() {
        coordinator?.tabBarCoordinator?.tabBarController.badgeCount -= 1
        coordinator?.tabBarCoordinator?.tabBarController.installBadgeValue()
    }
}
