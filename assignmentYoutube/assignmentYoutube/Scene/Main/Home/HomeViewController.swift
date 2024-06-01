//
//  HomeViewController.swift
//  assignmentYoutube
//
//  Created by Roh on 3/19/24.
//

import UIKit
import Moya

final class HomeViewController: BaseViewController {
    private let youtubeVideoProvider = MoyaProvider<VideoAPI>()
    private var youtubeInfoRSP: VideoListSnippetResponse?
    private var youtubeList: [SnippetUseCase] = []
    
    private var homeSource: [HomeSection] = [
        HomeSection.channel,
        HomeSection.keyword,
        HomeSection.video
    ]
    
    private lazy var homeCollectionView: UICollectionView = {
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
        
        requestVideoList{ [self] result in
            youtubeList = result
            
            DispatchQueue.main.async {
                self.homeCollectionView.reloadData()
            }
        }
    }
    
    override func setLayout() {
        view.addSubview(homeCollectionView)
        NSLayoutConstraint.activate([
            homeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            homeCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    override func setStyle() {
        homeCollectionView.register(HomeChannelCVC.self, forCellWithReuseIdentifier: String(describing: HomeChannelCVC.self))
        homeCollectionView.register(HomeKeyWordCVC.self, forCellWithReuseIdentifier: String(describing: HomeKeyWordCVC.self))
        homeCollectionView.register(HomeVideoCVC.self, forCellWithReuseIdentifier: String(describing: HomeVideoCVC.self))
        homeCollectionView.dataSource = self
    }
}

extension HomeViewController {
    func requestVideoList(complection: @escaping ([SnippetUseCase]) -> Void) {
        let VideoListParam = VideoListRequest(part: "snippet", chart: "mostPopular", maxResults: 5)
        
        youtubeVideoProvider.request(.list(VideoListParam)) { response in
            switch response {
            case .success(let result): 
                do {
                    self.youtubeInfoRSP = try result.map(VideoListSnippetResponse.self)
                    guard let wrappedInfo = self.youtubeInfoRSP else {
                        print("VideoListSnippetResponse null error")
                        return
                    }
                    
                    let youtubeUseCase: [SnippetUseCase] = wrappedInfo.items.map {
                        return SnippetUseCase(
                            thumbnailURL: $0.snippet.thumbnails.maxres.url,
                            title: $0.snippet.title,
                            description: $0.snippet.description
                        )
                    }
                    complection(youtubeUseCase)
                }
                catch(let error) {
                    print(error.localizedDescription)
                }
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension HomeViewController {
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
    
    private func getChannelSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.19),
            heightDimension: .fractionalHeight(0.17)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
    
    private func getKeywordSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(30),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(20),
            heightDimension: .fractionalHeight(0.06)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
    
    private func getVideoSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.5)
        )
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return HomeSection.channel.getData.count
        case 1:
            return HomeSection.keyword.getData.count
        case 2:
            return youtubeList.count
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
            let data = homeSource[indexPath.section].getData as! [HomeSection.channelDataType]
            cell.configure(image: data[indexPath.row].image, name: data[indexPath.row].title)
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeKeyWordCVC.self), for: indexPath) as? HomeKeyWordCVC else {
                return UICollectionViewCell()
            }
            let data = homeSource[indexPath.section].getData as! [HomeSection.KeywordDataType]
            cell.configure(title: data[indexPath.row].title)
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeVideoCVC.self), for: indexPath) as? HomeVideoCVC else {
                return UICollectionViewCell()
            }
            let data = homeSource[indexPath.section].getData as! [HomeSection.VideoDataType]
            
            getImageWithURL(url: youtubeList[indexPath.row].thumbnailURL) { data in
                guard let image = data else {
                    print("image download error")
                    return
                }
                cell.handleImageData(imageData: image)
            }
            
            
            cell.configure(
//                videoContentImage: data[indexPath.row].videoImage,
                videoProfileImage: data[indexPath.row].channelImage,
                videoTitleLabel: youtubeList[indexPath.row].title,
                videoSubTitleLabel: youtubeList[indexPath.row].description
            )
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func getImageWithURL(url: String, complection: @escaping (Data?) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let imageData = data else {
                print("No data received")
                return
            }
            
            // 이미지 데이터 처리
            DispatchQueue.main.async {
                complection(imageData)
            }
        }
        task.resume()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return homeSource.count
    }
}

#Preview {
    HomeViewController()
}
