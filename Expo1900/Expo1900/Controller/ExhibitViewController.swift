//
//  ExhibitViewController.swift
//  Expo1900
//
//  Created by 임지연 on 2023/02/17.
//

import UIKit

final class ExhibitViewController: UIViewController {
    var tableView = UITableView()
    
    override func loadView() {
        self.view = tableView
        self.view.backgroundColor = .systemBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ExhibitViewController: UITableViewDelegate {
    
}

extension ExhibitViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ItemCell else {
            return UITableViewCell()
        }
        
        cell.name.text = "Row \(indexPath.row)"
        return cell
    }
}

final class ItemCell: UITableViewCell {
    let name = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
