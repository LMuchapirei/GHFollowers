//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by Linval Muchapirei on 18/1/2024.
//

import UIKit

class GFBodyLabel: UILabel {
        override init(frame: CGRect){
            super.init(frame: frame)
            configure()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        init(textAlignment:NSTextAlignment){
            super.init(frame: .zero)
            self.textAlignment = textAlignment
//            self.font = UIFont.systemFont(weight: .bold)
            configure()
        }
        
        private func configure(){
            textColor = .secondaryLabel
            adjustsFontSizeToFitWidth = true /// Shrink when text exceeds the available width
            font = UIFont.preferredFont(forTextStyle: .body)
            minimumScaleFactor = 0.75
            lineBreakMode = .byWordWrapping
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
