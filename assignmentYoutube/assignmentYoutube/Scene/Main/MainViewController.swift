//
//  MainViewController.swift
//  assignmentYoutube
//
//  Created by Roh on 3/18/24.
//

import UIKit

class MainViewController: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let homeViewController = MainViewController()
        let shortViewController = ShortViewController()
        let addViewController = AddViewController()
        let subscribeViewController = SubscribeViewController()
        let storageViewController = StorageViewController()
        
        homeViewController.title = "Home"
        shortViewController.title = "Short"
        addViewController.title = "Add"
        subscribeViewController.title = "Subscribe"
        storageViewController.title = "storage"
        
        homeViewController.tabBarItem.image = UIImage.init(systemName: "homeIcon")
        shortViewController.tabBarItem.image = UIImage.init(systemName: "shortsIcon")
        addViewController.tabBarItem.image = UIImage.init(systemName: "plueCircleIcon")
        subscribeViewController.tabBarItem.image = UIImage.init(systemName: "subscriptionsIcon")
        storageViewController.tabBarItem.image = UIImage.init(systemName: "LibraryIcon")
        
        // 위에 타이틀 text를 항상 크게 보이게 설정
        homeViewController.navigationItem.largeTitleDisplayMode = .always
        shortViewController.navigationItem.largeTitleDisplayMode = .always
        addViewController.navigationItem.largeTitleDisplayMode = .always
        subscribeViewController.navigationItem.largeTitleDisplayMode = .always
        storageViewController.navigationItem.largeTitleDisplayMode = .always
        
        // navigationController의 root view 설정
        let navigationHome = UINavigationController(rootViewController: homeViewController)
        let navigationShort = UINavigationController(rootViewController: shortViewController)
        let navigationAdd = UINavigationController(rootViewController: addViewController)
        let navigationSubscribe = UINavigationController(rootViewController: subscribeViewController)
        let navigationStorage = UINavigationController(rootViewController: storageViewController)
        
        navigationHome.navigationBar.prefersLargeTitles = true
        navigationShort.navigationBar.prefersLargeTitles = true
        navigationAdd.navigationBar.prefersLargeTitles = true
        navigationSubscribe.navigationBar.prefersLargeTitles = true
        navigationStorage.navigationBar.prefersLargeTitles  = true
        
        setViewControllers([navigationHome, navigationShort, navigationAdd, navigationSubscribe, navigationStorage], animated: false)
    }
}
