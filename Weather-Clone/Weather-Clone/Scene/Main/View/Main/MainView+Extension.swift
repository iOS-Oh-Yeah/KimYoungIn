//
//  MainView+Extension.swift
//  Weather-Clone
//
//  Created by 김영인 on 2022/06/24.
//

import UIKit

extension MainView: UITableViewDelegate, UITableViewDataSource {
    
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
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: WeekMsgTableViewCell.cellIdentifier) as? WeekMsgTableViewCell else { return UITableViewCell() }
                cell.selectionStyle = .none
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: WeekWeatherTableViewCell.cellIdentifier) as? WeekWeatherTableViewCell else { return UITableViewCell() }
                cell.selectionStyle = .none
                return cell
            }
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                return 45
            } else {
                return 110
            }
        case 1:
            if indexPath.row == 0 {
                return 35
            } else {
                return 549
            }
        default:
            return 200
        }
    }
}
