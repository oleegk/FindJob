//
//  Extension.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

extension BaseCoordinator {
    func addTabBarItem(image: UIImage?, title: String, tag: Int) -> UITabBarItem {
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        tabBarItem.title = title
        return tabBarItem
    }
}

extension UITextField {
    func setLeftImage(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 8, y: 0, width: 20, height: 20)
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 34, height: 20))
        containerView.addSubview(imageView)
        
        leftView = containerView
        leftViewMode = .always
    }
}

extension UIViewController {
     func moveViewUpAndDown() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -100
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0
        }
    }
    
    func setupNavBarAndItem() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.hidesBackButton = true
    }
    

}


extension UILabel {
    convenience init(title: String) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.text = title
    }
    
    convenience init(title: String, backgroundColor: UIColor, font: UIFont, textColor: UIColor?) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = backgroundColor
        self.text = title
        self.font = font
        self.textColor = textColor
    }
}


extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }
}

private var associatedValues = [UIImageView: Bool]()

extension UIImageView {
    var isFavorite: Bool {
        get {
            return associatedValues[self] ?? false
        }
        set {
            associatedValues[self] = newValue
        }
    }
}

extension UIResponder {
    func formatPeopleCount(_ count: Int) -> String {
        if count % 100 >= 11 && count % 100 <= 14 {
            return "Сейчас просматривает \(count) человек"
        } else {
            switch count % 10 {
            case 1:
                return "Сейчас просматривает \(count) человек"
            case 2, 3, 4:
                return "Сейчас просматривает \(count) человека"
            default:
                return "Сейчас просматривает \(count) человек"
            }
        }
    }
    
    func formatAppliedPeopleCount(_ count: Int) -> String {
        if count % 100 >= 11 && count % 100 <= 14 {
            return "\(count) человек уже откликнулось"
        } else {
            switch count % 10 {
            case 1:
                return "\(count) человек уже откликнулось"
            case 2, 3, 4:
                return "\(count) человека уже откликнулось"
            default:
                return "\(count) человек уже откликнулось"
            }
        }
    }
    
    func formatlookingPeopleCount(_ count: Int) -> String {
        if count % 100 >= 11 && count % 100 <= 14 {
            return "\(count) человек сейчас смотрят"
        } else {
            switch count % 10 {
            case 1:
                return "\(count) человек сейчас смотрят"
            case 2, 3, 4:
                return "\(count) человека сейчас смотрят"
            default:
                return "\(count) человек сейчас смотрят"
            }
        }
    }
}


extension APIManager {
    static let defaultData: [Vacancy] = [
            Vacancy(id: "123",
                    lookingNumber: 17,
                    title: "iOS Developer",
                    address: Address(town: "Краснодар",
                                     street: "Красная",
                                     house: "35"),
                    company: "Mobile APP",
                    experience: Experience(previewText: "Опыт от 1 до 3 лет",
                                           text: "Опыт от 1 до 3 лет"),
                    publishedDate: "2024-02-12",
                    isFavorite: false,
                    salary: Salary(full: "от 100 000 до 200 000 ₽ на руки",
                                   short: "от 100 000 до 200 000 ₽ на руки"),
                    schedules: ["полная занятость", "полный рабочий день", "удаленная работа"],
                    appliedNumber: 29,
                    description: "Расширяем команду нашего проекта в области eCommerce. В настоящий момент над программной частью проекта уже работают более 100 специалистов в трех командах, состоящих из профессионалов с серьезным опытом. Мы придерживаемся современных методологий и актуальных инструментов разработки, представляем широкие возможности для развития сотрудников: наставничество, индивидуальное обучение. ЗП пересматриваем в соответствии с профессиональным ростом. Гарантируем отличные условия труда.",
                    responsibilities: "Разработка мобильных приложений по тех заданию. Наш стек: Swift 5, RxSwift, Realm, PinLayout, DITranquillity, Apollo GraphQL",
                    questions: ["Где располагается место работы?", "Какой график работы?", "Вакансия открыта?", "Какая оплата труда?"]),
            Vacancy(id: "567",
                    lookingNumber: 32,
                    title: "iOS Разработчик",
                    address: Address(town: "Краснодар",
                                     street: "Северная",
                                     house: "458"),
                    company: "ООО Девелопмент",
                    experience: Experience(previewText: "Опыт от 1 года",
                                           text: "Опыт от 1 года"),
                    publishedDate: "2024-03-01",
                    isFavorite: false,
                    salary: Salary(full: "от 100 000 на руки",
                                   short: "от 100 000 на руки"),
                    schedules: ["полный рабочий день", "удаленная работа"],
                    appliedNumber: 34,
                    description: "ООО Девелопмент – это команда экспертов в области высоких технологий и разработки программного обеспечения. Компания ООО Девелопмент официально аккредитована как IT компания. В соответствии с новыми мерами поддержки IT отрасли специалисты получают отсрочку от воинской обязанности, а также сотрудники могут рассчитывать на другие гос. привилегии. Текущие проекты: видеоплатформа, проекты по автоматизации крупного продуктового ритейлера, проект сотового оператора и др.",
                    responsibilities: "Чем предстоит заниматься: Изучение кода и функционала мобильных приложений, Покрытие авто тестами мобильных приложений, Сode review, Участвовать во всём процессе разработки - от проектирования до запуска, Знакомиться и внедрять новейшие технологии",
                    questions: ["Какой график работы?", "Вакансия открыта?", "Какая оплата труда?"]),
            Vacancy(id: "789",
                    lookingNumber: 44,
                    title: "iOS Developer",
                    address: Address(town: "Краснодар",
                                     street: "Промышленная",
                                     house: "233"),
                    company: "Aston",
                    experience: Experience(previewText: "Без опыта",
                                           text: "Без опыта"),
                    publishedDate: "2024-03-12",
                    isFavorite: true,
                    salary: Salary(full: "от 70 000 до 100 000 ₽ на руки",
                                   short: "от 70 000 до 100 000 ₽ на руки"),
                    schedules: ["полная занятость", "полный рабочий день", "удаленная работа"],
                    appliedNumber: 58,
                    description: "Мы – аутсорсинговая аккредитованная IT-компания Aston, разрабатываем программное обеспечение на заказ и оказываем услуги IT-аутсорсинга предприятиям, организациям и стартапам. Приоритетные направления – финансовые технологии, телеком, ритейл, недвижимость и другие. Среди наших клиентов – компании Тинькофф, Х5 Retail Group, Банки.ру, ВТБ Банк, Альфа Банк, Цифра и другие. Заказчик – входит в топ-10 российских банков по величине активов, кредитного портфеля, размеру средств, привлеченных от клиентов, и нормативного капитала.",
                    responsibilities: "Чем предстоит заниматься? Разрабатывать и поддерживать функциональность ios приложения Умный дом (интеграция с датчиками температуры, влажности, кондиционерами), исследовать и внедрять архитектурные решения и автоматизировать процессы, заниматься добавлением новых видов устройств, взаимодействовать с ними с помощью приложения",
                    questions: ["Где располагается место работы?", "Какой график работы?", "Вакансия открыта?", "Какая оплата труда?"])]
}


