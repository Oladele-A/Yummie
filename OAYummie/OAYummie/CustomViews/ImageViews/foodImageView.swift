//
//  foodImageView.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 10/13/22.
//

import UIKit

class foodImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        layer.cornerRadius = 10
        clipsToBounds = true
        contentMode = .scaleAspectFill
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadFoodImage(fromURL url: String){
        NetworkManager.shared.downloadImage(from: url) { [weak self] image in
            guard let self = self else { return }
            self.image = image
        }
    }
}
