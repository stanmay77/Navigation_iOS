protocol LoginViewModelProtocol: ViewModel {
    
    var onStateChanged: ((LoginViewModel.State) -> Void)? { get set }
    func updateState(input: LoginViewModel.Input)
    
}


final class LoginViewModel: LoginViewModelProtocol {
    
    enum State {
        case logged
        case notlogged
    }
    
    enum Input {
        case correctLogInfo(User)
        case incorrectLogInfo
    }
    
    var userService: CurrentUserService = CurrentUserService()
    weak var coordinator: ProfileCoordinator?
    
    var onStateChanged: ((LoginViewModel.State) -> Void)?
    
    var state: State = .notlogged {
        didSet {
           onStateChanged?(state)
        }
    }
    
    func updateState(input: Input) {
        switch input {
        case .correctLogInfo(let user):
            self.state = .logged
            coordinator?.pushProfileVC(user)
 
        case .incorrectLogInfo:
            self.state = .notlogged
            coordinator?.presentAlert()
        }
    }
    
}
