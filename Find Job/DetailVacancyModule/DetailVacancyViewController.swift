//
//  DetailVacancyViewController.swift
//  Find Job
//
//  Created by Олег Ковалев on 20.03.2024.
//

import UIKit

class DetailVacancyViewController: UIViewController {
    weak var viewModel: DetailVacancyViewModel?
    
    private lazy var toBeContinued: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.SFProDisplaySemibold22Title1
        label.text = "Немного не успел, закончу через день - два =)"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(toBeContinued)
        NSLayoutConstraint.activate([
            toBeContinued.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            toBeContinued.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            toBeContinued.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
        ])
    }
}
