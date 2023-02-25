//
//  IntroView.swift
//  Expo1900
//
//  Created by 임지연 on 2023/02/14.
//

import UIKit

protocol IntroViewDelegate {
    func tappedNextPageButton(sender: UIButton)
}

final class IntroView: UIView {
    var delegate: IntroViewDelegate?

    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "poster.png")
        return imageView
    }()
    
    let visitorsLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countryFlagImageViewRight: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flag.png")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let countryFlagImageViewLeft: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flag.png")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.backgroundColor = .white
        scrollview.showsVerticalScrollIndicator = true
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    let nextPageButton: UIButton = {
        let button = UIButton()
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(target,
                         action: #selector(ask),
                         for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func ask() {
        if let delegate = delegate {
            delegate.tappedNextPageButton(sender: nextPageButton)
        }
    }
}

extension IntroView {
    private func setupUI() {
        [countryFlagImageViewRight, nextPageButton, countryFlagImageViewLeft].forEach {
            bottomStackView.addArrangedSubview($0)
        }
        [titleLabel, posterImageView, visitorsLabel, locationLabel, durationLabel,
         descriptionLabel, bottomStackView].forEach {
            stackView.addArrangedSubview($0)
        }
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
          NSLayoutConstraint.activate([
              scrollView.topAnchor.constraint(equalTo: self.topAnchor),
              scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
              scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
              scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
              
              contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
              contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
              contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
              contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
              
              stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
              stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
              stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
              stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
              
              stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
              
              descriptionLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),

              countryFlagImageViewRight.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.15),
              countryFlagImageViewLeft.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.15),
              countryFlagImageViewRight.heightAnchor.constraint(equalTo: countryFlagImageViewRight.widthAnchor),
              countryFlagImageViewLeft.heightAnchor.constraint(equalTo: countryFlagImageViewLeft.widthAnchor)
          ])
      }
}
