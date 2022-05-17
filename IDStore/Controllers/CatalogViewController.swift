//
//  CatalogTableViewController.swift
//  IDStore
//
//  Created by Александр Старков on 13.05.2022.
//class CatalogTableViewController

import UIKit

class CatalogViewController: UIViewController {
    //MARK: - catalogLabel
    private let catalogLabel: UILabel = {
        let label = UILabel()
        label.text = "Каталог"
        label.font = .avenirNextDemiBold24()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    //MARK: - segmentedControl
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Аксессуары", "Гаджеты"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .specialBlackColor
        segmentedControl.selectedSegmentTintColor = .specialRed
        let font = UIFont(name: "Avenir-Medium", size: 14)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: font as Any,
                                                 NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: font as Any,
                                                 NSAttributedString.Key.foregroundColor: UIColor.black],
                                                for: .selected)
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        //segmentedControl.addShadowOnView(setColor: .black)
        return segmentedControl
    } ()
    
    @objc private func segmentChanged() {
        //        if segmentedControl.selectedSegmentIndex == 0 {
        //          differenceArray = [DifferenceWorkout]()
        //            let dateStart = dateToday.offsetDays(days: 7)
        //            getDifferenceModel(dateStart: dateStart)
        //            statisticTableView.reloadData()
        //        } else {
        //            differenceArray = [DifferenceWorkout]()
        //            let dateStart = dateToday.offsetMonth(month: 1)
        //            getDifferenceModel(dateStart: dateStart)
        //            statisticTableView.reloadData()
        //        }
    }
    //MARK: - Создание textField
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .specialBackground
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.placeholder = "Поиск по названию или категории"
        textField.textColor = .specialBlack
        textField.font = .sanFrancissco16()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.addShadowOnView(setColor: .black, setOpacity: 0.7, setRadius: 2.0)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    //MARK: - Создание tableView
    private let catalogTableView: UITableView = {
      let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none //разделяющие линии убрали
        tableView.bounces = false //чтобы не оттягивалось
        tableView.showsVerticalScrollIndicator = false //не показывает скролл индикатор
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    } ()
    private let idCatalogTableViewCell = "idCatalogTableViewCell"
    
    
    
    
    
    //MARK: - setupViews()
    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(catalogLabel)
        view.addSubview(segmentedControl)
        view.addSubview(searchTextField)
        view.addSubview(catalogTableView)
        catalogTableView.register(CatalogTableViewCell.self, forCellReuseIdentifier: idCatalogTableViewCell) //зарегистрировали ячейку

    }
    //MARK: - setDelegates()
    private func setDelegates() {
        catalogTableView.delegate = self
        catalogTableView.dataSource = self
       // searchTextField.delegate = self
    }
    //MARK: - viewWillAppear - запускается перед тем как VC будет отображен на экране. Для обновления табицы
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        catalogTableView.reloadData()
    }
    //MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstrains()
        setDelegates()
        
        
    }
    
    
    
    
    
} //закрывает класс

//MARK: - Extension - setConstrains()
extension CatalogViewController {
    private func setConstrains() { //метод для констреинтов
        NSLayoutConstraint.activate([
            catalogLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            catalogLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: catalogLabel.bottomAnchor, constant: 10),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: 38)
         
        ])
        NSLayoutConstraint.activate([
            catalogTableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
            catalogTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            catalogTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            catalogTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)

        ])
    }
}
//MARK: - Extension - UITableViewDelegate
extension CatalogViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
    
}
//MARK: - Extension - UITableViewDataSource
extension CatalogViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
//        isFiltred ? filtredArray.count: differenceArray.count //если isFiltred тру тогда возвращаем filtredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCatalogTableViewCell, for: indexPath) as! CatalogTableViewCell
        
//        let differenceModel = (isFiltred ? filtredArray[indexPath.row] : differenceArray[indexPath.row]) //для конфигурирования ячейки
//        cell.cellConfigure(differenceWorkout: differenceModel)
        return cell
    }
}
