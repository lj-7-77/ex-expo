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
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()

    let detailLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body)
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
                equalTo: self.contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(
                equalTo: self.contentView.bottomAnchor, constant: -10),
            
            itemImageView.widthAnchor.constraint(
                equalTo: self.contentView.widthAnchor, multiplier: 0.2)
        ])
    }
}
