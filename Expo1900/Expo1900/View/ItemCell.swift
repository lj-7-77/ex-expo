//
//  ItemCell.swift
//  Expo1900
//
//  Created by 임지연 on 2023/02/24.
//

import UIKit

final class ItemCell: UITableViewCell {
    
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "poster.png")
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()

    let detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        return label
    }()
    
    let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ItemCell {
    private func setupCellUI() {
        [titleLabel, detailLabel].forEach {
            labelStackView.addArrangedSubview($0)
        }
        [itemImageView, labelStackView].forEach {
            stackView.addArrangedSubview($0)
        }
        self.addSubview(contentView)
        self.contentView.addSubview(stackView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(
                equalTo: self.contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(
                equalTo: self.contentView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(
                equalTo: self.contentView.topAnchor),
            stackView.bottomAnchor.constraint(
                equalTo: self.contentView.bottomAnchor)
        ])
    }
}
