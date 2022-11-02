//
//  CellShadowView.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 9/26/22.
//

import UIKit

class CellShadowView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}
