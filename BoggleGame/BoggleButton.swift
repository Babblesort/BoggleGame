import UIKit

class BoggleButton: UIButton {

    init() {
        super.init(frame: CGRect.zero)
    
        self.backgroundColor = .gray
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 3
        self.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 24)
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitleColor(UIColor.green, for: .highlighted)
        self.setTitleColor(UIColor.lightGray, for: .disabled)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
