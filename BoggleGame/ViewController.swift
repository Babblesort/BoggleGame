//
//  ViewController.swift
//  BoggleGame
//
//  Created by dev1 on 1/26/17.
//  Copyright © 2017 Asynchrony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let boggleView: BoggleView
    
    
    init(boggleView: BoggleView = BoggleView()) {
        self.boggleView = boggleView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = boggleView
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateLabelWithButtonText(sender : UIButton) {
        if let buttonText = sender.title(for: .normal) {
            print(buttonText)
        }
    }
}

