//
//  QuestionView.swift
//  Find Job
//
//  Created by Олег Ковалев on 27.03.2024.
//

import UIKit

class QuestionView: UIView {
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private var question: String?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(question: String) {
        self.question = question
        label.text = question
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
    
    private func setupView() {
        backgroundColor = Constants.Color.grey2
        label.font = Constants.Fonts.SFProDisplayMedium14Title4
        addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 10
            ),
            label.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -10
            ),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
}
