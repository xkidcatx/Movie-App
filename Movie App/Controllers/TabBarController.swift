//
//  TabBarController.swift
//  Movie App
//
//  Created by Eugene Kotovich on 02.06.2022.
//

import UIKit
import RAMAnimatedTabBarController

class AnimatedTabBarController: RAMAnimatedTabBarController {
    
    private let searchBar = UISearchController()
    
    let mainVC = MainViewController()
    let userVC = UserViewController()
    let bookVC = BookmarksViewController()
    let settingsVC = SettingsViewController()
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.setupNavigationBar(barColor: .deepBlueColor!, textColor: .mintColor!)
        navigationItem.title = "Кинопоиск"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    
    private func configure() {
        navigationItem.searchController = searchBar
        searchBar.searchBar.placeholder = "Поиск"
        searchBar.searchBar.returnKeyType = .search
        
        mainVC.tabBarItem = RAMAnimatedTabBarItem(title: "Главная", image: UIImage(systemName: "house"), tag: 1)
        (mainVC.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMFlipLeftTransitionItemAnimations()
        
        bookVC.tabBarItem = RAMAnimatedTabBarItem(title: "Закладки", image: UIImage(systemName: "bookmark.fill"), tag: 1)
        (bookVC.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMFlipTopTransitionItemAnimations()
        
        userVC.tabBarItem = RAMAnimatedTabBarItem(title: "Профиль", image: UIImage(systemName: "person.circle"), tag: 1)
        (userVC.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMBounceAnimation()
        
        settingsVC.tabBarItem = RAMAnimatedTabBarItem(title: "Настройки", image: UIImage(systemName: "gear"), tag: 1)
        (settingsVC.tabBarItem as? RAMAnimatedTabBarItem)?.animation = RAMRightRotationAnimation()
        setViewControllers([mainVC, bookVC, userVC, settingsVC], animated: false)
    }
}
