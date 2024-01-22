//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Linval Muchapirei on 18/1/2024.
//

import UIKit


extension UIViewController {
    
    func presentGFAlertOnMainThread(title:String,message:String,buttonTitle:String){
        /// We need to run this on the main thread
        DispatchQueue.main.async {
            let alertVC = GFAlertViewController(alertTile: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC,animated: true)
            
        }
    }
    
}
