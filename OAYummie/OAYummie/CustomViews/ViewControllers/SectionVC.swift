//
//  SectionVC.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 10/19/22.
//

import UIKit

class SectionVC: UIViewController {
    
    let sectionLabel = SectionHeaderLabel()

    var collectionView: UICollectionView!
    
    var frame: CGRect!
    
    init(frame:CGRect){
        super.init(nibName: nil, bundle: nil)
        self.frame = frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
        
    func configureCollectionView(with frame: CGRect){
        
    }
    
    private func layoutUI(){
        view.addSubview(sectionLabel)
        
        NSLayoutConstraint.activate([
            sectionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            sectionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sectionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            sectionLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}
