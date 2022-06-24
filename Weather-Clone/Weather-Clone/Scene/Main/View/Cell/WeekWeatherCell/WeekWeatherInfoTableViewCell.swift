//
//  WeekWeatherInfoTableViewCell.swift
//  Weather-Clone
//
//  Created by 김영인 on 2022/06/24.
//

import UIKit

class WeekWeatherInfoTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    static var cellIdentifier: String { return String(describing: self) }
    
    private var dayLabel = UILabel().then {
        $0.text = "오늘"
        $0.textColor = .white
    }
    
    private var weatherImageView = UIImageView().then {
        $0.image = Const.Image.cloud
    }
    
    private var lowLabel = UILabel().then {
        $0.text = "\(20)°"
        $0.textColor = .white.withAlphaComponent(0.5)
    }
    
    private var barImageView = UIImageView().then {
        $0.image = Const.Image.weatherBar
    }
    
    private var highLabel = UILabel().then {
        $0.text = "\(26)°"
        $0.textColor = .white
    }
    
    private lazy var stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 20
        $0.alignment = .center
        $0.distribution = .fillProportionally
        $0.addArrangedSubview(dayLabel)
        $0.addArrangedSubview(weatherImageView)
        $0.addArrangedSubview(lowLabel)
        $0.addArrangedSubview(barImageView)
        $0.addArrangedSubview(highLabel)
    }
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    
    private func configUI() {
        backgroundColor = .weatherBackground
        setLabelUI()
    }
    
    private func setLabelUI() {
        [dayLabel, lowLabel, highLabel].forEach {
            $0.font = .systemFont(ofSize: 19, weight: .medium)
        }
    }
    
    private func setLayout() {
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.width.equalTo(28)
        }
        
        barImageView.snp.makeConstraints {
            $0.width.equalTo(100)
        }
    }
}
