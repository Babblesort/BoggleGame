import Foundation

protocol BoggleModelProtocol: class {
    func didUpdateCurrentWord(currentWord: String)
    func didRandomizeLetters(randomLetters: [String])
}

class BoggleModel {
    
    weak var delegate: BoggleModelProtocol?
    private var currentWord: String = ""
    private var randomLetters = [String]()
    private let letterCount = 16
    
    private func randomLetter() -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let rand = Int(arc4random_uniform(26))
        let lettersArray = Array(letters.characters)
        return String(lettersArray[rand])
    }
    
    func resetGame() {
        clearWord()
        randomLetters = [String]()
        for _ in 0...letterCount - 1 {
            randomLetters.append(randomLetter())
        }
        delegate?.didRandomizeLetters(randomLetters: randomLetters)
    }
    
    func addLetterToCurrentWord(letter: String) {
        currentWord.append(letter)
        self.delegate?.didUpdateCurrentWord(currentWord: currentWord)
    }
    
    func clearWord() {
        currentWord = ""
        self.delegate?.didUpdateCurrentWord(currentWord: currentWord)
    }
}
