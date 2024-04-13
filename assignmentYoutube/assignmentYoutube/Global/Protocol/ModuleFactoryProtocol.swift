//
//  ModuleFactoryProtocol.swift
//  assignmentYoutube
//
//  Created by Roh on 4/14/24.
//

protocol ModuleFactoryProtocol {
    func instantiateSigninVC() -> SigninViewController
    func instantiateSignupCompleteVC() -> DoneAuthenticationViewController
}

class ModuleFactory: ModuleFactoryProtocol {
    static func resolve() -> ModuleFactory {
        return ModuleFactory()
    }
}

extension ModuleFactory {
    func instantiateSigninVC() -> SigninViewController {
        return SigninViewController.init()
    }
    
    func instantiateSignupCompleteVC() -> DoneAuthenticationViewController {
        return DoneAuthenticationViewController.init()
    }
}
