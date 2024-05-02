//
//  FavoriteListVC.swift
//  GHFollowers
//
//  Created by Linval Muchapirei on 16/1/2024.
//

import UIKit

class FavoriteListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        PersistanceManager.retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                break
            }
        }
    }
}
