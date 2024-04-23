//
//  GFSecondaryTitleLabel.swift
//  GHFollowers
//
//  Created by Linval Muchapirei on 23/4/2024.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontSize:CGFloat){
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize,weight: .medium)
        configure()
    }
    
    private func configure(){
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true /// Shrink when text exceeds the available width
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }

}
