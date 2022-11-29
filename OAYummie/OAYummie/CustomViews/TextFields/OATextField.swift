//
//  OATextField.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 11/17/22.
//

import UIKit

class OATextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 14, weight: .regular)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 17
        
        autocorrectionType = .no
        clearButtonMode = .whileEditing
        
        placeholder = "Enter your name"
    }
}
