//
//  GFEmptyStateView.swift
//  GHFollowers
//
//  Created by Linval Muchapirei on 26/1/2024.
//

import UIKit

class GFEmptyStateView: UIView {
    
    let messageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageView  = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(message:String){
        super.init(frame: .zero)
        messageLabel.text = message
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        /// take views you have created and then add them here
        addSubview(messageLabel)
        addSubview(logoImageView)
        
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        logoImageView.image = UIImage(named: "empty-state-logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        /// Apply the layout constraints
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: -150),  /// Take it up 150 points fromt the center
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 40), //// Take it 40 points from the left hand side of the screen
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -40), //// Take it 40 points out of the start of the trailing anchor...not sure on the effect of this one [ looks like it is being taken out of the screen]
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1.3),   /// ie set it up to be 30 percent larger than the width of the screen
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 40)
         ])
    }
    
}
