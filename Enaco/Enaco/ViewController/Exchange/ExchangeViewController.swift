//
//  ExchangeViewController.swift
//  Enaco
//
//  Created by 송영모 on 2022/05/10.
//

import UIKit
import Then

class ExchangeViewController: UIViewController {
    
    var titleLabel = UILabel().then {
        $0.text = "총 자산"
        $0.textColor = Const.Color.black
        $0.font = Const.Font.body
    }
    var priceLabel = UILabel().then {
        $0.text = "452,251,000원"
        $0.textColor = Const.Color.black
        $0.font = Const.Font.largeTitle
    }
    
    var adButton = UIButton().then {
        $0.tintColor = .black
        $0.backgroundColor = .white
        $0.contentHorizontalAlignment = .fill
        $0.contentVerticalAlignment = .fill
        $0.setImage(UIImage(systemName: "airplane"), for: .normal)
        $0.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowOpacity = 0.5
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 3
        $0.layer.cornerRadius = 21
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setView()
    }
}

extension ExchangeViewController {
    func setNavigation() {
        navigationItem.title = "환전소"
    }
    
    func setView() {
        view.addSubview(titleLabel)
        view.addSubview(priceLabel)
        view.addSubview(adButton)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        adButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            priceLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            adButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            adButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            adButton.widthAnchor.constraint(equalToConstant: 42),
            adButton.heightAnchor.constraint(equalToConstant: 42),
        ])
    }
}
