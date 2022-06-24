//
//  TodayWeatherCollectionViewCell.swift
//  Weather-Clone
//
//  Created by 김영인 on 2022/06/24.
//

import UIKit

import SnapKit
import Then

final class TodayWeatherCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static var cellIdentifier: String { return String(describing: self) }
    
    private var timeLabel = UILabel().then {
        $0.text = "지금"
        $0.font = .systemFont(ofSize: 15, weight: .medium)
        $0.textColor = .white
    }
    
    private var weatherImage = UIImageView().then {
        $0.image = Const.Image.cloud
    }
    
    private var numLabel = UILabel().then {
        $0.text = "\(23)°"
        $0.font = .systemFont(ofSize: 19, weight: .medium)
        $0.textColor = .white
    }
    
    private lazy var todayStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 15
        $0.alignment = .center
        $0.distribution = .fillEqually
        $0.addArrangedSubview(timeLabel)
        $0.addArrangedSubview(weatherImage)
        $0.addArrangedSubview(numLabel)
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
        backgroundColor  = .clear
    }
    
    private func setLayout() {
        contentView.addSubview(todayStackView)
        todayStackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.centerY.equalTo(safeAreaLayoutGuide)
        }
        
        weatherImage.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.equalTo(25)
        }
    }
}
