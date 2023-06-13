//
//  ProfileViewModel.swift
//  Navigation
//
//  Created by STANISLAV MAYBORODA on 5/29/23.
//

import Foundation

protocol ProfileViewModelProtocol: ViewModel {
    var onStateChanged: ((ProfileViewModel.State) -> Void)? {get set}
    func updateState(input: ProfileViewModel.Input, closure: @escaping (User?)->())
}


class ProfileViewModel: ProfileViewModelProtocol {
    
    enum State {
        case userLogged
        case userNotLogged
    }
    
    enum Input {
        case userProcessed(String)
    }
    
    var onStateChanged: ((State) -> Void)?
    var userService = CurrentUserService()
    
    
    var state: State = .userNotLogged {
        didSet {
            onStateChanged?(state)
        }
    }
    
    func updateState(input: Input, closure: @escaping (User?)->()) {
        switch input {
        case .userProcessed(let login):
            return closure(userService.getUserByLogin(for: login))
        }
    }
    
    
}

    
   
