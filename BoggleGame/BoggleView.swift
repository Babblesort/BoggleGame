import UIKit

class BoggleView: UIView {
    let numberScreen = UILabel()
    
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

        screenArea.addArrangedSubview(numberScreen)
        numberScreen.translatesAutoresizingMaskIntoConstraints = false
        numberScreen.heightAnchor.constraint(equalToConstant: 80).isActive = true
        numberScreen.textColor = .white
        numberScreen.font = UIFont(name: "Helvetica-Bold", size: 72)
        numberScreen.layer.borderColor = UIColor.white.cgColor
        numberScreen.layer.borderWidth = 1
        numberScreen.layer.cornerRadius = 3
        numberScreen.textAlignment = NSTextAlignment.center
        
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
        
        var buttonIndex = 1
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
                button.setTitle(String(buttonIndex), for: .normal)
                button.addTarget(self, action: #selector(self.typeToScreen), for: .touchUpInside)
                buttonIndex += 1
            }
        }
    }
    
    func typeToScreen(sender: UIButton) {
        if let buttonText = sender.title(for: .normal) {
            self.numberScreen.text = buttonText
        }
    }
    
    func clearScreen() {
        self.numberScreen.text = ""
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
