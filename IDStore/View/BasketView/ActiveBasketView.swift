//
//  ActiveBasketView.swift
//  IDStore
//
//  Created by Александр Старков on 26.05.2022.
//

import UIKit

class ActiveBasketView: UIView {
    private let poubelleVideButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "bag.fill.badge.minus")?.withRenderingMode(.alwaysOriginal), for: .normal) //добавляем Image из Assets
        button.backgroundColor = .specialBackground
        button.layer.cornerRadius = 10
        button.titleLabel?.textAlignment = .left
        button.setTitle(" Очистить корзину", for: .normal) //добавляем заголовок, стиль нормал
        button.titleLabel?.font = .avenirMedium16() //добавляем шрифт к нашему заголовку
        button.tintColor = .black // подцвечивать цветом наш текст и Image
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(poubelleVideButtonTapped), for: .touchUpInside)
        button.addShadowOnView(setColor: .darkGray, setOpacity: 0.4, setRadius: 1.0)
      return  button
    } ()
    
    @objc private func poubelleVideButtonTapped() {
        
    }
    //MARK: - backgroundBasketTableView
    private let backgroundBasketTableView = UIView(setColor: .white, setRadius: 20, setAlpha: 1.0)
    
    //MARK: - ordersBasketTableView
    private let ordersBasketTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none //разделяющие линии убрали
        tableView.bounces = false //чтобы не оттягивалось
        tableView.showsVerticalScrollIndicator = true //не показывает скролл индикатор
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return  tableView
    } ()
    private let idBasketTableViewCell = "idBasketTableViewCell"
    
    //MARK: -  basketLabel
    private let basketLabel = UILabel(text: "Товары в корзине")
    //MARK: - goButton
    private let goButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "bag.fill.badge.minus")?.withRenderingMode(.alwaysOriginal), for: .normal) //добавляем Image из Assets
        button.backgroundColor = .specialBackground
        button.layer.cornerRadius = 10
        button.titleLabel?.textAlignment = .left
        button.setTitle("Перейти к оформлению", for: .normal) //добавляем заголовок, стиль нормал
        button.titleLabel?.font = .avenirMedium16() //добавляем шрифт к нашему заголовку
        button.tintColor = .black // подцвечивать цветом наш текст и Image
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goButtonTapped), for: .touchUpInside)
       
      return button
    } ()
    
    @objc private func goButtonTapped() {
        
    }
    
  
 //MARK: - setupViews()
    private func setupViews() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        addShadowOnView(setColor: .black, setOpacity: 0.2, setRadius: 0.3)
        addSubview(poubelleVideButton)
        addSubview(basketLabel)
        addSubview(backgroundBasketTableView)
        backgroundBasketTableView.addSubview(ordersBasketTableView)
        addSubview(goButton)
        
    }
    //MARK: - setDelegates()
    private func setDelegates() {
        ordersBasketTableView.delegate = self
        ordersBasketTableView.dataSource = self
    }
    //MARK: - Инициализаторы
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstrains()
        setDelegates()
        ordersBasketTableView.register(PurchaseTableViewCell.self, forCellReuseIdentifier: idBasketTableViewCell) //зарегистрировали ячейку
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
} //закрывает класс

//MARK: - Extension - UITableViewDelegate
extension ActiveBasketView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}
//MARK: - Extension - UITableViewDataSource
extension ActiveBasketView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
        //        isFiltred ? filtredArray.count: differenceArray.count //если isFiltred тру тогда возвращаем filtredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idBasketTableViewCell, for: indexPath) as! PurchaseTableViewCell
        
        //        let differenceModel = (isFiltred ? filtredArray[indexPath.row] : differenceArray[indexPath.row]) //для конфигурирования ячейки
        //        cell.cellConfigure(differenceWorkout: differenceModel)
        return cell
    }
}

//MARK: - Расширение
extension ActiveBasketView {
    private func setConstrains() { //метод для констреинтов
        
        NSLayoutConstraint.activate([
            poubelleVideButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            poubelleVideButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            poubelleVideButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            poubelleVideButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            basketLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            basketLabel.topAnchor.constraint(equalTo: poubelleVideButton.bottomAnchor, constant: 20),
            basketLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100)
        ])
        NSLayoutConstraint.activate([
            backgroundBasketTableView.topAnchor.constraint(equalTo: basketLabel.bottomAnchor, constant: 5),
            backgroundBasketTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            backgroundBasketTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            backgroundBasketTableView.bottomAnchor.constraint(equalTo: goButton.topAnchor, constant: -30)
        ])
        NSLayoutConstraint.activate([
            ordersBasketTableView.topAnchor.constraint(equalTo: backgroundBasketTableView.topAnchor, constant: 3),
            ordersBasketTableView.leadingAnchor.constraint(equalTo: backgroundBasketTableView.leadingAnchor, constant: 0),
            ordersBasketTableView.trailingAnchor.constraint(equalTo: backgroundBasketTableView.trailingAnchor, constant: 0),
            ordersBasketTableView.bottomAnchor.constraint(equalTo: backgroundBasketTableView.bottomAnchor, constant: -3)
        ])
        NSLayoutConstraint.activate([
            goButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            goButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            goButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            goButton.heightAnchor.constraint(equalToConstant: 40)

        ])
    }
}
