//
//  LoginTwoViewController.swift
//  Find Job
//
//  Created by Олег Ковалев on 13.03.2024.
//

import UIKit


class LoginTwoViewController: UIViewController {
    
    var viewModel: LoginTwoViewModel?
    
    var button = UIButton(frame: CGRect(x: 100, y: 159, width: 70, height: 70))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        view.addSubview(button)
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    @objc func tapButton() {
        viewModel?.didTapButton()
    }
    
    func setupView() {
        view.backgroundColor = .systemGray4
    }
}

