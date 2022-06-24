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
    
    lazy var stickyHeaderView = StickyHeaderView()
    lazy var headerView = HeaderView()
    
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
//        addSubview(stickyHeaderView)
//        stickyHeaderView.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(30)
//            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
//        }
        
        addSubview(headerView)
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
        
        addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TodayMsgTableViewCell.self, forCellReuseIdentifier: TodayMsgTableViewCell.cellIdentifier)
        tableView.register(TodayWeatherTableViewCell.self, forCellReuseIdentifier: TodayWeatherTableViewCell.cellIdentifier)
        tableView.register(WeekMsgTableViewCell.self, forCellReuseIdentifier: WeekMsgTableViewCell.cellIdentifier)
        tableView.register(WeekWeatherTableViewCell.self, forCellReuseIdentifier: WeekWeatherTableViewCell.cellIdentifier)
    }
}
