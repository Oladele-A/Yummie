//
//  DishDetailVC.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 11/11/22.
//

import UIKit

class DishDetailVC: UIViewController {

    let dishImageView = foodImageView(frame: .zero)
    let detailsStackView = UIStackView()
    
    let titleStackView = UIStackView()
    let dishTitleLabel = SectionHeaderLabel(labelColor: .label)
    let caloriesLabel = OADescriptionLabel(textAlignment: .left, textColor: UIColor(red: 0.88, green: 0.23, blue: 0, alpha: 1), fontSize: 17)
    let dishDescriptionLabel = UILabel()
    let nameTextField = OATextField()
    let orderButton = OAButton(backgroundColor: .black.withAlphaComponent(0.75), title: "Place Order")
    
    let appTextProperty : [NSAttributedString.Key:Any] = [
        NSAttributedString.Key.font : UIFont(name: "Helvetica Neue", size: 17)!,
    ]
    
    var dish: Dish!
    
    var isNameEntered: Bool{
        return !nameTextField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
        updateUI()
        createDismissKeyboardGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }

    func createDismissKeyboardGesture(){
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func placeOrder(){
        guard isNameEntered else {
            showAlert(title: "Oops, No name!", message: "Please Enter your name", buttonTitle: "OK")
            return
        }
        guard let name = nameTextField.text?.trimmingCharacters(in: .whitespaces) else{ return }
        nameTextField.resignFirstResponder()
        showLoadingView(withLabel: "Placing Order")
        NetworkManager.shared.placeOrder(name: name, dishId: dish.id) { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result{
                
            case .success(_):
                print("Hello \(name)")
                self.showAlert(title: "Success", message: "Your order has been received 😋😋😋", buttonTitle: "OK")
            case .failure(let error):
                self.showAlert(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            }
        }
        
    }
    
    private func updateUI(){
        dishImageView.downloadFoodImage(fromURL: dish.image)
        dishTitleLabel.text = dish.name
        let attributedText = NSAttributedString(string: dish.description, attributes: appTextProperty)
        dishDescriptionLabel.attributedText = attributedText
        caloriesLabel.text = dish.formattedCalories
    }
    
    
    func configure() {
        view.addSubview(dishImageView)
        view.addSubview(detailsStackView)
        
        configureDishImageView()
        configureDetailsStackView()
        
        NSLayoutConstraint.activate([
            dishImageView.topAnchor.constraint(equalTo: view.topAnchor),
            dishImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dishImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            detailsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            detailsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            detailsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            dishImageView.bottomAnchor.constraint(equalTo: detailsStackView.topAnchor),
            
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            orderButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureDishImageView(){
        dishImageView.layer.cornerRadius = 0
        dishImageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        dishImageView.setContentHuggingPriority(.init(rawValue: 251), for: .vertical)
        dishImageView.setContentHuggingPriority(.init(rawValue: 251), for: .horizontal)
    }
    
    func configureDetailsStackView(){
        detailsStackView.alignment = .fill
        detailsStackView.distribution = .fill
        detailsStackView.axis = .vertical
        detailsStackView.spacing = 10
        detailsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        configureTitleStackView()
        configureDishDecriptionLabel()
        
        detailsStackView.addArrangedSubview(titleStackView)
        detailsStackView.addArrangedSubview(dishDescriptionLabel)
        detailsStackView.addArrangedSubview(nameTextField)
        detailsStackView.addArrangedSubview(orderButton)
        
        orderButton.addTarget(self, action: #selector(placeOrder), for: .touchUpInside)
    }

    
    func configureTitleStackView(){
        titleStackView.axis = .horizontal
        titleStackView.alignment = .fill
        titleStackView.distribution = .fill
        titleStackView.spacing = 0
        
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
  
        NSLayoutConstraint.activate([
            caloriesLabel.widthAnchor.constraint(equalToConstant: 105),
        ])
        
        titleStackView.addArrangedSubview(dishTitleLabel)
        titleStackView.addArrangedSubview(caloriesLabel)
    }
    
    
    func configureDishDecriptionLabel(){
        dishDescriptionLabel.baselineAdjustment = .alignBaselines
        dishDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        dishDescriptionLabel.lineBreakMode = .byTruncatingTail
        dishDescriptionLabel.adjustsFontSizeToFitWidth = true
        dishDescriptionLabel.numberOfLines = 0
    }
    
    
    //MARK: Slide view Up when textField is editing
    
    func getKeyboardHeight(_ notification : Notification) -> CGFloat{
        let userInfo = notification.userInfo
        let keyboardHeight = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        return keyboardHeight.cgRectValue.height
    }

    @objc func keyboardWillShow(_ notification:Notification){
        if nameTextField.isFirstResponder && view.frame.origin.y == 0{
            view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    
    func subscribeToKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillHide(_ notification:Notification){
        if view.frame.origin.y != 0{
            view.frame.origin.y = 0
        }
    }
}
