//
//  SceneDelegate.swift
//  assignmentYoutube
//
//  Created by Roh on 3/16/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let authenticationUIView = AuthenticationUIView()
        let viewController = LoginViewController(view: authenticationUIView)
//        let viewController = SigninViewController(view: authenticationUIView)
//        let viewController = DoneAuthenticationViewController(view: authenticationUIView)
        window?.rootViewController = UINavigationController(rootViewController: viewController)
        window?.makeKeyAndVisible()
    }
}

