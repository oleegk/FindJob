//
//  DetailVacancyViewController.swift
//  Find Job
//
//  Created by Олег Ковалев on 20.03.2024.
//

import UIKit

class DetailVacancyViewController: UIViewController {
    var viewModel: DetailVacancyViewModel?
    
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private var eyeBarButtonItem: UIBarButtonItem = {
        let eyeBarButtonItem = UIBarButtonItem()
        eyeBarButtonItem.image = UIImage(named: "eye")
        eyeBarButtonItem.style = .plain
        eyeBarButtonItem.tintColor = .white
        return eyeBarButtonItem
    }()
    
    private var shareBarButtonItem: UIBarButtonItem = {
        let shareBarButtonItem = UIBarButtonItem()
        shareBarButtonItem.image = UIImage(named: "share")
        shareBarButtonItem.style = .plain
        shareBarButtonItem.tintColor = .white
        return shareBarButtonItem
    }()
    
    private var isFavoriteBarButtonItem: UIBarButtonItem = {
        let isFavoriteBarButtonItem = UIBarButtonItem()
        isFavoriteBarButtonItem.style = .plain
        return isFavoriteBarButtonItem
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.SFProDisplaySemibold22Title1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var salaryLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var experienceLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var schedulesLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    
    private lazy var appliedNumberView: UIView = {
        let view = UIView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.backgroundColor = Constants.Color.greenDark
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    private lazy var appliedNumberLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var appliedNumberimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "greenApplied")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var lookingNumberView: UIView = {
        let view = UIView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.backgroundColor = Constants.Color.greenDark
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    private lazy var lookingNumberLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var lookingNumberImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "greenLooking")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var mapView: UIView = {
        let view = UIView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.backgroundColor = Constants.Color.grey1
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageInMapView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "mapImage")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var nameCompanyLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.SFProDisplayMedium16Title3
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var youTaskLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваши задачи"
        label.font = Constants.Fonts.SFProDisplaySemibold20Title2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    private lazy var responsibilitiesLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    
    private lazy var questionForEmployerLabel: UILabel = {
        let label = UILabel()
        label.text = "Задайте вопрос работодателю"
        label.font = Constants.Fonts.SFProDisplayMedium14Title4
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var heWillgetAquestionLabel: UILabel = {
        let label = UILabel()
        label.text = "Он получит его с откликом на вакансию"
        label.font = Constants.Fonts.SFProDisplayMedium14Title4
        label.textColor = Constants.Color.grey3
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private var respondButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.Color.green
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        
        button.isEnabled = false
        button.setTitle("Откликнуться", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Constants.Fonts.SFProDisplaySemibold16ButtonText1
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    
    private func setupView() {
        setupButtonReplacement()
        
        navigationController?.navigationBar.barTintColor = .black
        view.backgroundColor = .black
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(salaryLabel)
        contentView.addSubview(experienceLabel)
        contentView.addSubview(schedulesLabel)
        
        contentView.addSubview(appliedNumberView)
        appliedNumberView.addSubview(appliedNumberLabel)
        appliedNumberView.addSubview(appliedNumberimageView)
        
        contentView.addSubview(lookingNumberView)
        lookingNumberView.addSubview(lookingNumberLabel)
        lookingNumberView.addSubview(lookingNumberImageView)
        
        contentView.addSubview(mapView)
        mapView.addSubview(nameCompanyLabel)
        mapView.addSubview(imageInMapView)
        mapView.addSubview(addressLabel)
        
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(youTaskLabel)
        contentView.addSubview(responsibilitiesLabel)
        
        contentView.addSubview(questionForEmployerLabel)
        contentView.addSubview(heWillgetAquestionLabel)
        
        contentView.addSubview(stackView)
        contentView.addSubview(respondButton)
    }
    
    
    func configure() {
        if let vacancy = viewModel?.vacancy {
            
            titleLabel.text = vacancy.title
            salaryLabel.text = vacancy.salary?.full
            experienceLabel.text = "Требуемый опыт: \(vacancy.experience?.text ?? "")"
            schedulesLabel.text = viewModel?.setupSchedules(schedules: vacancy.schedules ?? [""])
            if let appliedNumber = vacancy.appliedNumber { showAppliedNumberView(appliedNumber) }
            if let lookingNumber = vacancy.lookingNumber { showlookingNumberView(lookingNumber) }
            if let nameCompany = vacancy.company { setupNameCompanyText(nameCompany) }
            if let address = vacancy.address { setupAddress(address) }
            if let description = vacancy.description { descriptionLabel.text = description }
            responsibilitiesLabel.text = vacancy.responsibilities
            if let questions = vacancy.questions { addTextInQuestions(questions) }
            if let isFavorite = vacancy.isFavorite { setupIsFavoriteBarButtonItem(isFavorite) }
        }
    }
    
    
    private func showAppliedNumberView(_ appliedNumber: Int) {
        appliedNumberView.isHidden = false
        appliedNumberLabel.text = formatAppliedPeopleCount(appliedNumber)
    }
    
    private func showlookingNumberView(_ lookingNumber: Int) {
        lookingNumberView.isHidden = false
        lookingNumberLabel.text = formatlookingPeopleCount(lookingNumber)
    }
    
    private func setupNameCompanyText(_ nameCompany: String) {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "checkMark")
        let imageString = NSAttributedString(attachment: imageAttachment)
        
        let fontDescender = nameCompanyLabel.font.descender
        let imageHeight = imageAttachment.image!.size.height
        let baselineOffset = fontDescender + (nameCompanyLabel.font.lineHeight - imageHeight) / 2
        
        imageAttachment.bounds = CGRect(x: 0, y: baselineOffset, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: nameCompany + " "))
        attributedString.append(imageString)
        
        nameCompanyLabel.attributedText = attributedString
    }
    
    private func setupAddress(_ address: Address) {
        addressLabel.text = viewModel?.setupAddress(address)
    }
    
    private func addTextInQuestions(_ questions: [String]) {
        questions.forEach { question in
            
            let view: QuestionView = {
                let view = QuestionView()
                view.translatesAutoresizingMaskIntoConstraints = false
                view.configure(question: question)
                return view
            }()
            
            stackView.addArrangedSubview(view)
        }
    }
    
    private func setupButtonReplacement() {
        let backButton = UIBarButtonItem(image: UIImage(named: "left"), style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.title = ""
        backButton.tintColor = .white
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItems = [isFavoriteBarButtonItem, shareBarButtonItem, eyeBarButtonItem]
    }
    
    @objc func backButtonTapped() {
        viewModel?.backButtonTapped()
    }
    
    private func setupIsFavoriteBarButtonItem(_ isFavorite: Bool) {
        isFavoriteBarButtonItem.target = self
        isFavoriteBarButtonItem.action = #selector(tapIsFavorite)
        if isFavorite {
            isFavoriteBarButtonItem.image = UIImage(named: "heart")
            isFavoriteBarButtonItem.tintColor = .systemBlue
        } else {
            isFavoriteBarButtonItem.image = UIImage(named: "favorites")
            isFavoriteBarButtonItem.tintColor = .white
        }
    }
    
    @objc func tapIsFavorite() {
        if isFavoriteBarButtonItem.tintColor == .white {
            isFavoriteBarButtonItem.image = UIImage(named: "heart")
            isFavoriteBarButtonItem.tintColor = .systemBlue
            viewModel?.updateFavoriteStatus(true)
            
        } else {
            isFavoriteBarButtonItem.image = UIImage(named: "favorites")
            isFavoriteBarButtonItem.tintColor = .white
            viewModel?.updateFavoriteStatus(false)
        }
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.widthAnchor.constraint(equalToConstant: 217),
            
            salaryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            salaryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            salaryLabel.widthAnchor.constraint(equalToConstant: 217),
            
            experienceLabel.topAnchor.constraint(equalTo: salaryLabel.bottomAnchor, constant: 16),
            experienceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            experienceLabel.widthAnchor.constraint(equalToConstant: 217),
            
            schedulesLabel.topAnchor.constraint(equalTo: experienceLabel.bottomAnchor, constant: 10),
            schedulesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            schedulesLabel.widthAnchor.constraint(equalToConstant: 217),
            
            
            appliedNumberView.topAnchor.constraint(equalTo: schedulesLabel.bottomAnchor, constant: 30),
            appliedNumberView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            appliedNumberView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.44),
            appliedNumberView.heightAnchor.constraint(equalToConstant: 50),
            
            appliedNumberLabel.topAnchor.constraint(equalTo: appliedNumberView.topAnchor, constant: 8),
            appliedNumberLabel.leadingAnchor.constraint(equalTo: appliedNumberView.leadingAnchor, constant: 8),
            appliedNumberLabel.widthAnchor.constraint(equalToConstant: 107),
            appliedNumberLabel.heightAnchor.constraint(equalToConstant: 34),
            
            appliedNumberimageView.topAnchor.constraint(equalTo: appliedNumberView.topAnchor, constant: 8),
            appliedNumberimageView.trailingAnchor.constraint(equalTo: appliedNumberView.trailingAnchor, constant: -8),
            appliedNumberimageView.widthAnchor.constraint(equalToConstant: 16),
            appliedNumberimageView.heightAnchor.constraint(equalToConstant: 16),
            
            
            lookingNumberView.topAnchor.constraint(equalTo: schedulesLabel.bottomAnchor, constant: 30),
            lookingNumberView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            lookingNumberView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.44),
            lookingNumberView.heightAnchor.constraint(equalToConstant: 50),
            
            lookingNumberLabel.topAnchor.constraint(equalTo: lookingNumberView.topAnchor, constant: 8),
            lookingNumberLabel.leadingAnchor.constraint(equalTo: lookingNumberView.leadingAnchor, constant: 8),
            lookingNumberLabel.widthAnchor.constraint(equalToConstant: 107),
            lookingNumberLabel.heightAnchor.constraint(equalToConstant: 34),
            
            lookingNumberImageView.topAnchor.constraint(equalTo: lookingNumberView.topAnchor, constant: 8),
            lookingNumberImageView.trailingAnchor.constraint(equalTo: lookingNumberView.trailingAnchor, constant: -8),
            lookingNumberImageView.widthAnchor.constraint(equalToConstant: 16),
            lookingNumberImageView.heightAnchor.constraint(equalToConstant: 16),
            
            
            mapView.topAnchor.constraint(equalTo: schedulesLabel.bottomAnchor, constant: 100),
            mapView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mapView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            mapView.heightAnchor.constraint(equalToConstant: 134),
            
            nameCompanyLabel.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 12),
            nameCompanyLabel.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 16),
            nameCompanyLabel.heightAnchor.constraint(equalToConstant: 19),
            
            imageInMapView.topAnchor.constraint(equalTo: nameCompanyLabel.bottomAnchor, constant: 8),
            imageInMapView.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 16),
            imageInMapView.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -16),
            imageInMapView.heightAnchor.constraint(equalToConstant: 58),
            
            addressLabel.topAnchor.constraint(equalTo: imageInMapView.bottomAnchor, constant: 8),
            addressLabel.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 16),
            addressLabel.heightAnchor.constraint(equalToConstant: 17),
            
            
            descriptionLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 19),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            youTaskLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 25),
            youTaskLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            youTaskLabel.heightAnchor.constraint(equalToConstant: 24),
            
            responsibilitiesLabel.topAnchor.constraint(equalTo: youTaskLabel.bottomAnchor, constant: 19),
            responsibilitiesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            responsibilitiesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            questionForEmployerLabel.topAnchor.constraint(equalTo: responsibilitiesLabel.bottomAnchor, constant: 25),
            questionForEmployerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            heWillgetAquestionLabel.topAnchor.constraint(equalTo: questionForEmployerLabel.bottomAnchor, constant: 10),
            heWillgetAquestionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            stackView.topAnchor.constraint(equalTo: heWillgetAquestionLabel.bottomAnchor, constant: 19),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            
            respondButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            respondButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            respondButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            respondButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            respondButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
