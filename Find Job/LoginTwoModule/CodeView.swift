//
//  CodeView.swift
//  Find Job
//
//  Created by Олег Ковалев on 14.03.2024.
//

import UIKit

class CodeView: UIView {
    var codeTextFields: [CustomTextField] = []
    var lastCharacterEntered: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCodeInputFields()
        codeTextFields[0].becomeFirstResponder()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCodeInputFields()
        codeTextFields[0].becomeFirstResponder()
    }

    private func setupCodeInputFields() {
        for i in 1...4 {
            let textField = CustomTextField()
            textField.index = i
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.textAlignment = .center
            textField.contentVerticalAlignment = .center
            textField.contentHorizontalAlignment = .center

            textField.keyboardType = .numberPad
            textField.delegate = self
            textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            textField.backgroundColor = Constants.Color.grey2
            textField.layer.cornerRadius = 8
            
            textField.font = .boldSystemFont(ofSize: 24)
            textField.textColor = Constants.Color.grey3
            addSubview(textField)
            codeTextFields.append(textField)
        }
        
        setupConstraint()
    }

    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if text.count > 1 {
            textField.text = String(text.prefix(1))
        }
        if let index = codeTextFields.firstIndex(of: textField as! CustomTextField), index < codeTextFields.count - 1 {
            codeTextFields[index + 1].becomeFirstResponder()
            codeTextFields[index + 1].imageView.isHidden = true
        } else {
            codeTextFields[codeTextFields.count - 1].resignFirstResponder()
            lastCharacterEntered?()
        }
    }
    
    func setupConstraint() {
        guard codeTextFields.count == 4 else { return }
        NSLayoutConstraint.activate([
            codeTextFields[0].widthAnchor.constraint(equalToConstant: 48),
            codeTextFields[0].heightAnchor.constraint(equalToConstant: 48),
            codeTextFields[0].leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 0),
            codeTextFields[0].topAnchor.constraint(equalTo: super.topAnchor, constant: 0),
            
            codeTextFields[1].widthAnchor.constraint(equalToConstant: 48),
            codeTextFields[1].heightAnchor.constraint(equalToConstant: 48),
            codeTextFields[1].leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 56),
            codeTextFields[1].topAnchor.constraint(equalTo: super.topAnchor, constant: 0),

            codeTextFields[2].widthAnchor.constraint(equalToConstant: 48),
            codeTextFields[2].heightAnchor.constraint(equalToConstant: 48),
            codeTextFields[2].leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 112),
            codeTextFields[2].topAnchor.constraint(equalTo: super.topAnchor, constant: 0),

            codeTextFields[3].widthAnchor.constraint(equalToConstant: 48),
            codeTextFields[3].heightAnchor.constraint(equalToConstant: 48),
            codeTextFields[3].leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 168),
            codeTextFields[3].topAnchor.constraint(equalTo: super.topAnchor, constant: 0)
        ])
    }
}

extension CodeView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}


class CustomTextField: UITextField {
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "star"))
        return imageView
    }()
    
    var index = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(imageView)
        imageView.contentMode = .center
        addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
    @objc private func textFieldDidChange() {
        imageView.isHidden = !(text?.isEmpty ?? true)
    }
}


