//
//  subscribeVIewController.swift
//  assignmentYoutube
//
//  Created by Roh on 3/19/24.
//

import UIKit

final class SubscribeViewController: BaseViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setBackgroundColor() {
        view.backgroundColor = .yellow
    }
}
