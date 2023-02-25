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
    var itemsData: [ItemsData] = []
    
    override func loadView() {
        super.loadView()
        self.view = tableView
        self.view.backgroundColor = .systemBackground
        navigationItem.title = "한국의 출품작"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        itemsData = decodeData()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemCell.self, forCellReuseIdentifier: "cell")
    }

    private func decodeData() -> [ItemsData] {
        guard let data: [ItemsData] = decodeManager.parse(file: "items") else {
            return itemsData
        }
        return data
    }
}

extension ExhibitViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gotoNextPage(data: itemsData[indexPath.row])
    }
    
    private func gotoNextPage(data: ItemsData) {
        let exhibitDetailViewController = ExhibitDetailViewController(item: data)
        self.navigationController?.pushViewController(exhibitDetailViewController, animated: true)
    }
}

extension ExhibitViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ItemCell else {
            return UITableViewCell()
        }

        bindingData(cell, indexPath)
        return cell
    }
    
    private func bindingData(_ cell: ItemCell, _ indexPath: IndexPath) {
        cell.itemImageView.image = UIImage(named: itemsData[indexPath.row].imageName)
        cell.titleLabel.text = itemsData[indexPath.row].name
        cell.shortDescriptionLabel.text = itemsData[indexPath.row].shortDescription
    }
}
