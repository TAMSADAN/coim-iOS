//
//  TradeViewController.swift
//  Enaco
//
//  Created by 송영모 on 2022/05/10.
//

import UIKit
import Then

class HistoryViewController: UIViewController {
    var titleLabel = UILabel().then {
        $0.text = "총 자산"
        $0.textColor = Const.Color.black
        $0.font = Const.Font.body
    }
    var priceLabel = UILabel().then {
        $0.text = "596,294,500원"
        $0.textColor = Const.Color.black
        $0.font = Const.Font.largeTitle
    }
    var historyTableView = UITableView().then {
        $0.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
        $0.backgroundColor = .white
        $0.separatorStyle = .none
        $0.rowHeight = 80
    }
    var historyTableViewAdaptor = HistoryTableViewAdaptor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setView()
        setTableView()
    }
}

extension HistoryViewController {
    func setNavigation() {
        navigationItem.title = "내역"
    }
    
    func setTableView() {
        historyTableViewAdaptor.update(self, coins: [Coin(), Coin(), Coin(), Coin(), Coin()])
        historyTableView.delegate = historyTableViewAdaptor
        historyTableView.dataSource = historyTableViewAdaptor
    }
    
    func setView() {
        view.addSubview(titleLabel)
        view.addSubview(priceLabel)
        view.addSubview(historyTableView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        historyTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            historyTableView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            historyTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            historyTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            historyTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
