//
//  GFTabBarController.swift
//  GHFollowers
//
//  Created by Linval Muchapirei on 6/5/2024.
//

import UIKit

class GFTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        let searchNaviagtionController = createSearchNavigationController()
        let favoritesNavigationController = createFavoritesNavigationController()
        viewControllers = [searchNaviagtionController,favoritesNavigationController]
    }
    
    func createSearchNavigationController () -> UINavigationController {
        let searchVC = SearchViewController()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoritesNavigationController () -> UINavigationController {
        let favoriteListVC = FavoriteListViewController()
        favoriteListVC.title = "Favorites"
        favoriteListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favoriteListVC)
    }
    
}
