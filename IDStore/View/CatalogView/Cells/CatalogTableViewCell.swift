//
//  CatalogTableViewCell.swift
//  IDStore
//
//  Created by Александр Старков on 17.05.2022.
//

import UIKit

class CatalogTableViewCell: UITableViewCell {

    //MARK: - backgroundCell
    private let backgroundCell: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .specialBackground
        view.addShadowOnView(setColor: .darkGray, setOpacity: 0.5, setRadius: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   //MARK: - catalogBackgroundView
    private let catalogBackgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = .specialBackground
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //MARK: - productNameLabel
     private let productNameLabel: UILabel = {
        let label = UILabel()
         label.text = "Чехлы для AirPods"
         label.textColor = .specialBlack
         label.font = .sanFrancissco16()
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    //MARK: - productImageView
    private let productImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "casForAirPods")
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - tableStackView
   var tableStackView = UIStackView()

    
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
         
//          tableStackView = UIStackView(arrangedSubviews: [productNameLabel, productImageView])
//         tableStackView.axis = .horizontal
//         tableStackView.spacing = 10
         
    //     addSubview(tableStackView)
         addSubview(backgroundCell)
         addSubview(catalogBackgroundView)
         addSubview(productNameLabel)
         addSubview(productImageView)
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
extension CatalogTableViewCell {
    private func setConstrains() { //метод для констреинтов
      
    
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 60),
            productNameLabel.trailingAnchor.constraint(equalTo: catalogBackgroundView.leadingAnchor, constant: -10),
            productNameLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            catalogBackgroundView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            catalogBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            catalogBackgroundView.heightAnchor.constraint(equalToConstant: 150),
            catalogBackgroundView.widthAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: catalogBackgroundView.topAnchor, constant: 10),
            productImageView.leadingAnchor.constraint(equalTo: catalogBackgroundView.leadingAnchor, constant: 10),
            productImageView.trailingAnchor.constraint(equalTo: catalogBackgroundView.trailingAnchor, constant: -10),
            productImageView.bottomAnchor.constraint(equalTo: catalogBackgroundView.bottomAnchor, constant: -10)
        ])

  }
}


