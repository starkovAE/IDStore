//
//  FavoritesTableViewCell.swift
//  IDStore
//
//  Created by Александр Старков on 17.05.2022.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    //MARK: - backgroundCell
    private let favoritesBackgroundCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .specialBackground
        view.addShadowOnView(setColor: .darkGray, setOpacity: 0.5, setRadius: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   //MARK: - catalogBackgroundView
    private let favoritesBackgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = .specialBackground
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //MARK: - productNameLabel
     private let favoritesProductNameLabel: UILabel = {
        let label = UILabel()
         label.text = "Чехлы для AirPods"
         label.textAlignment = .left
         label.textColor = .specialBlack
         label.font = .sanFrancissco16()
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    private let favoritesPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "400₽"
        label.textColor = .black
        label.textAlignment = .left
        label.font = .avenirNextDemiBold20()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //MARK: - productImageView
    private let favoritesProductImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "casesForAirPods2")
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    //MARK: - productImageView
    let favoritesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "love")?.withRenderingMode(.alwaysOriginal), for: .normal) //добавляем Image из Assets
        button.tintColor = .black // подцвечивать цветом наш текст и Image
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(favoritesButtonTapped), for: .touchUpInside)
        return button
    } ()
    @objc private func favoritesButtonTapped() {
        print("tap editing button")
        //cellNextDelegates?.editingTapped()
        
    }
    //MARK: - tableStackView
  // var tableStackView = UIStackView()

    
    // MARK: - Инициализаторы
         override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
                super.init(style: style, reuseIdentifier: reuseIdentifier)

                setupViews()
                setConstrains()
            }

            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
  
     //MARK: - setupViews()
     private func setupViews() {
         backgroundColor = .clear
         selectionStyle = .none
         
//          tableStackView = UIStackView(arrangedSubviews: [favoritesProductNameLabel, favoritesPriceLabel])
//         tableStackView.axis = .vertical
//         tableStackView.spacing = 10
         
    //     addSubview(tableStackView)
         addSubview(favoritesBackgroundCell)
         addSubview(favoritesBackgroundView)
         addSubview(favoritesProductNameLabel)
         addSubview(favoritesProductImageView)
         addSubview(favoritesPriceLabel)
         addSubview(favoritesButton)
         
      //   addSubview(separatorView)
         
     }
  //   func cellConfigure(differenceWorkout: DifferenceWorkout) {
//        workoutNameLabel.text = differenceWorkout.name
//        beforeRepsLabel.text = "Before: \(differenceWorkout.firstReps)"
//        nowRepsLabel.text = "Now: \(differenceWorkout.lastReps)"
//        let difference = differenceWorkout.lastReps - differenceWorkout.firstReps
//        statisticRepsLabel.text = "\(difference)"
//        switch difference {
//        case ..<0 :
//            statisticRepsLabel.textColor = .specialDarkYellow
//        case 1...:
//            statisticRepsLabel.textColor = .specialGreen
//        default:
//            statisticRepsLabel.textColor = .specialGray
//        }
//
  //  }
 } //закрывает класс

 //MARK: - Extensions
extension FavoritesTableViewCell {
    private func setConstrains() { //метод для констреинтов
      
    
        NSLayoutConstraint.activate([
            favoritesBackgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            favoritesBackgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            favoritesBackgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            favoritesBackgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            favoritesProductNameLabel.topAnchor.constraint(equalTo: favoritesBackgroundCell.topAnchor, constant: 15),
            favoritesProductNameLabel.leadingAnchor.constraint(equalTo: favoritesBackgroundView.trailingAnchor, constant: 5),
            favoritesProductNameLabel.trailingAnchor.constraint(equalTo: favoritesBackgroundCell.trailingAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            favoritesPriceLabel.topAnchor.constraint(equalTo: favoritesProductNameLabel.bottomAnchor, constant: 10),
            favoritesPriceLabel.leadingAnchor.constraint(equalTo: favoritesBackgroundView.trailingAnchor, constant: 5),
            favoritesPriceLabel.trailingAnchor.constraint(equalTo: favoritesBackgroundCell.trailingAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            favoritesBackgroundView.centerYAnchor.constraint(equalTo: favoritesBackgroundCell.centerYAnchor),
            favoritesBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            favoritesBackgroundView.heightAnchor.constraint(equalToConstant: 130),
            favoritesBackgroundView.widthAnchor.constraint(equalToConstant: 130)
        ])
        NSLayoutConstraint.activate([
            favoritesProductImageView.topAnchor.constraint(equalTo: favoritesBackgroundView.topAnchor, constant: 10),
            favoritesProductImageView.leadingAnchor.constraint(equalTo: favoritesBackgroundView.leadingAnchor, constant: 10),
            favoritesProductImageView.trailingAnchor.constraint(equalTo: favoritesBackgroundView.trailingAnchor, constant: -10),
            favoritesProductImageView.bottomAnchor.constraint(equalTo: favoritesBackgroundView.bottomAnchor, constant: -10)
        ])
        NSLayoutConstraint.activate([
            favoritesButton.topAnchor.constraint(equalTo: favoritesBackgroundCell.topAnchor, constant: 50),
            favoritesButton.trailingAnchor.constraint(equalTo:  favoritesBackgroundCell.trailingAnchor, constant: -20),
            favoritesButton.heightAnchor.constraint(equalToConstant: 18)
           
        ])

  }
}
