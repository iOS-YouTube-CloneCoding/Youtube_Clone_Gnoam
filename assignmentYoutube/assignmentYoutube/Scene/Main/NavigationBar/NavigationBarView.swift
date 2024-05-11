//
//  HomeTitleView.swift
//  assignmentYoutube
//
//  Created by Roh on 5/8/24.
//

import UIKit

final class HomeTitleView: UIView {
    let connectDeviceButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "connectDeviceButton",
            style: .plain,
            target: HomeTitleView.self,
            action: #selector(setTapAlarmButton(_:))
        )
        button.tag = 0
        return button
    }()
    
    let alarmButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "alarmButton",
            style: .plain,
            target: HomeTitleView.self,
            action: #selector(setTapAlarmButton(_:))
        )
        button.tag = 1
        return button
    }()
    
    let searchButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "connectDeviceButton",
            style: .plain,
            target: HomeTitleView.self,
            action: #selector(setTapAlarmButton(_:))
        )
        button.tag = 2
        return button
    }()
    
    func setLayout() {
        
    }
    
    @objc private func setTapConnectDeviceButton(_ sender: Any) {
        
    }
    
    @objc private func setTapAlarmButton(_ sender: Any) {
        
    }
    
    @objc private func setTapSearchButton(_ sender: Any) {
        
    }
}
