//
//  HomeTitleView.swift
//  assignmentYoutube
//
//  Created by Roh on 5/8/24.
//

import UIKit

final class NavigationBarView: UIView {
    let titleImage: UIBarButtonItem = {
        let button = UIBarButtonItem(
            image: UIImage(named: "navigationBarTitle")?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: NavigationBarView.self,
            action: #selector(setTapConnectDeviceButton(_:))
        )
        return button
    }()
    
    let connectDeviceButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            image: UIImage(named: "connectDevice")?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: NavigationBarView.self,
            action: #selector(setTapConnectDeviceButton(_:))
        )
        button.tag = 0
        return button
    }()
    
    let alarmButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            image: UIImage(named: "Alarm")?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: NavigationBarView.self,
            action: #selector(setTapAlarmButton(_:))
        )
        button.tag = 1
        return button
    }()
    
    let searchButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            image: UIImage(named: "Search")?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: NavigationBarView.self,
            action: #selector(setTapSearchButton(_:))
        )
        button.tag = 2
        return button
    }()
    
    @objc private func setTapConnectDeviceButton(_ sender: Any) {
        
    }
    
    @objc private func setTapAlarmButton(_ sender: Any) {
        
    }
    
    @objc private func setTapSearchButton(_ sender: Any) {
        
    }
}
