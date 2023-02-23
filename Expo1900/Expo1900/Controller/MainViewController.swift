//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    let decodeManager = DecodeManager()
    var introView = IntroView()
    
    override func loadView() {
        super.loadView()
        navigationItem.title = "메인"
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeData()
        self.view = introView
        introView.delegate = self
    }
    
    private func decodeData() {
        guard let data: IntroExpositionData = decodeManager.parse(file: "exposition_universelle_1900") else {
            return
        }
        let introData = data
        setupIntroView(introData)
    }
    
    private func setupIntroView(_ data: IntroExpositionData) {
        introView.titleLabel.text = data.title
        introView.visitorsLabel.text = "방문객 : \(data.visitors) 명"
        introView.locationLabel.text = "개최지 : \(data.location)"
        introView.durationLabel.text = "개최 기간 : \(data.duration)"
        introView.descriptionTextView.text = data.description
    }
}

extension MainViewController: IntroViewDelegate {
    func tappedNextPageButton(sender: UIButton) {
        let exhibitViewController = ExhibitViewController()
        self.navigationController?.pushViewController(exhibitViewController, animated: true)
    }
}
