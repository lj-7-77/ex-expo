//
//  ExhibitViewController.swift
//  Expo1900
//
//  Created by 임지연 on 2023/02/17.
//

import UIKit

final class ExhibitViewController: UIViewController {
    let decodeManager = DecodeManager()
    var tableView = UITableView()
    
    override func loadView() {
        super.loadView()
        self.view = tableView
        self.view.backgroundColor = .systemBackground
        navigationItem.title = "한국의 출품작"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        decodeData()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemCell.self, forCellReuseIdentifier: "cell")
    }

    private func decodeData() {
        guard let data: ItemsData = decodeManager.parse(file: "items") else {
            return
        }
        let itemsData: ItemsData = data
        setupTableData(itemsData)
    }
}

extension ExhibitViewController: UITableViewDelegate {
    
}

extension ExhibitViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ItemCell else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = "title text"
        cell.detailLabel.text = "detail text"
        return cell
    }
    
    private func setupTableData(_ data: ItemsData) {

    }
}
