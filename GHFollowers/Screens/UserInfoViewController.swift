//
//  UserInfoViewController.swift
//  GHFollowers
//
//  Created by Linval Muchapirei on 29/1/2024.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    let headerView = UIView()
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        let doneButton  = UIBarButtonItem(barButtonSystemItem: .done, target:self, action:#selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        print(username!)
        
        NetworkManager.shared.getUserInformation(for: username) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
                break
            }
        }
        layoutUI()
    }
    
    func layoutUI(){
        view.addSubview(headerView)
        
        headerView.backgroundColor = .systemRed
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            headerView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }
}
