//
//  LoginTwoViewController.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit


class LoginTwoViewController: UIViewController {
    
    var viewModel: LoginTwoViewModel?
    
    private lazy var loginView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var topLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Отправили код на \(viewModel?.email ?? "")"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private lazy var lowerLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.Color.nonActiveBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        
        button.isEnabled = false
        button.setTitle("Подтвердить", for: .normal)
        button.setTitle("Подтвердить", for: .disabled)
        button.setTitleColor(Constants.Color.grey4, for: .disabled)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    private var codeView: CodeView = {
        let view = CodeView(frame: CGRect(x: 0, y: 113, width: 216, height: 48))
        view.codeTextFields[0].imageView.isHidden = true
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraint()
        setupNavBarAndItem()
    }
    
    @objc func tapButton() {
        viewModel?.didTapButton()
    }
    
    func setupView() {
        view.backgroundColor = .black
        view.addSubview(loginView)
        loginView.addSubview(topLabel)
        loginView.addSubview(lowerLabel)
        loginView.addSubview(confirmButton)
        loginView.addSubview(codeView)
        
        codeView.lastCharacterEntered = {
            self.confirmButton.isEnabled = true
            self.confirmButton.backgroundColor = Constants.Color.blue
        }
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            loginView.heightAnchor.constraint(equalToConstant: 225),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15.0),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15.0),
            loginView.topAnchor.constraint(equalTo: view.topAnchor, constant: 162),
            
            topLabel.heightAnchor.constraint(equalToConstant: 24),
            topLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 0),
            topLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: 0),
            topLabel.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 0),
            
            lowerLabel.heightAnchor.constraint(equalToConstant: 65),
            lowerLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 0),
            lowerLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: 0),
            lowerLabel.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 40),
            
            confirmButton.heightAnchor.constraint(equalToConstant: 48),
            confirmButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 0),
            confirmButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: 0),
            confirmButton.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 0)
        ])
    }
}

