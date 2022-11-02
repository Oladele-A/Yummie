//
//  OACellLabel.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 9/26/22.
//

import UIKit

class OACellLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure(){
        textColor = .label
        textAlignment = .natural
        numberOfLines = 1
        contentMode = .left
        baselineAdjustment = .alignBaselines
        lineBreakMode = .byTruncatingTail
        font = UIFont.systemFont(ofSize: 13, weight: .regular)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
