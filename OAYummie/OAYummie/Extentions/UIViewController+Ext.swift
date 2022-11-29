//
//  UIViewController+Ext.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 10/29/22.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController{
    
    func showLoadingView(withLabel text: String){
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {containerView.alpha = 0.8}
        let activityIndicator = UIActivityIndicatorView(style: .large)
        let activityLabel = OADescriptionLabel(textAlignment: .center, textColor: .label, fontSize: 17)
        
        containerView.addSubview(activityIndicator)
        containerView.addSubview(activityLabel)
        activityIndicator.translatesAutoresizingMaskIntoConstraints  = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            activityLabel.centerXAnchor.constraint(equalTo: activityIndicator.centerXAnchor),
            activityLabel.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 10)
        ])

        activityLabel.text = text
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView(){
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    func showAlert(title: String, message: String, buttonTitle: String){
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: buttonTitle, style: .default)
        alertVC.addAction(alertAction)
        present(alertVC, animated: true)
    }
}
