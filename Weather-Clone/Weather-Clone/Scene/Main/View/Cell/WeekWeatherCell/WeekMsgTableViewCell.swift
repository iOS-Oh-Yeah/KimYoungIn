//
//  WeekMsgTableViewCell.swift
//  Weather-Clone
//
//  Created by 김영인 on 2022/06/24.
//

import UIKit

class WeekMsgTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    static var cellIdentifier: String { return String(describing: self) }
    
    private var weekImageView = UIImageView().then {
        $0.image = Const.Image.calendar
        $0.tintColor = .white.withAlphaComponent(0.5)
    }
    
    private var lineView = UIView().then {
        $0.backgroundColor = .white.withAlphaComponent(0.6)
    }
    
    private var msgLabel = UILabel().then {
        $0.text = "10일간의 일기예보"
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .white.withAlphaComponent(0.5)
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
    }
    
    private func setLayout() {
        contentView.addSubview(weekImageView)
        weekImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(13)
        }
        
        contentView.addSubview(msgLabel)
        msgLabel.snp.makeConstraints {
            $0.leading.equalTo(weekImageView.snp.trailing).offset(5)
            $0.centerY.equalTo(weekImageView)
        }
        
        contentView.addSubview(lineView)
        lineView.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview()
        }
    }
}
