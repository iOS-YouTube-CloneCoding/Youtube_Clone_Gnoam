//
//  HomeHeaderView.swift
//  assignmentYoutube
//
//  Created by Roh on 5/8/24.
//

import UIKit

final class HomeHeaderView: UIView {
    private var homeSubTitleCV: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout.list(using: .init(appearance: .plain))
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func setLayout() {
        NSLayoutConstraint.activate([
            homeSubTitleCV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            homeSubTitleCV.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            homeSubTitleCV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            homeSubTitleCV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        ])
    }
}

