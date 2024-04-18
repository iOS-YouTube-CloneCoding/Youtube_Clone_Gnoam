//
//  ModuleFactoryProtocol.swift
//  assignmentYoutube
//
//  Created by Roh on 4/14/24.
//

protocol ModuleFactoryProtocol {
    func instantiateSignupVC() -> SignupViewController
    func instantiateSignupCompleteVC(observer: Observable<Void>) -> DoneAuthenticationViewController
    func instantiateMainVC() -> MainViewController
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
    
    func instantiateSignupCompleteVC(observer: Observable<Void>) -> DoneAuthenticationViewController {
        return DoneAuthenticationViewController.init(observer: observer)
    }
    
    func instantiateMainVC() -> MainViewController {
        return MainViewController.init()
    }
}

