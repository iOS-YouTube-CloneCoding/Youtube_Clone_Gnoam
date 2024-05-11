//
//  HomeHeaderView.swift
//  assignmentYoutube
//
//  Created by Roh on 5/8/24.
//

import UIKit

final class HomeHeaderView: UIView {
    var homeSubTitleCV: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout.list(using: .init(appearance: .plain))
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            homeSubTitleCV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            homeSubTitleCV.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            homeSubTitleCV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            homeSubTitleCV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        ])
    }
}

//extension HomeHeaderView: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//}
