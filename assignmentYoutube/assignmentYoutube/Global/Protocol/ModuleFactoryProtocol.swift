//
//  ModuleFactoryProtocol.swift
//  assignmentYoutube
//
//  Created by Roh on 4/14/24.
//

protocol ModuleFactoryProtocol {
    func instantiateSignupVC() -> SignupViewController
    func instantiateSignupCompleteVC(observer: [Observable<Void>]) -> DoneAuthenticationViewController
    func instantiateMainVC() -> MainViewController
    
    // MARK: - TabBar
    func instantiateHomeVC() -> HomeViewController
    func instantiateShortVC() -> ShortViewController
    func instantiateAddVC() -> AddViewController
    func instantiateSubscribeVC() -> SubscribeViewController
    func instantiateStorageVC() -> StorageViewController
}

class ModuleFactory: ModuleFactoryProtocol {
    static func resolve() -> ModuleFactory {
        return ModuleFactory()
    }
}

extension ModuleFactory {
    func instantiateSignupVC() -> SignupViewController {
        return SignupViewController.init()
    }
    
    func instantiateSignupCompleteVC(observer: [Observable<Void>]) -> DoneAuthenticationViewController {
        return DoneAuthenticationViewController.init(observer: observer)
    }
    
    func instantiateMainVC() -> MainViewController {
        return MainViewController.init()
    }
    
    
    // MARK: - TabBar
    func instantiateHomeVC() -> HomeViewController {
        return HomeViewController.init()
    }
    
    func instantiateShortVC() -> ShortViewController {
        return ShortViewController.init()
    }
    
    func instantiateAddVC() -> AddViewController {
        return AddViewController.init()
    }
    
    func instantiateSubscribeVC() -> SubscribeViewController {
        return SubscribeViewController.init()
    }
    
    func instantiateStorageVC() -> StorageViewController {
        return StorageViewController.init()
    }
}

