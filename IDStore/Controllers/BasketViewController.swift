//
//  BasketViewController.swift
//  IDStore
//
//  Created by Александр Старков on 13.05.2022.
//

import UIKit

class BasketViewController: UIViewController {
    //MARK: - basketLabel
    private let basketLabel: UILabel = {
        let label = UILabel()
        label.text = "Корзина"
        label.font = .avenirNextDemiBold24()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    } ()
    //MARK: - panierVideLabel
    private let panierVideLabel: UILabel = {
        let label = UILabel()
        label.text = "Корзина пуста"
        label.font = .avenirNextDemiBold24()
        label.textColor = .black
        label.textAlignment = .center
        label.isHidden = false
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    } ()
    //MARK: - descriptionLabel
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Воспользуйтесь каталогом"
        label.font = .avenirNextDemiBold20()
        label.textColor = .specialDarkGrey
        label.textAlignment = .center
        label.isHidden = false
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
       return label
    } ()
    //MARK: - catalogButton
    private let catalogButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius =  10
        button.backgroundColor = .red
        button.setTitle("В каталог", for: .normal) //добавляем заголовок, стиль нормал
        button.titleLabel?.font = .avenirNextDemiBold20() //добавляем шрифт к нашему заголовку
        button.tintColor = .white // подцвечивать цветом наш текст и Image
        button.addTarget(self, action: #selector(catalogButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = false
        button.addShadowOnView(setColor: .darkGray, setOpacity: 0.4, setRadius: 1.0)
        
      return button
    } ()
    @objc private func catalogButtonTapped() {
        print("нажали на catalog button")
    }
    //MARK: - activeBasketView
    private let activeBasketView = ActiveBasketView()
    
    
    
    
    
    //MARK: - setupViews()
    private func setupViews() {
        
        view.backgroundColor = .systemBackground
        view.addSubview(basketLabel)
        view.addSubview(panierVideLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(catalogButton)
        view.addSubview(activeBasketView)
        activeBasketView.isHidden = false
        
    }
    //MARK: - setDelegates()
    private func setDelegates() {
        
    }
    
    
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setDelegates()
        setConstrains()
      
    }
    
    
    
}//закрвывает класс
extension BasketViewController {
    private func setConstrains() { //метод для констреинтов
        
        NSLayoutConstraint.activate([
            basketLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            basketLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            panierVideLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            panierVideLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: panierVideLabel.bottomAnchor, constant: 10),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            catalogButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            catalogButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            catalogButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            activeBasketView.topAnchor.constraint(equalTo: basketLabel.bottomAnchor, constant: 10),
            activeBasketView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            activeBasketView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            activeBasketView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
    }
    
}
