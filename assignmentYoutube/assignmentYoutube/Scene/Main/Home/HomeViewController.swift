//
//  HomeViewController.swift
//  assignmentYoutube
//
//  Created by Roh on 3/19/24.
//

import UIKit

final class HomeViewController: BaseViewController {
    private var homeSource: [HomeSection] = [
        HomeSection.channel,
        HomeSection.keyword,
        HomeSection.video
    ]
    
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
        view.addSubview(headerCollectionView)
        NSLayoutConstraint.activate([
            headerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            headerCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    override func setStyle() {
        headerCollectionView.register(HomeChannelCVC.self, forCellWithReuseIdentifier: String(describing: HomeChannelCVC.self))
        headerCollectionView.register(HomeKeyWordCVC.self, forCellWithReuseIdentifier: String(describing: HomeKeyWordCVC.self))
        headerCollectionView.register(HomeVideoCVC.self, forCellWithReuseIdentifier: String(describing: HomeVideoCVC.self))
        headerCollectionView.dataSource = self
    }
    
    private func getLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, env -> NSCollectionLayoutSection? in
            switch self.homeSource[sectionIndex] {
            case .channel:
                return self.getChannelSection()
            case .keyword:
                return self.getKeywordSection()
            case .video:
                return self.getVideoSection()
            }
        }
    }
    
    func getChannelSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        // 그룹 사이즈를 비율로 설정하는. 코드
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.19),
//            heightDimension: .absolute(104)
            heightDimension: .fractionalHeight(0.17)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        return section
    }
    
    func getKeywordSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        // 그룹 사이즈를 비율로 설정하는. 코드
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.14),
            heightDimension: .fractionalHeight(0.05)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16)
        
        return section
    }
    
    func getVideoSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        // 그룹 사이즈를 비율로 설정하는. 코드
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.4)
        )
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 0, trailing: -16)
        
        return section
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return HomeSection.channel.mockData.count
        case 1:
            return HomeSection.keyword.mockData.count
        case 2:
            return HomeSection.video.mockData.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeChannelCVC.self), for: indexPath) as? HomeChannelCVC else {
                return UICollectionViewCell()
            }
            cell.configure(image: homeSource[0].mockData[indexPath.row], name: "지구닷")
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeKeyWordCVC.self), for: indexPath) as? HomeKeyWordCVC else {
                return UICollectionViewCell()
            }
            
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeVideoCVC.self), for: indexPath) as? HomeVideoCVC else {
                return UICollectionViewCell()
            }
            cell.configure(
                videoContentImage: homeSource[2].mockData[indexPath.row],
                videoProfileImage: "homeChannelSample1",
                videoTitleLabel: "videoTitleLabel",
                videoSubTitleLabel: "videoSubTitleLabel"
            )
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

#Preview {
    HomeViewController()
}
