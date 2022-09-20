//
//  OADescriptionLabel.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 9/12/22.
//

import UIKit

class OADescriptionLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment:NSTextAlignment, textColor: UIColor, fontSize: CGFloat){
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.textColor = textColor
        font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        configure()
    }
    
    private func configure(){
        baselineAdjustment = .alignBaselines
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .left
    }
}
