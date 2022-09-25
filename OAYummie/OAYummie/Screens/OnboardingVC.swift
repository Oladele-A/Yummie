//
//  OnboardingVC.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 9/13/22.
//

import UIKit

class OnboardingVC: UIViewController {
    
    let containerView = UIView()
    var collectionView: UICollectionView!
    let pageControl = UIPageControl()
    let doneButton = OAButton(backgroundColor: .black.withAlphaComponent(0.75), title: "Next")
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            
            if currentPage == slides.count - 1 {
                doneButton.setTitle("Get Started", for: .normal)
            }else{
                doneButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        slides = [
            OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different culture around the world.", image:UIImage(named: "slide1")!),
            OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: UIImage(named: "slide2")!),
            OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: UIImage(named: "slide3")!)
        ]
        
        configureDoneButton()
        configurePageControl()
        configureContainerView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let xCordinate = containerView.frame.origin.x
        let yCordinate = containerView.frame.origin.y
        let width = containerView.frame.size.width
        let height = containerView.frame.size.height
        
        let collectionFrame = CGRect(x: xCordinate, y: yCordinate, width: width, height: height)
        
        configureCollectionView(with: collectionFrame)
        
        print(collectionFrame)
        
    }
    
   @objc func doneButtonClicked(){
        if currentPage == slides.count - 1 {
            let destinationVC = HomeVC()
            let navigationController = UINavigationController(rootViewController: destinationVC)
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.modalTransitionStyle = .flipHorizontal
            present(navigationController, animated: true)
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.isPagingEnabled = false
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            collectionView.isPagingEnabled = true
        }
    }
    
    func configureDoneButton(){
        view.addSubview(doneButton)
        doneButton.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            doneButton.widthAnchor.constraint(equalToConstant: 150),
            doneButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configurePageControl(){
        view.addSubview(pageControl)
        
        pageControl.pageIndicatorTintColor = .systemGray5
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.numberOfPages = slides.count
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: doneButton.topAnchor, constant: -16),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.widthAnchor.constraint(equalToConstant: 116),
            pageControl.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configureContainerView(){
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: pageControl.topAnchor)
        ])
    }
    
    func configureCollectionView(with frame: CGRect){

        collectionView = UICollectionView(frame: frame, collectionViewLayout: UICollectionViewFlowLayout.createSingleFlowLayout(in: containerView))

        view.addSubview(collectionView)
        
        collectionView.isPagingEnabled = true
        collectionView.clipsToBounds = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentMode = .scaleToFill
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: OnboardingCell.reuseID)
    }
}

extension OnboardingVC: UICollectionViewDataSource, UICollectionViewDelegate{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.reuseID, for: indexPath) as! OnboardingCell
        cell.set(slide: slides[indexPath.item])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

