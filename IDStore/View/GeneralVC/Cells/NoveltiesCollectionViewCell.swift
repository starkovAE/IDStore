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
        label.text = "Cases for iphone"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .avenirNextDemiBold20()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Защитный чехол для Iphone 7/8"
        label.textColor = .specialGray
        label.textAlignment = .left
        label.font = .avenirMedium12()
        label.adjustsFontSizeToFitWidth = true // свойство - которое, уменьшает шрифт в зависимости от ширины label
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 2 //свойство - которое уменьшает шрифт (шрифт на 30 % , на 50%)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let productImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "casesIphone")
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let loveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "love")?.withRenderingMode(.alwaysOriginal), for: .normal) //добавляем Image из Assets
        button.tintColor = .black // подцвечивать цветом наш текст и Image
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loveButtonTapped), for: .touchUpInside)
        return button
    } ()
    @objc private func loveButtonTapped() {
        print("tap editing button")
        //cellNextDelegates?.editingTapped()
        
    }
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "600₽"
        label.textColor = .black
        label.textAlignment = .left
        label.font = .avenirNextDemiBold20()
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
        backgroundColor = .white
        addShadowOnView(setColor: .black, setOpacity: 0.7, setRadius: 2.0)
        
        addSubview(productNameLabel)
        addSubview(productImageView)
        addSubview(priceLabel)
        addSubview(loveButton)
        addSubview(descriptionLabel)
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
            productImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            productImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 2),
            priceLabel.leadingAnchor.constraint(equalTo:  leadingAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            loveButton.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 2),
            loveButton.trailingAnchor.constraint(equalTo:  trailingAnchor, constant: -10),
            loveButton.heightAnchor.constraint(equalToConstant: 18)
           
        ])
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: loveButton.bottomAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo:  trailingAnchor, constant: -10),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
           
        ])
    }
}

    
    
    
    
    

