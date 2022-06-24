//
//  HeaderView.swift
//  Weather-Clone
//
//  Created by 김영인 on 2022/06/24.
//

import UIKit

class HeaderView: UIView {

    // MARK: - Properties
    
    private var regionLabel = UILabel().then {
        $0.text = "부천시"
        $0.font = UIFont.systemFont(ofSize: 34)
    }
    
    private var weatherLabel = UILabel().then {
        $0.text = "\(24)° | 한때 흐림"
        $0.font = .systemFont(ofSize: 22, weight: .medium)
    }
    
    private lazy var weatherStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 0
        $0.addArrangedSubview(regionLabel)
        $0.addArrangedSubview(weatherLabel)
    }

    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    
    private func configUI() {
        [regionLabel, weatherLabel].forEach {
            $0.textColor = .white
            $0.addLabelShadow()
        }
    }
    
    private func setLayout() {
        addSubview(weatherStackView)
        weatherStackView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.centerY.equalTo(safeAreaLayoutGuide)
        }
    }
}
