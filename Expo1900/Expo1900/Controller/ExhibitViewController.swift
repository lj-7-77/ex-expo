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
        self.navigationController?.title = "한국의 출품작"
        self.navigationItem.backBarButtonItem?.title = "메인"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        decodeData()
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
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        cell!.imageView?.image = UIImage(named: "poster.png")
        cell!.textLabel?.text = "title333"
        cell!.detailTextLabel?.text = "detail333"
        cell!.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell!
    }
    
    private func setupTableData(_ data: ItemsData) {

    }
}
