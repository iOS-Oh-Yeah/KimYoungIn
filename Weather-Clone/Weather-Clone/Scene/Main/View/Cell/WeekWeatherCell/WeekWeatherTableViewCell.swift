//
//  WeekWeatherTableViewCell.swift
//  Weather-Clone
//
//  Created by 김영인 on 2022/06/24.
//

import UIKit

class WeekWeatherTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    static var cellIdentifier: String { String(describing: self) }
    
    private lazy var tableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorColor = .white.withAlphaComponent(0.6)
        $0.separatorInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        $0.isScrollEnabled = false
        $0.register(WeekWeatherInfoTableViewCell.self, forCellReuseIdentifier: WeekWeatherInfoTableViewCell.cellIdentifier)
    }
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
        setLayout()
        setTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    
    private func configUI() {
        backgroundColor = .clear
    }
    
    private func setLayout() {
        contentView.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension WeekWeatherTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeekWeatherInfoTableViewCell.cellIdentifier) as? WeekWeatherInfoTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
