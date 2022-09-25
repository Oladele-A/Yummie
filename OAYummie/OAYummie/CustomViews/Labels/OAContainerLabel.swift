//
//  OAContainerLabel.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 9/25/22.
//

import UIKit

class OAContainerLabel: UILabel {

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
        textAlignment = .natural
        baselineAdjustment = .alignBaselines
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
