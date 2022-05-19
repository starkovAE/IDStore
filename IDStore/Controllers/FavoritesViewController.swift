//
//  FavoritesViewController.swift
//  IDStore
//
//  Created by Александр Старков on 13.05.2022.
//

import UIKit

class FavoritesViewController: UIViewController {

    //MARK: - catalogLabel
    private let favoritesLabel: UILabel = {
        let label = UILabel()
        label.text = "Избранное"
        label.font = .avenirNextDemiBold24()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    //MARK: - catalogLabel
    private let notFavoritesLabel: UILabel = {
        let label = UILabel()
        label.text = "В избранном пока ничего нет"
        label.font = .avenirNextDemiBold24()
        
        label.textColor = .black
        label.textAlignment = .center
        label.isHidden = true
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    //MARK: - catalogLabel
    private let notFavDesriprtionLabel: UILabel = {
        let label = UILabel()
        label.text = "Здесь будут храниться товары, которые вас заинтересовали"
        label.font = .avenirNextDemiBold20()
        label.textColor = .specialDarkGrey
        label.textAlignment = .center
        label.isHidden = true
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    //MARK: - catalogLabel
    private let noFavoriteImageView: UIImageView = {
      let imageView = UIImageView()
        imageView.image = UIImage(named: "heart") //добавил картинку no traning
        imageView.contentMode = .scaleAspectFit //Возможность масштабировать содержимое в соответствии с размером представления, сохраняя соотношение сторон.
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true // свойство, которое позволяет скрывать view. Эта вью сейчас скрыта
      return imageView
    } ()
    
    //MARK: - searchFavoritesTextField
    private let searchFavoritesTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .specialBackground
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.placeholder = "Поиск избранным товарам"
        textField.textColor = .specialBlack
        textField.font = .sanFrancissco16()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.addShadowOnView(setColor: .black, setOpacity: 0.7, setRadius: 1.0)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.isHidden = false
        
        return textField
    }()
    private let backgroundTableView = UIView(setColor: .white, setRadius: 20, setAlpha: 1.0)
    
    
    //MARK: - Создание tableView
    private let favoritesTableView: UITableView = {
      let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none //разделяющие линии убрали
        tableView.bounces = false //чтобы не оттягивалось
        tableView.showsVerticalScrollIndicator = true //не показывает скролл индикатор
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.isHidden = false
        
        return tableView
    } ()
    private let idFavoritesTableViewCell = "idFavoritesTableViewCell"
    
    
    
    //MARK: - viewWillAppear - запускается перед тем как VC будет отображен на экране. Для обновления табицы
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        favoritesTableView.reloadData()
    }
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
       setConstrains()
        setDelegates()
        
    }
    
    //MARK: - setupViews()
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(favoritesLabel)
        view.addSubview(searchFavoritesTextField)
       // view.addSubview(favoritesTableView)
        favoritesTableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: idFavoritesTableViewCell) //зарегистрировали ячейку
        
        view.addSubview(notFavoritesLabel)
        view.addSubview(notFavDesriprtionLabel)
        view.addSubview(noFavoriteImageView)
        view.addSubview(backgroundTableView)
        backgroundTableView.addSubview(favoritesTableView)
    }
    
    //MARK: - setDelegates()
    private func setDelegates() {
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        // searchFavoritesTextField.delegate = self
    }
    
    
    
} //закрывает класс
//MARK: - Extensions 
extension FavoritesViewController {
    private func setConstrains() { //метод для констреинтов
        NSLayoutConstraint.activate([
            favoritesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            favoritesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            searchFavoritesTextField.topAnchor.constraint(equalTo: favoritesLabel.bottomAnchor, constant: 20),
            searchFavoritesTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchFavoritesTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchFavoritesTextField.heightAnchor.constraint(equalToConstant: 38)
         
        ])
        
        NSLayoutConstraint.activate([
            favoritesTableView.topAnchor.constraint(equalTo: backgroundTableView.topAnchor, constant: 5),
            favoritesTableView.leadingAnchor.constraint(equalTo: backgroundTableView.leadingAnchor, constant: 5),
            favoritesTableView.trailingAnchor.constraint(equalTo: backgroundTableView.trailingAnchor, constant: -5),
            favoritesTableView.bottomAnchor.constraint(equalTo: backgroundTableView.bottomAnchor, constant: -10)

        ])
        NSLayoutConstraint.activate([
            noFavoriteImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            noFavoriteImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            noFavoriteImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            noFavoriteImageView.topAnchor.constraint(equalTo: favoritesLabel.bottomAnchor, constant: 240)
        ])
        NSLayoutConstraint.activate([
            notFavoritesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            notFavoritesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            notFavoritesLabel.topAnchor.constraint(equalTo: noFavoriteImageView.bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            notFavDesriprtionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            notFavDesriprtionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            notFavDesriprtionLabel.topAnchor.constraint(equalTo: notFavoritesLabel.bottomAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            backgroundTableView.topAnchor.constraint(equalTo: searchFavoritesTextField.bottomAnchor, constant: 10),
            backgroundTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backgroundTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            backgroundTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }  
}
//MARK: - Extension - UITableViewDelegate
extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
    
}
//MARK: - Extension - UITableViewDataSource
extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
//        isFiltred ? filtredArray.count: differenceArray.count //если isFiltred тру тогда возвращаем filtredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idFavoritesTableViewCell, for: indexPath) as! FavoritesTableViewCell
        
//        let differenceModel = (isFiltred ? filtredArray[indexPath.row] : differenceArray[indexPath.row]) //для конфигурирования ячейки
//        cell.cellConfigure(differenceWorkout: differenceModel)
        return cell
    }
}
