//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    let decodeManager = DecodeManager()
    
    override func loadView() {
        super.loadView()
        self.view = IntroView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeManager.parse()
    }
}

