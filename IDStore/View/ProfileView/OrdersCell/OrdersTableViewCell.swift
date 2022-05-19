//
//  OrdersTableViewCell.swift
//  IDStore
//
//  Created by Александр Старков on 19.05.2022.
//

import UIKit
class OrdersTableViewCell: UITableViewCell {
    

private let orderBackgroundCell: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 10
    view.backgroundColor = .specialBackground
    view.addShadowOnView(setColor: .black, setOpacity: 0.5, setRadius: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
}()
//MARK: - catalogBackgroundView
private let productBackgroundView: UIView = {
   let view = UIView()
    view.backgroundColor = .specialBackground
    view.layer.cornerRadius = 20
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
}()
//MARK: - productNameLabel
 private let productNameLabel: UILabel = {
    let label = UILabel()
     label.text = "Геймпад PS3"
     label.textAlignment = .left
     label.textColor = .specialBlack
     label.font = .sanFrancissco16()
     label.translatesAutoresizingMaskIntoConstraints = false
     return label
 }()
private let priceLabel: UILabel = {
    let label = UILabel()
    label.text = "400₽"
    label.textColor = .black
    label.textAlignment = .left
    label.font = .avenirNextDemiBold20()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}()
//MARK: - productImageView
private let productImageView: UIImageView = {
   let imageView = UIImageView()
    imageView.image = UIImage(named: "dualShock")
    imageView.clipsToBounds = true
    imageView.tintColor = .white
    imageView.contentMode = .scaleAspectFit
    imageView.layer.cornerRadius = 10
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
}()
    
    //MARK: - statusNameLabel
     private let statusNameLabel: UILabel = {
        let label = UILabel()
         label.text = "Статус"
         label.textAlignment = .center
         label.textColor = .specialBlack
         label.font = .sanFrancissco16()
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    //MARK: - statusImageView
    private let statusImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "checkmark.circle")
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

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
     addSubview(orderBackgroundCell)
     orderBackgroundCell.addSubview(productBackgroundView)
     orderBackgroundCell.addSubview(productNameLabel)
     orderBackgroundCell.addSubview(productImageView)
     orderBackgroundCell.addSubview(priceLabel)
     orderBackgroundCell.addSubview(statusImageView)
     orderBackgroundCell.addSubview(statusNameLabel)

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
extension OrdersTableViewCell {
private func setConstrains() { //метод для констреинтов
  

    NSLayoutConstraint.activate([
        orderBackgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 5),
        orderBackgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        orderBackgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        orderBackgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
    ])
    
    NSLayoutConstraint.activate([
        productNameLabel.topAnchor.constraint(equalTo: orderBackgroundCell.topAnchor, constant: 15),
        productNameLabel.leadingAnchor.constraint(equalTo: productBackgroundView.trailingAnchor, constant: 5),
        productNameLabel.trailingAnchor.constraint(equalTo: statusNameLabel.leadingAnchor, constant: -20)
    ])
    NSLayoutConstraint.activate([
        priceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 10),
        priceLabel.leadingAnchor.constraint(equalTo: productBackgroundView.trailingAnchor, constant: 5),
        priceLabel.trailingAnchor.constraint(equalTo: orderBackgroundCell.trailingAnchor, constant: -10)
    ])
    NSLayoutConstraint.activate([
        productBackgroundView.centerYAnchor.constraint(equalTo: orderBackgroundCell.centerYAnchor),
        productBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        productBackgroundView.heightAnchor.constraint(equalToConstant: 90),
        productBackgroundView.widthAnchor.constraint(equalToConstant: 90)
    ])
    NSLayoutConstraint.activate([
        productImageView.topAnchor.constraint(equalTo: productBackgroundView.topAnchor, constant: 5),
        productImageView.leadingAnchor.constraint(equalTo: productBackgroundView.leadingAnchor, constant: 5),
        productImageView.trailingAnchor.constraint(equalTo: productBackgroundView.trailingAnchor, constant: -5),
        productImageView.bottomAnchor.constraint(equalTo: productBackgroundView.bottomAnchor, constant: -5)
    ])
    NSLayoutConstraint.activate([
        statusImageView.topAnchor.constraint(equalTo: statusNameLabel.bottomAnchor, constant: 15),
        statusImageView.trailingAnchor.constraint(equalTo:  orderBackgroundCell.trailingAnchor, constant:  -20),
        statusImageView.widthAnchor.constraint(equalToConstant: 20)
       
    ])
    NSLayoutConstraint.activate([
        statusNameLabel.topAnchor.constraint(equalTo: orderBackgroundCell.topAnchor, constant: 15),
        statusNameLabel.trailingAnchor.constraint(equalTo: orderBackgroundCell.trailingAnchor, constant: -10),
        statusNameLabel.leadingAnchor.constraint(equalTo: productNameLabel.trailingAnchor, constant: 10)
       
    ])

}
}
