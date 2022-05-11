//
//  StoreTradeViewController.swift
//  Enaco
//
//  Created by 송영모 on 2022/05/10.
//

import UIKit
import Then

class StoreBuyViewController: UIViewController {
    weak var superViewController: UIViewController!
    
    var priceLabel = UILabel().then {
        $0.text = "105,974원"
        $0.textAlignment = .center
        $0.textColor = Const.Color.black
        $0.font = Const.Font.largeTitle
    }
    var countLabel = UILabel().then {
        $0.text = "14,000개"
        $0.textAlignment = .center
        $0.textColor = Const.Color.darkGray
        $0.font = Const.Font.body
    }
    var laterLabel = UILabel().then {
        $0.text = "거래후"
        $0.textAlignment = .center
        $0.textColor = Const.Color.black
        $0.font = Const.Font.footnote
    }
    var balanceLabel = UILabel().then {
        $0.text = "194,596,999원"
        $0.textAlignment = .center
        $0.textColor = Const.Color.black
        $0.font = Const.Font.body
    }
    var logLabel = UILabel().then {
        $0.text = "거래 가능합니다."
        $0.textAlignment = .center
        $0.textColor = Const.Color.black
        $0.font = Const.Font.caption1
    }
    var numberPad = NumberPadView()
    var rateSelectorView = RateSelectorView()
    var confirmButton = ConfirmButton(text: "구매할래요")
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(_ superViewController: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        self.superViewController = superViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
}

extension StoreBuyViewController {
    func setView() {
        view.backgroundColor = Const.Color.white
        
        view.addSubview(priceLabel)
        view.addSubview(countLabel)
        view.addSubview(laterLabel)
        view.addSubview(balanceLabel)
        view.addSubview(logLabel)
        view.addSubview(rateSelectorView)
        view.addSubview(numberPad)
        view.addSubview(confirmButton)
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        laterLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        logLabel.translatesAutoresizingMaskIntoConstraints = false
        rateSelectorView.translatesAutoresizingMaskIntoConstraints = false
        numberPad.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            priceLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            countLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            countLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            countLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            laterLabel.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 80),
            laterLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            laterLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            balanceLabel.topAnchor.constraint(equalTo: laterLabel.bottomAnchor, constant: 5),
            balanceLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            balanceLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            logLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            logLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            logLabel.bottomAnchor.constraint(equalTo: rateSelectorView.topAnchor, constant: -10),
            
            rateSelectorView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            rateSelectorView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            rateSelectorView.bottomAnchor.constraint(equalTo: numberPad.topAnchor, constant: -10),
            rateSelectorView.heightAnchor.constraint(equalToConstant: 30),
            
            numberPad.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            numberPad.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            numberPad.bottomAnchor.constraint(equalTo: confirmButton.topAnchor, constant: -30),
            numberPad.heightAnchor.constraint(equalToConstant: 250),
            
            confirmButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            confirmButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            confirmButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            confirmButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
}
