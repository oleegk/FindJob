//
//  CollectionViewModelProtocol.swift
//  Find Job
//
//  Created by Олег Ковалев on 30.03.2024.
//

import UIKit
import CoreData

protocol CollectionViewModelProtocol {
    var coordinator: CollectionViewCoordinatorProtocol? { get set }
    var vacanciesModels: VacanciesModels? { get set }
    var detailVacancyViewModel: DetailVacancyViewModel? { get set }
    var isFavoriteVacancies: [Vacancy] { get set }
    var updateNumberOfVacancy: (() -> Void)? { get set }
    var vacancyDataBase: [VacancyDataBase] { get set }
    
    func numberOfVacancy() -> String
    func updateBudge()
    func isFavoriteVacancyCount() -> Int
    func isFavoriteTapped(_ isFavorite: Bool, index: Int)
    func updateIsFavoriteVacancies(_ index: Int) -> Vacancy?
    
    func saveChangesInDataBase(id: String, isFavorite: Bool)
    func returnUpdateIsFavoritePropertyVacancies() -> [Vacancy]?
    
    func openDetailScreen(for vacancyID: String)
}



extension CollectionViewModelProtocol {
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func saveChangesInDataBase(id: String, isFavorite: Bool) {
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
    
    func badgeCountPlus() {
        coordinator?.tabBarCoordinator?.tabBarController.badgeCount += 1
        coordinator?.tabBarCoordinator?.tabBarController.installBadgeValue()
    }
    
    func badgeCountMinus() {
        coordinator?.tabBarCoordinator?.tabBarController.badgeCount -= 1
        coordinator?.tabBarCoordinator?.tabBarController.installBadgeValue()
    }
}
