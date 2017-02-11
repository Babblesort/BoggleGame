import UIKit

class BoggleViewController: UIViewController{
    
    let boggleView: BoggleView
    let boggleModel: BoggleModel
    
    init(boggleView: BoggleView = BoggleView(), boggleModel: BoggleModel = BoggleModel()) {
        self.boggleView = boggleView
        self.boggleModel = boggleModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = boggleView
        boggleView.delegate = self
        boggleModel.delegate = self
        boggleModel.resetGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension BoggleViewController: BoggleViewProtocol {
    internal func resetGame() {
        boggleModel.resetGame()
    }

    internal func didClickLetter(letter: String) {
        boggleModel.addLetterToCurrentWord(letter: letter)
    }
    
    internal func clearWord() {
        boggleModel.clearWord()
    }
    
    internal func addWord() {
        boggleModel.addWord()
    }
}

extension BoggleViewController: BoggleModelProtocol {
    internal func didRandomizeLetters(randomLetters: [String]) {
        boggleView.setButtonLetters(randomLetters: randomLetters)
    }

    internal func didUpdateCurrentWord(currentWord: String) {
        boggleView.setCurrentWord(text: currentWord)
    }
    
    internal func didUpdateWordList(wordList: [String]) {
        boggleView.setWords(wordList)
    }
    
}
