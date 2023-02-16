//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    let decodeManager = DecodeManager()
    var introView = IntroView()
//    var introExpositiondata: IntroExpositionData
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let parseData = decodeManager.parse() else {
            return
        }
        let introExpositiondata = parseData
        print(introExpositiondata.description)
        
        setupIntroView(introExpositiondata)
        self.view = introView
    }
    
    private func setupIntroView(_ data: IntroExpositionData) {
        introView.titleLabel.text = data.title
        introView.visitorsLabel.text = "방문객 : \(data.visitors) 명"
        introView.locationLabel.text = "개최지 : \(data.location)"
        introView.durationLabel.text = "개최 기간 : \(data.duration)"
        introView.descriptionTextView.text = data.description
    }
}

