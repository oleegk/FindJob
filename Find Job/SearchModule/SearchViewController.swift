//
//  ViewController.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit

class SearchViewController: UIViewController {
    
    var viewModel: SearchViewModel?
    
    private lazy var searchTextField: UITextField = {
        let view = UITextField()
        view.frame = CGRect()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.Color.grey2
        
        view.layer.borderColor = Constants.Color.grey2.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8

        view.setLeftImage(image: UIImage(named: "search") ?? UIImage())
        
        let attributedPlaceholder = NSMutableAttributedString(string: "Должность, ключевые слова", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.grey4])
        
        view.attributedPlaceholder = attributedPlaceholder
        
        view.contentVerticalAlignment = .center
        view.clearButtonMode = .whileEditing
        view.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        view.textColor = .white
        
        let clearButton = view.value(forKey: "_clearButton") as? UIButton
        clearButton?.setImage(UIImage(named: "close"), for: .normal)
        
        return view
    }()
    
    private lazy var menuView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.Color.grey2
        view.image = UIImage(named: "menu")
        
        view.layer.cornerRadius = 10
        view.contentMode = .center
        return view
    }()
    
    private let topCollectionView = TopCollectionView()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Вакансии для вас"
        label.font = Constants.Fonts.SFProDisplaySemibold20Title2
        label.textColor = .white
        return label
    }()
    
    private lazy var moreVacanciesButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.Color.blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        
        button.isEnabled = false
        button.setTitle("Еще 143 вакансии", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Constants.Fonts.SFProDisplaySemibold16ButtonText1
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        
        return button
    }()
    
    private let cellCollectionView = CollectionView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        cellCollectionView.viewModel = viewModel
    }
    
    
    func renameRespondButton() {
        moreVacanciesButton.setTitle("\(numberOfVacancy(viewModel?.vacancies.count ?? 0))", for: .normal)
    }
    
    func numberOfVacancy(_ count: Int) -> String {
        if count % 100 >= 11 && count % 100 <= 14 {
            return "Ещё \(count) вакансий"
        } else {
            switch count % 10 {
            case 1:
                return "Ещё \(count) вакансия"
            case 2, 3, 4:
                return "Ещё \(count) вакансии"
            default:
                return "Ещё \(count) вакансий"
            }
        }
    }
    
    func setupView() {
        view.backgroundColor = .black
        view.addSubview(searchTextField)
        view.addSubview(menuView)
        view.addSubview(topCollectionView)
        view.addSubview(label)
        view.addSubview(cellCollectionView)
        view.addSubview(moreVacanciesButton)
        renameRespondButton()

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.heightAnchor.constraint(equalToConstant: 40),
            searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            searchTextField.trailingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: -7),
            
            menuView.widthAnchor.constraint(equalToConstant: 40),
            menuView.heightAnchor.constraint(equalToConstant: 40),
            menuView.topAnchor.constraint(equalTo: view.topAnchor, constant: 48),
            menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            
            topCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 121),
            topCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topCollectionView.heightAnchor.constraint(equalToConstant: 120),
            
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 256),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.heightAnchor.constraint(equalToConstant: 24),
            label.widthAnchor.constraint(equalToConstant: 175),
            
            cellCollectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            cellCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cellCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cellCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160),
            
            
            moreVacanciesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            moreVacanciesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            moreVacanciesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -98),
            moreVacanciesButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

}

