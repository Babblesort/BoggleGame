import Foundation

protocol BoggleModelProtocol: class {
    func currentWordUpdated(currentWord: String)
}

class BoggleModel {
    
    weak var delegate: BoggleModelProtocol?
    private var currentWord: String = ""
    
    func randomLetter() -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let rand = Int(arc4random_uniform(26))
        let lettersArray = Array(letters.characters)
        return String(lettersArray[rand])
    }
    
    func getRandomLetters(n: Int) -> [String] {
        var letters = [String]()
        for _ in 0...n {
            letters.append(randomLetter())
        }
        return letters
    }
    
    func addLetterToCurrentWord(letter: String) {
        currentWord.append(letter)
        self.delegate?.currentWordUpdated(currentWord: currentWord)
    }
    
    func clearWord() {
        currentWord = ""
        self.delegate?.currentWordUpdated(currentWord: currentWord)
    }
}
