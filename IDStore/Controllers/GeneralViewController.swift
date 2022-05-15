//
//  GeneralViewController.swift
//  IDStore
//
//  Created by Александр Старков on 13.05.2022.
//

import UIKit

class GeneralViewController: UIViewController {
    
    
    //MARK: - imageStoreView
    private let imageStoreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.7607843137, green: 0.7607843137, blue: 0.7607843137, alpha: 1) //цвет заднего фона
        imageView.layer.borderWidth = 7 // ширина обводки
        imageView.layer.borderColor = UIColor.white.cgColor //назначаем цвет обводки (тип cgColor)
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    //MARK: - searchInIdStore
     private let searchGeneralView = SearchView()
    
    //MARK: - userNameLabel()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Привет, Сабина!"
        label.textColor = .specialBlack
        label.font = .avenirMedium18()
        label.adjustsFontSizeToFitWidth = true // свойство - которое, уменьшает шрифт в зависимости от ширины label
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 2 //свойство - которое уменьшает шрифт (шрифт на 30 % , на 50%)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    //MARK: - nameTextField()
    private let searchTextField: UITextField = {
      let textFild = UITextField()
        textFild.backgroundColor = .specialLine
        textFild.borderStyle = .none // свойство - стиль границы
        textFild.layer.cornerRadius = 10
        textFild.placeholder = "Поиск В ID Store"
        textFild.textColor = .specialBlack
        textFild.font = .avenirNextDemiBold20()
        textFild.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textFild.frame.height)) //  - добавляется маленькая (шириной 15 поинтов) прозрачная вью для того чтобы текст вводился не по самой левой границе
        textFild.leftViewMode = .always // это свойство leftViewMode устновленное в always - говорит нам о том что мы это вьюху показываем всегда (always - всегда)
        textFild.clearButtonMode = .always // это свойство clearButtonMode установленное в always - это свойство  при вводе текста появляется кнопочка, при помощи которой можно очистить textFild
        textFild.returnKeyType = .done //это свойство  returnKeyTypе (для клавиатуры) - установили ее в done - сдесь можно делать доп настройки у клавиатуры
        textFild.translatesAutoresizingMaskIntoConstraints = false
    return textFild
    } ()
    
    //MARK: novinkiLabel
    private let novinkiLabel: UILabel = {
        let label = UILabel()
        label.text = "Новинки:"
        label.textColor = .specialBlack
        label.font = .avenirMedium22()
        label.adjustsFontSizeToFitWidth = true // свойство - которое, уменьшает шрифт в зависимости от ширины label
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 2 //свойство - которое уменьшает шрифт (шрифт на 30 % , на 50%)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    //MARK: - collectionView
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionVIew = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionVIew.translatesAutoresizingMaskIntoConstraints = false
        collectionVIew.bounces = false
        collectionVIew.showsHorizontalScrollIndicator = false
        collectionVIew.backgroundColor = .none
        return collectionVIew
    }()
    private let idProfileCollectionViewCell = "idProfileCollectionViewCell"
    
    //MARK: - ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews() //вызываем метод настройки View
        setConstrains() //вызываем метод с констреинтами
        setDelegates()
    }
    //MARK: - viewDidLayoutSubviews - перерисовка subView (ЖЦ)
    override func viewDidLayoutSubviews() { //перерисовывает
        imageStoreImageView.layer.cornerRadius = imageStoreImageView.frame.width / 2 // делаем круг и перерисовываем его
        
    }
    
    private func setupViews() { // в этом методе мы будем делать настройки для наших View
        view.backgroundColor = .specialBackground
        view.addSubview(searchGeneralView)
        view.addSubview(imageStoreImageView) //добавили фотку на основную view
        view.addSubview(userNameLabel) //добавили label с именем пользователя на view
        view.addSubview(searchTextField)
        view.addSubview(novinkiLabel)
        view.addSubview(collectionView)
        
        collectionView.register(NoveltiesCollectionViewCell.self, forCellWithReuseIdentifier: idProfileCollectionViewCell)

        
        
    }
    //MARK: - setDelegates() CollectionView
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
} //закрывает класс
extension GeneralViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idProfileCollectionViewCell, for: indexPath) as! NoveltiesCollectionViewCell
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension GeneralViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2.07,
               height: 120)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    
}





extension GeneralViewController {
    private func setConstrains() { //метод для констреинтов
        NSLayoutConstraint.activate([
      
            imageStoreImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            imageStoreImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            imageStoreImageView.heightAnchor.constraint(equalToConstant: 100),
            imageStoreImageView.widthAnchor.constraint(equalToConstant: 100)
            
            
        ])
        NSLayoutConstraint.activate([
           
            userNameLabel.leadingAnchor.constraint(equalTo: imageStoreImageView.trailingAnchor, constant: 5),
            userNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
            
        ])
        NSLayoutConstraint.activate([

            searchGeneralView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            searchGeneralView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchGeneralView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchGeneralView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
        NSLayoutConstraint.activate([
            
            searchTextField.topAnchor.constraint(equalTo: searchGeneralView.bottomAnchor, constant: 20),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchTextField.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        NSLayoutConstraint.activate([

            novinkiLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            novinkiLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            novinkiLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)

        ])
        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(equalTo: novinkiLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalToConstant: 250)

        ])
    }
    
    
    
}

