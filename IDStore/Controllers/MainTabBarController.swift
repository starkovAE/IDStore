//
//  MainTabBarController.swift
//  IDStore
//
//  Created by Александр Старков on 13.05.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupItems()
    }
    //MARK: - Настройка TabBar
    
    private func setupTabBar() {
        tabBar.backgroundColor = .specialBackground
        tabBar.tintColor = .specialRed
        tabBar.unselectedItemTintColor = .specialBlackColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.specialLine.cgColor
        
    }
    //MARK: - Настройка иконок
    private func setupItems() {
        let generalVC = GeneralViewController()
        let catalogVC = CatalogTableViewController()
        let favoriteVC = FavoritesViewController()
        let profileVC = ProfileViewController()
        let basketVC = BasketViewController()
        
        setViewControllers([generalVC, catalogVC, favoriteVC, profileVC, basketVC], animated: true)
        
        guard let items = tabBar.items else { return }
        //Устанавливаем заголовки
        items[0].title = "Главная"
        items[1].title = "Каталог"
        items[2].title = "Избранное"
        items[3].title = "Профиль"
        items[4].title = "Корзина"
        
        //Устанавливаем изображения
        
        items[0].image = UIImage(named: "house.circle.fill")
        items[1].image = UIImage(named: "line.3.horizontal.circle.fill")
        items[2].image = UIImage(named: "heart.text.square.fill") //heart.text.square.fill
        items[3].image = UIImage(named: "person.crop.circle.fill")
        items[4].image = UIImage(named: "cart.circle.fill")
        
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont(name: "AvenirNext-DemiBold", size: 12) as Any], for: .normal)
  
    }
    
}
