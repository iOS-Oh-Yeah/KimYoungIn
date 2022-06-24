//
//  TodayMsgTableViewCell.swift
//  Weather-Clone
//
//  Created by 김영인 on 2022/06/24.
//

import UIKit

import SnapKit
import Then

final class TodayMsgTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static var cellIdentifier: String { return String(describing: self) }
    
    private var msgLabel = UILabel().then {
        $0.text = "오후 5시쯤 한때 흐린 상태가 예상됩니다."
        $0.font = .systemFont(ofSize: 15, weight: .medium)
        $0.textColor = .white
    }
    
    private var lineView = UIView().then {
        $0.backgroundColor = .white.withAlphaComponent(0.8)
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
        contentView.addSubview(msgLabel)
        msgLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(10)
        }
        
        contentView.addSubview(lineView)
        lineView.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.leading.equalToSuperview().inset(5)
            $0.bottom.trailing.equalToSuperview()
        }
    }
}
