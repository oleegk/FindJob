//
//  CollectionViewCell.swift
//  Find Job
//
//  Created by Олег Ковалев on 19.03.2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let viewModel = CollectionViewCellViewModel()
    
    var cellTappedClosure: (() -> Void)?
    
    var isFavoriteTappedClosure: ((Bool) -> Void)?
    
    private let lookingNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.Color.green
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = Constants.Fonts.SFProDisplayMedium16Title3
        label.numberOfLines = 0
        
        return label
    }()
    
    private let salaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = Constants.Fonts.SFProDisplaySemibold20Title2
        label.numberOfLines = 0
        return label
    }()
    
    private let adressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        return label
    }()
    
    private let nameCompanyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        return label
    }()
    
    private let experienceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        return label
    }()
    
    private let publicationDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.Color.grey3
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        return label
    }()
    
    var isFavoriteImageView: UIImageView = {
        let heartImageView = UIImageView()
        heartImageView.image = UIImage(named: "favorites")
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        return heartImageView
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 9
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var respondButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.Color.green
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        
        button.isEnabled = false
        button.setTitle("Откликнуться", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(_ vacancy: Vacancy) {
        
        if let number = vacancy.lookingNumber { addLookingNumberInStackView(number) }
        if let isFavorite = vacancy.isFavorite { isFavoriteVacancy(isFavorite) }
        if let title = vacancy.title { addTitle(title) }
        if let salary = vacancy.salary?.full { addSalary(salary) }
        if let town = vacancy.address?.town { addAdress(town) }
        if let company = vacancy.company { addCompany(company) }
        if let experience = vacancy.experience?.previewText { addExperience(experience) }
        if let date = vacancy.publishedDate { addPublicationDate(date) }
    }
    
    func isFavoriteVacancy(_ value: Bool) {
        if value {
            isFavoriteImageView.image = UIImage(named: "heart")
            isFavoriteImageView.isFavorite = true
            
        } else {
            isFavoriteImageView.image = UIImage(named: "favorites")
            isFavoriteImageView.isFavorite = false
        }
    }
    
    func addLookingNumberInStackView(_ number: Int) {
        lookingNumber.text = formatPeopleCount(number)
        stackView.addArrangedSubview(lookingNumber)
    }
    
    func addTitle(_ title: String) {
        titleLabel.text = title
        stackView.addArrangedSubview(titleLabel)
    }
    
    func addSalary(_ salary: String) {
        salaryLabel.text = salary
        stackView.addArrangedSubview(salaryLabel)
    }
    
    func addAdress(_ town: String) {
        adressLabel.text = town
        stackView.addArrangedSubview(adressLabel)
    }
    
    func addCompany(_ company: String) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "checkMark")
        let imageString = NSAttributedString(attachment: imageAttachment)
        
        let fontDescender = nameCompanyLabel.font.descender
        let imageHeight = imageAttachment.image!.size.height
        let baselineOffset = fontDescender + (nameCompanyLabel.font.lineHeight - imageHeight) / 2
        
        imageAttachment.bounds = CGRect(x: 0, y: baselineOffset, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)

        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: company + " "))
        attributedString.append(imageString)
        
        nameCompanyLabel.attributedText = attributedString
        stackView.addArrangedSubview(nameCompanyLabel)
    }
    
    func addExperience(_ experience: String) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "experience")
        let imageString = NSAttributedString(attachment: imageAttachment)
        
        let fontDescender = experienceLabel.font.descender
        let imageHeight = imageAttachment.image!.size.height
        let baselineOffset = fontDescender + (experienceLabel.font.lineHeight - imageHeight) / 2
        
        imageAttachment.bounds = CGRect(x: 0, y: baselineOffset, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        let textString = NSAttributedString(string: " " + experience)
        
        let attributedString = NSMutableAttributedString()
        attributedString.append(imageString)
        attributedString.append(textString)
        
        experienceLabel.attributedText = attributedString
        stackView.addArrangedSubview(experienceLabel)
    }
    
    func addPublicationDate(_ date: String) {
        publicationDateLabel.text = viewModel.formatDate(date)
        stackView.addArrangedSubview(publicationDateLabel)
    }
    
    func addGestureOnHeart() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(isFavoriteViewTapped))
        isFavoriteImageView.isUserInteractionEnabled = true
        isFavoriteImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func isFavoriteViewTapped() {
        if isFavoriteImageView.image == UIImage(named: "heart") {
            isFavoriteImageView.image = UIImage(named: "favorites")
            isFavoriteImageView.isFavorite = false
            if let isFavoriteTappedClosure = isFavoriteTappedClosure {
                isFavoriteTappedClosure(false)
            }
        } else {
            isFavoriteImageView.isFavorite = true
            isFavoriteImageView.image = UIImage(named: "heart")
            if let isFavoriteTappedClosure = isFavoriteTappedClosure {
                isFavoriteTappedClosure(true)
            }
        }
    }
    
    func addGestureOnCell() -> UITapGestureRecognizer {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        tapGesture.cancelsTouchesInView = false
        return tapGesture
    }
    
    @objc func cellTapped(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: contentView)
        if !respondButton.frame.contains(location) {
            cellTappedClosure?()
        }
    }

    func setupView() {
        contentView.backgroundColor = Constants.Color.grey1
        contentView.layer.cornerRadius = 8
        
        contentView.addSubview(stackView)
        contentView.addSubview(respondButton)
        contentView.addSubview(isFavoriteImageView)
        contentView.addGestureRecognizer(addGestureOnCell())
        addGestureOnHeart()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.widthAnchor.constraint(equalToConstant: 248),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -60),
            
            respondButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            respondButton.heightAnchor.constraint(equalToConstant: 32),
            respondButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            respondButton.widthAnchor.constraint(equalToConstant: contentView.frame.size.width - 32),

            isFavoriteImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            isFavoriteImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            isFavoriteImageView.heightAnchor.constraint(equalToConstant: 24),
            isFavoriteImageView.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
}


