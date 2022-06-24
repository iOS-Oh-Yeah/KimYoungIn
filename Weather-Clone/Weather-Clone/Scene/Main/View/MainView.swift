//
//  MainView.swift
//  Weather-Clone
//
//  Created by 김영인 on 2022/06/23.
//

import UIKit

import SnapKit
import Then

final class MainView: UIView {
    
    // MARK: - Properties
    
    private var regionLabel = UILabel().then {
        $0.text = "부천시"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 34)
    }
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configUI()
        setLayout()
        setTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    
    private func configUI() {
        setTableViewUI()
    }
    
    private func setTableViewUI() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func setLayout() {
        addSubview(regionLabel)
        regionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.centerX.equalToSuperview()
        }
        
        addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(regionLabel).offset(40)
            $0.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TodayMsgTableViewCell.self, forCellReuseIdentifier: TodayMsgTableViewCell.cellIdentifier)
        tableView.register(TodayWeatherTableViewCell.self, forCellReuseIdentifier: TodayWeatherTableViewCell.cellIdentifier)
    }
    
}

extension MainView: UITableViewDelegate {
    
}

extension MainView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TodayMsgTableViewCell.cellIdentifier) as? TodayMsgTableViewCell else { return UITableViewCell() }
                cell.selectionStyle = .none
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TodayWeatherTableViewCell.cellIdentifier) as? TodayWeatherTableViewCell else { return UITableViewCell() }
                return cell
            }
        case 1:
            return UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                return 40
            } else {
                return 110
            }
        case 1:
            return 500
        default:
            return 200
        }
    }
}

