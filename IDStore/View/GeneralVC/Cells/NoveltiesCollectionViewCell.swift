//
//  NoveltiesCollectionViewCell.swift
//  IDStore
//
//  Created by Александр Старков on 16.05.2022.
//

import UIKit

class NoveltiesCollectionViewCell: UICollectionViewCell {
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Чехол Iphone"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .avenirMedium22()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let productImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "casesIphone")//?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "iphone 7/8"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .avenirMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //MARK: - Инициализаторы
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - setupViews
    private func setupViews() {
        layer.cornerRadius = 20
        backgroundColor = .specialRed
        
        addSubview(productNameLabel)
        addSubview(productImageView)
        addSubview(numberLabel)
    }
    
//     func cellConfigure(model: ResultWorkout) { //передаем в метод структуру ResultWorkout
//        nameLabel.text = model.name
//        numberLabel.text = "\(model.result)"
//
//        guard let data = model.imageData else { return }
//        let image = UIImage(data: data)
//        workoutImageView.image = image
//
//    }
    //MARK: - setConstraints
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            productNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 10),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            productImageView.heightAnchor.constraint(equalToConstant: 57),
            productImageView.widthAnchor.constraint(equalToConstant: 57)
        ])
        
        NSLayoutConstraint.activate([
            numberLabel.centerYAnchor.constraint(equalTo: productImageView.centerYAnchor),
            numberLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 10)
        ])
    }
}

    
    
    
    
    

