//
//  BaseViewController.swift
//  assignmentYoutube
//
//  Created by Roh on 3/18/24.
//

import UIKit

class BaseViewController: UIViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        setStyle()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    func setStyle() {}
    
    func setLayout() {}
}

