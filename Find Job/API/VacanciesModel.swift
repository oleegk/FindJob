//
//  APIModel.swift
//  Find Job
//
//  Created by Олег Ковалев on 15.03.2024.
//

import Foundation


// MARK: - APIModel
struct VacanciesModel: Codable {
    let offers: [Offer]
    var vacancies: [Vacancy]
}

// MARK: - Offer
struct Offer: Codable {
    let id, title: String?
    let link: String?
    let button: Button?
}

// MARK: - Button
struct Button: Codable {
    let text: String?
}

// MARK: - Vacancy
struct Vacancy: Codable {
    let id: String?
    let lookingNumber: Int?
    let title: String?
    let address: Address?
    let company: String?
    let experience: Experience?
    let publishedDate: String?
    var isFavorite: Bool?
    let salary: Salary?
    let schedules: [String]?
    let appliedNumber: Int?
    let description, responsibilities: String?
    let questions: [String]?
}

// MARK: - Address
struct Address: Codable {
    let town, street, house: String?
}

// MARK: - Experience
struct Experience: Codable {
    let previewText, text: String?
}

// MARK: - Salary
struct Salary: Codable {
    let full, short: String?
}

