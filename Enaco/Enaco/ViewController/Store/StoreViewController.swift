//
//  WonExchangeViewController.swift
//  Enaco
//
//  Created by 송영모 on 2022/05/10.
//

import UIKit
import Then

class StoreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setView()
    }
}

extension StoreViewController {
    func setNavigation() {
        navigationItem.title = "거래소"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func setView() {
        view.backgroundColor = .orange
    }
}
