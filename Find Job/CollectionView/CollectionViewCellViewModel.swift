//
//  CollectionViewCellViewModel.swift
//  Find Job
//
//  Created by Олег Ковалев on 19.03.2024.
//

import UIKit

class CollectionViewCellViewModel {
    func formatDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: dateString) {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.day, .month], from: date)
            
            if let day = components.day, let month = components.month {
                let monthName: String
                switch month {
                case 1:
                    monthName = "января"
                case 2:
                    monthName = "февраля"
                case 3:
                    monthName = "марта"
                case 4:
                    monthName = "апреля"
                case 5:
                    monthName = "мая"
                case 6:
                    monthName = "июня"
                case 7:
                    monthName = "июля"
                case 8:
                    monthName = "августа"
                case 9:
                    monthName = "сентября"
                case 10:
                    monthName = "октября"
                case 11:
                    monthName = "ноября"
                case 12:
                    monthName = "декабря"
                default:
                    monthName = ""
                }
                return "Опубликовано \(day) \(monthName)"
            }
        }
        return ""
    }
}
