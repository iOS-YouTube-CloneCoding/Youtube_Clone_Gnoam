//
//  ModuleFactoryProtocol.swift
//  assignmentYoutube
//
//  Created by Roh on 4/14/24.
//

protocol ModuleFactoryProtocol {
    func instantiateSignupVC() -> SignupViewController
    func instantiateSignupCompleteVC() -> DoneAuthenticationViewController
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
    
    func instantiateSignupCompleteVC() -> DoneAuthenticationViewController {
        return DoneAuthenticationViewController.init()
    }
}
