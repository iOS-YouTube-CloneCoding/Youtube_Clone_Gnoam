//
//  HomeViewController.swift
//  assignmentYoutube
//
//  Created by Roh on 3/19/24.
//

import UIKit

enum HomeSection {
    case channel
    case keyword
    case video
}

final class HomeViewController: BaseViewController {
    private func getHomeSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.35),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            repeatingSubitem: item,
            count: 3
        )
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
//        section.contentInsets = .init(top: 60, leading: 0, bottom: 30, trailing: 0)
//                section.boundarySupplementaryItems = [
//                    NSCollectionLayoutBoundarySupplementaryItem(
//                        layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30)),
//                        elementKind: UICollectionView.elementKindSectionHeader,
//                        alignment: .top
//                    )
//                ]
        return section
    }
    
    private func getLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            switch self.homeSource[sectionIndex] {
            case .channel:
                return self.getHomeSection()
            case .keyword:
                return self.getHomeSection()
            case .video:
                return self.getHomeSection()
            }
        }
    }
    
    private var homeSource: [HomeSection] = [HomeSection.channel, HomeSection.keyword, HomeSection.video]
    
    private lazy var headerCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.getLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setLayout() {
        view.addSubviews([
            headerCollectionView
        ])
        setHeaderLayout()
    }
    
    private func setHeaderLayout() {
        NSLayoutConstraint.activate([
            headerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            headerCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
//            headerCollectionView.widthAnchor.constraint(equalTo: headerCollectionView.heightAnchor, multiplier: 3.6)
        ])
    }
    
    override func setStyle() {
//        headerCollectionView.register(HomeSubTitleCVC.self, forCellWithReuseIdentifier: String(describing: HomeSubTitleCVC.self))
        headerCollectionView.register(HomeChannelCVC.self, forCellWithReuseIdentifier: String(describing: HomeChannelCVC.self))
        headerCollectionView.register(HomeKeyWordCVC.self, forCellWithReuseIdentifier: String(describing: HomeKeyWordCVC.self))
        headerCollectionView.dataSource = self
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeChannelCVC.self), for: indexPath) as? HomeChannelCVC else {
                return UICollectionViewCell()
            }
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeKeyWordCVC.self), for: indexPath) as? HomeKeyWordCVC else {
                return UICollectionViewCell()
            }
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeKeyWordCVC.self), for: indexPath) as? HomeKeyWordCVC else {
                return UICollectionViewCell()
            }
            return cell
        default:
            fatalError("unknown section")
        }
    }
    
    // 섹션수를 설정하는 코드
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return homeSource.count
    }
}
