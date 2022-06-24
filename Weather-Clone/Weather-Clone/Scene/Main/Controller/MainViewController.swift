//
//  MainViewController.swift
//  Weather-Clone
//
//  Created by 김영인 on 2022/06/16.
//

import UIKit

import SnapKit
import Then

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var stickyHeaderView = StickyHeaderView()
    private lazy var headerView = HeaderView()
    private lazy var mainView = MainView()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    // MARK: - Function
    
    private func setUI() {
        view.backgroundColor = UIColor(patternImage: Const.Image.skyBackground ?? UIImage())
    }
    
    private func setLayout() {
//        view.addSubview(stickyHeaderView)
//        stickyHeaderView.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(80)
//            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
//        }
        
        view.addSubview(headerView)
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(mainView)
        mainView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

