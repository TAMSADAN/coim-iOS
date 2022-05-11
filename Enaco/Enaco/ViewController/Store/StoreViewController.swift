//
//  WonExchangeViewController.swift
//  Enaco
//
//  Created by 송영모 on 2022/05/10.
//

import UIKit
import RxSwift
import RxCocoa
import Then

class StoreViewController: UIViewController {
    let viewModel = StoreViewModel()
    var disposeBag = DisposeBag()
    
    var coinTableView = UITableView().then {
        $0.register(CoinTableViewCell.self, forCellReuseIdentifier: CoinTableViewCell.identifier)
        $0.backgroundColor = .white
        $0.separatorStyle = .none
        $0.rowHeight = 100
    }
    var coinTableViewAdaptor = CoinTableViewAdaptor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setView()
        setBind()
        setTableView()
    }
}

extension StoreViewController {
    func updateCoinTableView(coins: [Coin]) {
        coinTableViewAdaptor.update(self, coins: coins)
        coinTableView.reloadData()
    }
    
    func setTableView() {
        coinTableView.delegate = coinTableViewAdaptor
        coinTableView.dataSource = coinTableViewAdaptor
    }
    
    func setNavigation() {
        navigationItem.title = "거래소"
    }
    
    func setView() {
        view.backgroundColor = Const.Color.white
        
        view.addSubview(coinTableView)
        
        coinTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coinTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            coinTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            coinTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            coinTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension StoreViewController {
    func setBind() {
        viewModel.output.coins
            .withUnretained(self)
            .bind { owner, coins in
                owner.updateCoinTableView(coins: coins)
            }
            .disposed(by: disposeBag)
    }
}
