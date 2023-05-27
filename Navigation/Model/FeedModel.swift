protocol FeedModelProtocol {
    func check(word: String) -> Bool
}


final class FeedModel: FeedModelProtocol {
    
    private let secretWord = "пароль"
    
    func check(word: String) -> Bool {
        if word == self.secretWord {
            return true
        } else {
            return false
        }
    }
}
