//
//  BaseViewController.swift
//  assignmentYoutube
//
//  Created by Roh on 3/18/24.
//

import UIKit

protocol BaseViewController: UIViewController {
    func setUI()
    func setConfigure()
    func addView()
    func setLayout()
}

extension BaseViewController {
    func setUI() {
        view.backgroundColor = .white
    }
    
    func setConfigure() {
        
    }
}
