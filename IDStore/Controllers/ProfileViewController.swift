//
//  ProfileViewController.swift
//  IDStore
//
//  Created by Александр Старков on 13.05.2022.
//

import UIKit
import Foundation
class ProfileViewController: UIViewController {
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Профиль"
        label.font = .avenirNextDemiBold24()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Александр"
        label.textColor = .specialBlack
        label.font = .avenirNextDemiBold20()
        label.adjustsFontSizeToFitWidth = true // свойство - которое, уменьшает шрифт в зависимости от ширины label
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - settingsProfileButton
    let settingsProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "settings")?.withRenderingMode(.alwaysOriginal), for: .normal) //добавляем Image из Assets
        button.tintColor = .black // подцвечивать цветом наш текст и Image
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(settingsUserButtonTapped), for: .touchUpInside)
        return button
    } ()
    @objc private func settingsUserButtonTapped() {
        print("tap editing button")
        //cellNextDelegates?.editingTapped()
        
    }
    //MARK: - showAllButton()
    private let showAllButton = UIButton(setImageName: "tablecells.badge.ellipsis", setSelector: #selector(showAllButtonTapped), setTarget: self)
    @objc private func showAllButtonTapped() {
        print("tap editing button")
    }
    
    
    //MARK: - cardView
    
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 20
        
        
        view.addShadowOnView(setColor: .black, setOpacity: 0.2, setRadius: 0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    //MARK: - backgroundTableView
    private let backgroundTableView = UIView(setColor: .white, setRadius: 20, setAlpha: 1.0)
    
    //MARK: - ordersTableView
    private let ordersTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none //разделяющие линии убрали
        tableView.bounces = false //чтобы не оттягивалось
        tableView.showsVerticalScrollIndicator = true //не показывает скролл индикатор
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return  tableView
    } ()
    private let idOrdersTableViewCell = "idOrdersTableViewCell"
    //MARK: -  ordersLabel
    private let ordersLabel = UILabel(text: "Заказы")
    
    //MARK: - backgroundConnectionView
    private let backgroundConnectionView = UIView(setColor: .white, setRadius: 20, setAlpha: 1.0)
    
    //MARK: - connectionLabel
    
    private let connectionLabel = UILabel(text: "Мы в соц-сетях")
    
    private let connectImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "message")
        imageView.clipsToBounds = true
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    //MARK: - instaButton
    let instaButton = UIButton(setImageName: "insta", setSelector: #selector(instaButtonTapped), setTarget: self)
    @objc private func instaButtonTapped() {
        print("tap editing button")
        //cellNextDelegates?.editingTapped()
        
    }
    //MARK: - vkButton
    let vkButton = UIButton(setImageName: "vk", setSelector: #selector(instaButtonTapped), setTarget: self)
    @objc private func vkButtonTapped() {
        print("tap editing button")
        //cellNextDelegates?.editingTapped()
        
    }
    //MARK: - telegaButton
    let telegaButton = UIButton(setImageName: "telega", setSelector: #selector(instaButtonTapped), setTarget: self)
    @objc private func telegaButtonTapped() {
        print("tap editing button")
        //cellNextDelegates?.editingTapped()
        
    }
    //    //MARK: - buttonStackView
    //    private var buttonStackView: UIStackView = {
    //        let stackView = UIStackView()
    //        stackView.axis = .horizontal
    //        stackView.spacing = 5
    //        stackView.alignment = .fill
    //        stackView.distribution = .fill
    //        stackView.translatesAutoresizingMaskIntoConstraints = false
    //        return stackView
    //    } ()
    //
    private let questionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "arrowshape.turn.up.right")?.withRenderingMode(.alwaysOriginal), for: .normal) //добавляем Image из Assets
        button.setTitle("Часто задаваемые вопросы      ", for: .normal) //добавляем заголовок, стиль нормал
        button.titleLabel?.font = .avenirNextDemiBold20() //добавляем шрифт к нашему заголовку
        button.tintColor = .black // подцвечивать цветом наш текст и Image
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        button.addShadowOnView(setColor: .black, setOpacity: 0.1, setRadius: 0.2)
        button.imageEdgeInsets = UIEdgeInsets(top: 0,
                                              left: 300,
                                              bottom: 0,
                                              right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0,
                                              left: 0,
                                              bottom: 0,
                                              right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(questionsButtonTapped), for: .touchUpInside)
        return button
    } ()
    @objc private func questionsButtonTapped() {
        print("tap editing button")
        //cellNextDelegates?.editingTapped()
        
    }
    
    
    //MARK: - setupViews
    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(userNameLabel)
        view.addSubview(settingsProfileButton)
        view.addSubview(cardView)
        view.addSubview(backgroundTableView)
        backgroundTableView.addSubview(ordersLabel)
        backgroundTableView.addSubview(showAllButton)
        view.addSubview(profileLabel)
        view.addSubview(backgroundConnectionView)
        backgroundConnectionView.addSubview(connectionLabel)
        backgroundConnectionView.addSubview(connectImageView)
        backgroundTableView.addSubview(ordersTableView)
        
        //       buttonStackView = UIStackView(arrangedSubviews: [instaButton, vkButton, telegaButton])
        
        
        backgroundConnectionView.addSubview(instaButton)
        backgroundConnectionView.addSubview(vkButton)
        backgroundConnectionView.addSubview(telegaButton)
        backgroundConnectionView.addSubview(questionsButton)
        ordersTableView.register(OrdersTableViewCell.self, forCellReuseIdentifier: idOrdersTableViewCell) //зарегистрировали ячейку
        
    }
    //MARK: - setDelegates()
    private func setDelegates() {
        ordersTableView.delegate = self
        ordersTableView.dataSource = self
        
    }
    
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setDelegates()
        setConstrains()
        
    }
    
    
    
} //закрывает класс


//MARK: - Extension - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}
//MARK: - Extension - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
        //        isFiltred ? filtredArray.count: differenceArray.count //если isFiltred тру тогда возвращаем filtredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOrdersTableViewCell, for: indexPath) as! OrdersTableViewCell
        
        //        let differenceModel = (isFiltred ? filtredArray[indexPath.row] : differenceArray[indexPath.row]) //для конфигурирования ячейки
        //        cell.cellConfigure(differenceWorkout: differenceModel)
        return cell
    }
}






//MARK: - extension
extension ProfileViewController {
    private func setConstrains() { //метод для констреинтов
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            userNameLabel.trailingAnchor.constraint(equalTo: settingsProfileButton.leadingAnchor, constant: -5)
            
        ])
        NSLayoutConstraint.activate([
            settingsProfileButton.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 10),
            settingsProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            
        ])
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardView.heightAnchor.constraint(equalToConstant: 100)
            
        ])
        NSLayoutConstraint.activate([
            backgroundTableView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 30),
            backgroundTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backgroundTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backgroundTableView.heightAnchor.constraint(equalToConstant: 300)
            
        ])
        NSLayoutConstraint.activate([
            ordersLabel.topAnchor.constraint(equalTo: backgroundTableView.topAnchor, constant: 5),
            ordersLabel.leadingAnchor.constraint(equalTo: backgroundTableView.leadingAnchor, constant: 10),
            ordersLabel.trailingAnchor.constraint(equalTo: showAllButton.leadingAnchor, constant: -50)
            
            
        ])
        NSLayoutConstraint.activate([
            showAllButton.topAnchor.constraint(equalTo: backgroundTableView.topAnchor, constant: 5),
            showAllButton.trailingAnchor.constraint(equalTo: backgroundTableView.trailingAnchor, constant: -10),
            showAllButton.widthAnchor.constraint(equalToConstant: 30)
            
            
        ])
        NSLayoutConstraint.activate([
            backgroundConnectionView.topAnchor.constraint(equalTo: backgroundTableView.bottomAnchor, constant: 30),
            backgroundConnectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backgroundConnectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backgroundConnectionView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
        NSLayoutConstraint.activate([
            connectImageView.topAnchor.constraint(equalTo: backgroundConnectionView.topAnchor, constant: 7),
            connectImageView.leadingAnchor.constraint(equalTo: connectionLabel.trailingAnchor, constant: 10)
            
            
        ])
        NSLayoutConstraint.activate([
            connectionLabel.topAnchor.constraint(equalTo: backgroundConnectionView.topAnchor, constant: 5),
            connectionLabel.leadingAnchor.constraint(equalTo: backgroundConnectionView.leadingAnchor, constant: 10)
            
            
        ])
        NSLayoutConstraint.activate([
            ordersTableView.topAnchor.constraint(equalTo: ordersLabel.bottomAnchor, constant: 5),
            ordersTableView.leadingAnchor.constraint(equalTo: backgroundTableView.leadingAnchor, constant: 5),
            ordersTableView.trailingAnchor.constraint(equalTo: backgroundTableView.trailingAnchor, constant: -5),
            ordersTableView.bottomAnchor.constraint(equalTo: backgroundTableView.bottomAnchor, constant: -5),
            
        ])
        NSLayoutConstraint.activate([
            instaButton.topAnchor.constraint(equalTo: connectionLabel.bottomAnchor, constant: 20),
            instaButton.leadingAnchor.constraint(equalTo: backgroundConnectionView.leadingAnchor, constant: 40),
            instaButton.heightAnchor.constraint(equalToConstant: 60),
            instaButton.widthAnchor.constraint(equalToConstant: 60)
            
        ])
        NSLayoutConstraint.activate([
            vkButton.topAnchor.constraint(equalTo: connectionLabel.bottomAnchor, constant: 20),
            vkButton.leadingAnchor.constraint(equalTo: instaButton.trailingAnchor, constant: 50),
            vkButton.heightAnchor.constraint(equalToConstant: 60),
            vkButton.widthAnchor.constraint(equalToConstant: 60)
            
        ])
        NSLayoutConstraint.activate([
            telegaButton.topAnchor.constraint(equalTo: connectionLabel.bottomAnchor, constant: 20),
            telegaButton.leadingAnchor.constraint(equalTo: vkButton.trailingAnchor, constant: 50),
            telegaButton.heightAnchor.constraint(equalToConstant: 60),
            telegaButton.widthAnchor.constraint(equalToConstant: 60)
            
        ])
        NSLayoutConstraint.activate([
            questionsButton.topAnchor.constraint(equalTo: instaButton.bottomAnchor, constant: 10),
            questionsButton.leadingAnchor.constraint(equalTo: backgroundConnectionView.leadingAnchor, constant: 20),
            questionsButton.heightAnchor.constraint(equalToConstant: 60)
           // questionsButton.trailingAnchor.constraint(equalTo: backgroundConnectionView.trailingAnchor, constant: -20)
            
        ])
    }
}
