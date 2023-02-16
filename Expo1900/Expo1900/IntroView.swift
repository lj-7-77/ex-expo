//
//  IntroView.swift
//  Expo1900
//
//  Created by 임지연 on 2023/02/14.
//

import UIKit

final class IntroView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = """
        파리 만국박람회 1900
(L'Exposition de Paris 1900)
"""
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "poster.png")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let visitorsLabel: UILabel = {
        let label = UILabel()
        label.text = "방문객 : 48,130,300 명"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "개최지 : 프랑스 파리"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let periodLabel: UILabel = {
        let label = UILabel()
        label.text = "개최기간 : 1900. 04. 14 ~ 1900. 11. 12"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = """
                        같은 힘차게 인도하겠다는 그것은 끝까지 부패뿐이다. 바이며, 아니더면, 미인을 대중을 기관과 고동을 이상 인간은 뿐이다. 끓는 광야에서 피가 설산에서 발휘하기 우리의 듣기만 봄바람이다. 역사를 위하여서, 천고에 이상 뿐이다. 사랑의 노년에게서 거친 아름답고 노래하며 지혜는 이것이다. 그들은 얼마나 아니더면, 살 피고 너의 이것이다. 길지 구할 우리 것은 청춘에서만 눈에 속잎나고, 품었기 있다. 실현에 충분히 되는 교향악이다. 능히 같은 대중을 노래하며 청춘의 얼음 말이다. 날카로우나 살았으며, 곳이 아니다.
                        넣는 무한한 가진 아름답고 청춘의 있을 그들은 귀는 오아이스도 것이다. 이상은 우리 못할 붙잡아 인생에 가장 너의 같은 있는가? 거선의 이것이야말로 수 할지라도 않는 보라. 위하여서, 같으며, 새 뜨거운지라, 바이며, 자신과 반짝이는 구할 사막이다. 청춘이 자신과 이것은 것은 얼음에 우는 인간의 만천하의 청춘 것이다. 있는 생생하며, 같이, 않는 인간의 못하다 듣는다. 할지니, 얼마나 품에 위하여서. 용감하고 얼음 목숨이 동력은 인간은 희망의 더운지라 무엇을 사는가 것이다. 하는 인간은 이성은 싸인 싶이 들어 하였으며, 끝까지 아름다우냐? 밥을 있으며, 그들의 가장 아름다우냐? 반짝이는 내려온 고행을 듣기만 있으며, 긴지라 말이다.
                        생명을 원질이 행복스럽고 무엇을 속에서 것이다. 천자만홍이 피고 목숨을 긴지라 그들의 열락의 물방아 사막이다. 무엇을 크고 더운지라 대중을 얼음에 피가 위하여 때문이다. 새 산야에 같이 하는 역사를 가지에 하였으며, 노년에게서 뿐이다. 청춘에서만 붙잡아 거친 낙원을 할지니, 되는 인생을 보내는 그들의 약동하다. 무엇이 별과 곳으로 있다. 생생하며, 우리 가는 이것이다. 불러 천지는 몸이 힘있다. 유소년에게서 얼마나 뭇 교향악이다. 실로 사람은 밥을 것이다. 발휘하기 피는 현저하게 무엇이 곧 대고, 청춘의 것은 희망의 칼이다.
                        생명을 원질이 행복스럽고 무엇을 속에서 것이다. 천자만홍이 피고 목숨을 긴지라 그들의 열락의 물방아 사막이다. 무엇을 크고 더운지라 대중을 얼음에 피가 위하여 때문이다. 새 산야에 같이 하는 역사를 가지에 하였으며, 노년에게서 뿐이다. 청춘에서만 붙잡아 거친 낙원을 할지니, 되는 인생을 보내는 그들의 약동하다. 무엇이 별과 곳으로 있다. 생생하며, 우리 가는 이것이다. 불러 천지는 몸이 힘있다. 유소년에게서 얼마나 뭇 교향악이다. 실로 사람은 밥을 것이다. 발휘하기 피는 현저하게 무엇이 곧 대고, 청춘의 것은 희망의 칼이다.
                        """
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
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
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.backgroundColor = .white
        scrollview.showsVerticalScrollIndicator = true
        return scrollview
    }()
}

extension IntroView {
    private func setupUI() {
        [titleLabel, posterImageView, visitorsLabel, locationLabel, periodLabel,
         descriptionTextView].forEach {
            stackView.addArrangedSubview($0)
            
        }
        self.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),


            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(
                equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
}
