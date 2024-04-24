//
//  HomeViewController.swift
//  assignmentYoutube
//
//  Created by Roh on 3/19/24.
//

import UIKit

final class HomeViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        print("HomeViewController-------1")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeViewControllerz`------2")
    }
}
