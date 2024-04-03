//
//  TopCollectionViewCell.swift
//  Find Job
//
//  Created by Олег Ковалев on 19.03.2024.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {
    
    let cellModels: [TopCollectionViewCellModel] = [
        TopCollectionViewCellModel(image: UIImage(named: "blueGeo") ?? UIImage(),
                                   label: UILabel(title: "Вакансии рядом с вами")),
        
        TopCollectionViewCellModel(image: UIImage(named: "greenStar") ?? UIImage(),
                                   label: UILabel(title: "Поднять резюме в поиске"),
                                   additionalLabel: UILabel(title: "Поднять")),
        
        TopCollectionViewCellModel(image: UIImage(named: "greenDone") ?? UIImage(),
                                   label: UILabel(title: "Временная работа и подработка"))
    ]
    
    private lazy var customView: UIView = {
        let customView = UIView()
        customView.contentMode = .scaleAspectFill
        customView.clipsToBounds = true
        customView.backgroundColor = Constants.Color.grey1
        customView.layer.cornerRadius = 8
        return customView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = Constants.Fonts.SFProDisplayMedium14Title4
        label.textColor = .white
        return label
    }()
        
    private lazy var additionalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Constants.Fonts.SFProDisplayRegular14Text1andButtonText2
        label.textColor = Constants.Color.green
        label.isHidden = true
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(index: Int) {
        imageView.image = cellModels[index].image
        label.text = cellModels[index].label.text
        if cellModels[index].additionalLabel?.text != nil {
            additionalLabel.text = cellModels[index].additionalLabel?.text
            additionalLabel.isHidden = false
        }
    }
    
    private func setupView() {
        contentView.addSubview(customView)
        customView.addSubview(imageView)
        customView.addSubview(label)
        customView.addSubview(additionalLabel)
    }
    
    private func setupConstraints() {
        customView.frame = contentView.bounds
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: customView.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 8),
            imageView.widthAnchor.constraint(equalToConstant: 32),
            imageView.heightAnchor.constraint(equalToConstant: 32),
            
            label.topAnchor.constraint(equalTo: customView.topAnchor, constant: 58),
            label.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -8),
            
            additionalLabel.topAnchor.constraint(equalTo: customView.topAnchor, constant: 92),
            additionalLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 8),
            additionalLabel.widthAnchor.constraint(equalToConstant: 112),
            additionalLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
    }
}
