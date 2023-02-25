//
//  ExhibitDetailViewController.swift
//  Expo1900
//
//  Created by 임지연 on 2023/02/25.
//

import UIKit

final class ExhibitDetailViewController: UIViewController {
    var exhibitDetailView = ExhibitDetailView()
    
    init(item: ItemsData) {
        super.init(nibName: nil, bundle: nil)
        setupData(item)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = exhibitDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupData(_ item: ItemsData) {
        navigationItem.title = item.name
        exhibitDetailView.imageView.image = UIImage(named: item.imageName)
        exhibitDetailView.textView.text = item.desc
    }
}
