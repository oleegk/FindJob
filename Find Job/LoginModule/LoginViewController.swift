//
//  LoginViewController.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit


class LoginViewController: UIViewController {

    weak var viewModel: LoginViewModel?
    
    private lazy var topLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Вход в личный кабинет"
        label.textColor = .white
        label.font = Constants.Fonts.SFProDisplaySemibold20Title2
        return label
    }()
    
    private lazy var findJobView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.Color.grey1
        view.layer.cornerRadius = 8
        view.sizeToFit()
        return view
    }()
    
    private lazy var findJobLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Поиск работы"
        label.textColor = .white
        label.font = Constants.Fonts.SFProDisplayMedium16Title3
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let view = UITextField()
        view.frame = CGRect()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.Color.grey2
        
        view.layer.borderColor = Constants.Color.grey2.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.8
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        
        view.setLeftImage(image: UIImage(named: "responses") ?? UIImage())
        
        let attributedPlaceholder = NSMutableAttributedString(string: "Электронная почта", attributes: [NSAttributedString.Key.foregroundColor: Constants.Color.grey4])
        
        view.attributedPlaceholder = attributedPlaceholder
        
        view.contentVerticalAlignment = .center
        view.clearButtonMode = .whileEditing
        view.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        view.textColor = .white
        
        view.keyboardType = .emailAddress
        
        let clearButton = view.value(forKey: "_clearButton") as? UIButton
        clearButton?.setImage(UIImage(named: "close"), for: .normal)
        
        view.addTarget(self, action: #selector(emailTextFieldDidChange(_:)), for: .editingChanged)
        return view
    }()
    
    private lazy var loginWithPassLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Войти с паролем"
        label.textColor = Constants.Color.blue
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        label.textAlignment = .right
        return label
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.Color.nonActiveBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        
        button.isEnabled = false
        button.setTitle("Продолжить", for: .normal)
        button.setTitle("Продолжить", for: .disabled)
        button.setTitleColor(Constants.Color.grey4, for: .disabled)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2

        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var findWorkersView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.Color.grey1
        view.layer.cornerRadius = 8
        view.sizeToFit()
        return view
    }()
    
    private lazy var findWorkersLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Поиск сотрудников"
        label.textColor = .white
        label.font = Constants.Fonts.SFProDisplayMedium16Title3
        return label
    }()
    
    private lazy var postingVacanciesLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Размещение вакансий и доступ к базе резюме"
        label.textColor = .white
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        return label
    }()
    
    private lazy var iFindWorkerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        
        button.isEnabled = true
        button.setTitle("Я ищу сотрудников", for: .normal)
        
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        button.backgroundColor = Constants.Color.green
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        
        return button
    }()
    
    private lazy var invalidEmailLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Вы ввели неверный e-mail"
        label.textColor = Constants.Color.red
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moveViewUpAndDown()
        setupView()
        setupConstraints()
    }
    
    
    @objc func emailTextFieldDidChange(_ textField: UITextField) {
        emailTextField.layer.borderColor = Constants.Color.grey2.cgColor
        invalidEmailLabel.isHidden = true
        if let text = textField.text, !text.isEmpty {
            continueButton.isEnabled = true
            continueButton.backgroundColor = Constants.Color.blue
        } else {
            continueButton.isEnabled = false
            continueButton.backgroundColor = Constants.Color.nonActiveBlue
        }
    }
    
    @objc func tapButton() {
        guard let email = emailTextField.text, !email.isEmpty else { return }
        if viewModel?.isValidEmail(email) ?? false {
            viewModel?.didTapButton(email)
        } else {
            emailTextField.layer.borderColor = Constants.Color.red.cgColor
            invalidEmailLabel.isHidden = false
        }
    }
    
    func setupView() {
        view.backgroundColor = .black
        view.addSubview(topLabel)
        view.addSubview(findJobView)
        findJobView.addSubview(findJobLabel)
        findJobView.addSubview(emailTextField)
        findJobView.addSubview(continueButton)
        findJobView.addSubview(loginWithPassLabel)
        view.addSubview(findWorkersView)
        findWorkersView.addSubview(findWorkersLabel)
        findWorkersView.addSubview(postingVacanciesLabel)
        findWorkersView.addSubview(iFindWorkerButton)
        
        findJobView.addSubview(invalidEmailLabel)
        invalidEmailLabel.isHidden = true
        emailTextField.delegate = self
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            topLabel.widthAnchor.constraint(equalToConstant: 230),
            topLabel.heightAnchor.constraint(equalToConstant: 24),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            
            findJobView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17.0),
            findJobView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17.0),
            findJobView.topAnchor.constraint(equalTo: view.topAnchor, constant: 232),
            findJobView.heightAnchor.constraint(equalToConstant: 179),
            
            findJobLabel.topAnchor.constraint(equalTo: findJobView.topAnchor, constant: 24),
            findJobLabel.leadingAnchor.constraint(equalTo: findJobView.leadingAnchor, constant: 16.0),
            findJobLabel.widthAnchor.constraint(equalToConstant: 115),
            findJobLabel.heightAnchor.constraint(equalToConstant: 19),
            
            emailTextField.topAnchor.constraint(equalTo: findJobView.topAnchor, constant: 59),
            emailTextField.leadingAnchor.constraint(equalTo: findJobView.leadingAnchor, constant: 16.0),
            emailTextField.trailingAnchor.constraint(equalTo: findJobView.trailingAnchor, constant: -16.0),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            continueButton.topAnchor.constraint(equalTo: findJobView.topAnchor, constant: 115),
            continueButton.leadingAnchor.constraint(equalTo: findJobView.leadingAnchor, constant: 16.0),
            continueButton.widthAnchor.constraint(equalToConstant: 167),
            continueButton.heightAnchor.constraint(equalToConstant: 40),
            
            loginWithPassLabel.centerYAnchor.constraint(equalTo: continueButton.centerYAnchor),
            loginWithPassLabel.trailingAnchor.constraint(equalTo: findJobView.trailingAnchor, constant: -22.0),
            loginWithPassLabel.widthAnchor.constraint(equalToConstant: 140),
            loginWithPassLabel.heightAnchor.constraint(equalToConstant: 18),
            
            findWorkersView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            findWorkersView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            findWorkersView.topAnchor.constraint(equalTo: view.topAnchor, constant: 427),
            findWorkersView.heightAnchor.constraint(equalToConstant: 141),
            
            findWorkersLabel.topAnchor.constraint(equalTo: findWorkersView.topAnchor, constant: 24),
            findWorkersLabel.leadingAnchor.constraint(equalTo: findWorkersView.leadingAnchor, constant: 16.0),
            findWorkersLabel.widthAnchor.constraint(equalToConstant: 164),
            findWorkersLabel.heightAnchor.constraint(equalToConstant: 19),
            
            postingVacanciesLabel.topAnchor.constraint(equalTo: findWorkersLabel.topAnchor, constant: 24),
            postingVacanciesLabel.leadingAnchor.constraint(equalTo: findWorkersView.leadingAnchor, constant: 16.0),
            postingVacanciesLabel.widthAnchor.constraint(equalToConstant: 320),
            postingVacanciesLabel.heightAnchor.constraint(equalToConstant: 18),
            
            iFindWorkerButton.topAnchor.constraint(equalTo: findWorkersView.topAnchor, constant: 85),
            iFindWorkerButton.leadingAnchor.constraint(equalTo: findWorkersView.leadingAnchor, constant: 16.0),
            iFindWorkerButton.trailingAnchor.constraint(equalTo: findWorkersView.trailingAnchor, constant: -16.0),
            iFindWorkerButton.heightAnchor.constraint(equalToConstant: 32),
            
            invalidEmailLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: -2),
            invalidEmailLabel.leadingAnchor.constraint(equalTo: findJobView.leadingAnchor, constant: 16.0),
            invalidEmailLabel.widthAnchor.constraint(equalToConstant: 280),
            invalidEmailLabel.heightAnchor.constraint(equalToConstant: 18)
            
        ])
    }
}


extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
