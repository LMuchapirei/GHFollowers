//
//  UserInfoViewController.swift
//  GHFollowers
//
//  Created by Linval Muchapirei on 29/1/2024.
//

import UIKit

protocol UserInfoViewControllerDelegate: AnyObject {
    func didTapGitHubProfile()
    func didTapGetFollowers()
    
}

class UserInfoViewController: UIViewController {
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel = GFBodyLabel(textAlignment: .center)
    var itemViews: [UIView] = []
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        layoutUI()
        getUserInfo()

    }
    
    func getUserInfo(){
        NetworkManager.shared.getUserInformation(for: username) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.configureUIElements(with: user)
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
                break
            }
        }
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        let doneButton  = UIBarButtonItem(barButtonSystemItem: .done, target:self, action:#selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func configureUIElements(with user: User){
        let repoItemVC = GFRepoItemViewController(user: user)
        repoItemVC.delegate = self
        
        let followerItemVC = GFFollowerItemViewController(user: user)
        followerItemVC.delegate = self
        self.add(childVC: GFUserInfoHeaderViewController(user: user), to: self.headerView)
        self.add(childVC: repoItemVC, to: self.itemViewOne)
        self.add(childVC: followerItemVC, to: self.itemViewTwo)
        self.dateLabel.text =  "Github since \(user.createdAt.convertToDisplayFormat())"
    }
    
    func layoutUI(){
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        itemViews=[headerView,itemViewOne,itemViewTwo,dateLabel]
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding),
            ])
        }
//        itemViewOne.backgroundColor = .systemRed  /// Highlighting for debugging purposes
//        itemViewTwo.backgroundColor = .systemCyan  /// Highlighting for debugging purposes
         
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor,constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor,constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func add(childVC: UIViewController, to containerView: UIView){
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }
}


extension UserInfoViewController: UserInfoViewControllerDelegate {
    func didTapGitHubProfile() {
        ////  Show safari view controller
        print("My button was tapped !!!")
    }
    
    func didTapGetFollowers() {
        /// dismiss vs
        /// tell follower list screen the new user
        print("My button was tapped !!! Getting followers")
    }
    
    
}
