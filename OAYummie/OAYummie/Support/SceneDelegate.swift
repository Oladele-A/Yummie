//
//  SceneDelegate.swift
//  OAYummie
//
//  Created by Oladele Abimbola on 9/12/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        var controller: UIViewController!
        
        if UserDefaults.standard.bool(forKey: "hasOnboarded"){
            let destVC = UINavigationController(rootViewController: HomeVC()) as UIViewController
            controller = destVC
        }else{
            controller = OnboardingVC()
        }
        
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}

