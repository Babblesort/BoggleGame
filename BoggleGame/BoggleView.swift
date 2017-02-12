import UIKit

protocol BoggleViewProtocol: class {
    func didClickLetter(letter: String)
    func clearWord()
    func resetGame()
    func addWord()
}

class BoggleView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: BoggleViewProtocol?
    private let wordDisplay = UILabel()
    private let enterButton = BoggleButton()
    private var letterButtons = [BoggleButton]()
    private var words: [String] = []
    private var wordListTableView = UITableView()
    
    init() {
        super.init(frame: CGRect.zero)
        self.backgroundColor = .blue
        
        let rows = UIStackView()
        rows.axis = .vertical
        self.addSubview(rows)
        rows.translatesAutoresizingMaskIntoConstraints = false
        rows.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        rows.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        rows.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        rows.spacing = 15
        
        rows.addArrangedSubview(wordDisplay)
        wordDisplay.translatesAutoresizingMaskIntoConstraints = false
        wordDisplay.heightAnchor.constraint(equalToConstant: 80).isActive = true
        wordDisplay.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        wordDisplay.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        wordDisplay.textColor = .white
        wordDisplay.font = UIFont(name: "Helvetica-Bold", size: 36)
        wordDisplay.layer.borderColor = UIColor.white.cgColor
        wordDisplay.layer.borderWidth = 1
        wordDisplay.layer.cornerRadius = 3
        wordDisplay.textAlignment = NSTextAlignment.center
        
        let gameControlsRow = UIStackView()
        gameControlsRow.axis = .horizontal
        rows.addArrangedSubview(gameControlsRow)
        gameControlsRow.distribution = .fillProportionally
        gameControlsRow.spacing = 10
        gameControlsRow.translatesAutoresizingMaskIntoConstraints = false
        
        let resetButton = BoggleButton()
        gameControlsRow.addArrangedSubview(resetButton)
        resetButton.setTitle("Reset Game", for: .normal)
        resetButton.addTarget(self, action: #selector(self.resetGame), for: .touchUpInside)
        resetButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let clearButton = BoggleButton()
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        gameControlsRow.addArrangedSubview(clearButton)
        clearButton.setTitle("Clear", for: .normal)
        clearButton.addTarget(self, action: #selector(self.clearScreen), for: .touchUpInside)
        
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        gameControlsRow.addArrangedSubview(enterButton)
        enterButton.setTitle("Add", for: .normal)
        enterButton.addTarget(self, action: #selector(self.addWord), for: .touchUpInside)

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
                button.heightAnchor.constraint(equalToConstant: 40).isActive = true
                row.addArrangedSubview(button)
                button.addTarget(self, action: #selector(self.didClickLetter), for: .touchUpInside)
                buttonIndex += 1
                letterButtons.append(button)
            }
        }
        
        wordListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "wordCell")
        wordListTableView.delegate = self
        wordListTableView.dataSource = self
        rows.addArrangedSubview(wordListTableView)
        wordListTableView.translatesAutoresizingMaskIntoConstraints = false
        wordListTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        wordListTableView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
    }
    
    @objc
    private func didClickLetter(sender: UIButton) {
        if let buttonText = sender.title(for: .normal) {
            delegate?.didClickLetter(letter: buttonText)
        }
    }

    @objc
    private func resetGame() {
        delegate?.resetGame()
    }

    @objc
    private func clearScreen() {
        delegate?.clearWord()
    }

    @objc
    private func addWord() {
        delegate?.addWord()
    }

    func setButtonLetters(randomLetters: [String]) {
        for (index, letter) in randomLetters.enumerated() {
            letterButtons[index].setTitle(letter, for: .normal)
        }
    }
    
    func setCurrentWord(text: String) {
        wordDisplay.text = text
        enterButton.isEnabled = text.characters.count > 0
    }
    
    func setWords(_ wordList: [String]) {
        words = wordList
        wordListTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCell", for: indexPath)
        cell.textLabel?.text = words[indexPath.row]
        return cell
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
