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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension BoggleViewController: BoggleViewProtocol {
    func getRandomLetters(n: Int) -> [String] {
        return boggleModel.getRandomLetters(n: n)
    }

    func buttonPressedWithLetter(letter: String) {
        boggleModel.addLetterToCurrentWord(letter: letter)
    }
    
    func clearWord() {
        boggleModel.clearWord()
    }
}

extension BoggleViewController: BoggleModelProtocol {
    func currentWordUpdated(currentWord: String) {
        boggleView.setCurrentWord(text: currentWord)
    }
}
