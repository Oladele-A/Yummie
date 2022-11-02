//
//  SectionHeaderLabel.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 10/19/22.
//

import UIKit

class SectionHeaderLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        textColor = .darkGray
        font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        lineBreakMode = .byTruncatingTail
        baselineAdjustment = .alignBaselines
        textAlignment = .natural
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
}
