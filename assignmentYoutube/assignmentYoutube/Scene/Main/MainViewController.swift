//
//  MainViewController.swift
//  assignmentYoutube
//
//  Created by Roh on 3/18/24.
//

import UIKit

final class MainViewController: UITabBarController {
    private let factory = ModuleFactory.resolve()
    private lazy var tabBarVC = [
        "Home" : factory.instantiateHomeVC(),
        "Short" : factory.instantiateShortVC(),
        "Add" : factory.instantiateAddVC(),
        "Subscribe" : factory.instantiateSubscribeVC(),
        "Storage" : factory.instantiateStorageVC()
    ]
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var navigationVCs: [UINavigationController] = []
        
        YoutubeTabBar.allCases.forEach { tabInfo in
            guard let vc = tabBarVC[tabInfo.title] else {
                print("not match tabBar title")
                return
            }
            
            let tabBarItem = UITabBarItem(title: tabInfo.title, image: UIImage(named: tabInfo.icon), tag: 0)
            vc.tabBarItem = tabBarItem
            vc.navigationItem.largeTitleDisplayMode = .always
            
            let navigationVC = UINavigationController(rootViewController: vc)
            navigationVC.navigationBar.prefersLargeTitles = true
            navigationVCs.append(navigationVC)
        }
        
        self.setViewControllers(navigationVCs, animated: true)
    }
}
