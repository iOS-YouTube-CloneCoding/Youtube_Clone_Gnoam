//
//  SceneDelegate.swift
//  assignmentYoutube
//
//  Created by Roh on 3/16/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private let factory = ModuleFactory.resolve()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        var viewController: UIViewController
        
        if UserDefaults.isLoggedIn() {
            viewController = factory.instantiateMainVC()
        }
        else {
            viewController = factory.instantiateSigninVC()
        }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: viewController)
        window?.makeKeyAndVisible()
    }
}

