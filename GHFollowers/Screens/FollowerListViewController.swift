//
//  FollowerListViewController.swift
//  GHFollowers
//
//  Created by Linval Muchapirei on 17/1/2024.
//

import UIKit

class FollowerListViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    var username: String!
    var followers: [Follower] = []
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section,Follower>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers()
        configureDataSource()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in:view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseId)
    }
    

    func getFollowers(){
        NetworkManager.shared.getFollowers(for: username, page: 1) {[weak self] result in
            guard let self = self else { return } /// Force unwrap the optional
            switch result {
            case .success(let followers):
                print("Followers.count = \(followers.count)")
                self.followers = followers
                self.updateData()
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    func configureDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Section,Follower>(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, follower in
                // create cell as a follower cell
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseId, for: indexPath) as! FollowerCell
                // configure the cell
                cell.set(follower: follower)
                return cell
            })
    }
    
    func updateData(){
        var snapshot = NSDiffableDataSourceSnapshot<Section,Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot,animatingDifferences: true)
        }
    }
}
