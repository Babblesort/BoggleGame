import UIKit

protocol BoggleViewProtocol: class {
    func buttonPressedWithLetter(letter: String)
    func clearWord()
    func getRandomLetters(n: Int) -> [String]
}

class BoggleView: UIView {
    
    weak var delegate: BoggleViewProtocol?
    let wordDisplay = UILabel()
    var letterButtons = [UIButton]()
    
    init() {
        super.init(frame: CGRect.zero)
        self.backgroundColor = .blue
        
        let screenArea = UIStackView()
        screenArea.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(screenArea)
        screenArea.axis = .horizontal
        screenArea.distribution = .fill
        screenArea.spacing = 10
        screenArea.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        screenArea.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        screenArea.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true

        screenArea.addArrangedSubview(wordDisplay)
        wordDisplay.translatesAutoresizingMaskIntoConstraints = false
        wordDisplay.heightAnchor.constraint(equalToConstant: 80).isActive = true
        wordDisplay.textColor = .white
        wordDisplay.font = UIFont(name: "Helvetica-Bold", size: 36)
        wordDisplay.layer.borderColor = UIColor.white.cgColor
        wordDisplay.layer.borderWidth = 1
        wordDisplay.layer.cornerRadius = 3
        wordDisplay.textAlignment = NSTextAlignment.center
        
        let clearButton = BoggleButton()
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        screenArea.addArrangedSubview(clearButton)
        clearButton.widthAnchor.constraint(equalTo: screenArea.widthAnchor, multiplier: 1/5).isActive = true
        clearButton.setTitle("Clear", for: .normal)
        clearButton.addTarget(self, action: #selector(self.clearScreen), for: .touchUpInside)
        
        let rows = UIStackView()
        rows.axis = .vertical
        self.addSubview(rows)
        rows.translatesAutoresizingMaskIntoConstraints = false
        rows.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3).isActive = true
        rows.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        rows.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        rows.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        rows.distribution = .fillEqually
        rows.spacing = 15
        
        let row = UIStackView()
        row.axis = .horizontal
        rows.addArrangedSubview(row)
        row.distribution = .fillEqually
        row.spacing = 10
        row.translatesAutoresizingMaskIntoConstraints = false
        let button = BoggleButton()
        row.addArrangedSubview(button)
        button.setTitle("Reset Game", for: .normal)
        button.addTarget(self, action: #selector(self.resetGame), for: .touchUpInside)
        
        var buttonIndex = 0
        for _ in 0...3 {
            let row = UIStackView()
            row.axis = .horizontal
            rows.addArrangedSubview(row)
            row.distribution = .fillEqually
            row.spacing = 10
            row.translatesAutoresizingMaskIntoConstraints = false
            
            for _ in 0...3 {
                let button = BoggleButton()
                row.addArrangedSubview(button)
                button.addTarget(self, action: #selector(self.didClickLetter), for: .touchUpInside)
                buttonIndex += 1
                letterButtons.append(button)
            }
        }
    }
    
    @objc
    private func didClickLetter(sender: UIButton) {
        if let buttonText = sender.title(for: .normal) {
            self.delegate?.buttonPressedWithLetter(letter: buttonText)
        }
    }

    @objc
    private func resetGame(sender: UIButton) {
        clearScreen()
        let randomLetters = delegate?.getRandomLetters(n: 16)
        for (index, button) in letterButtons.enumerated() {
            button.setTitle(randomLetters?[index], for: .normal)
        }
    }

    @objc
    private func clearScreen() {
        self.delegate?.clearWord()
    }
    
    func getRandomLetters(n: Int) -> [String] {
        return (delegate?.getRandomLetters(n: n))!
    }
    
    func setCurrentWord(text: String) {
        wordDisplay.text = text
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
