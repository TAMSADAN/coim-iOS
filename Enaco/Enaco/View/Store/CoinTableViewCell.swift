//
//  StoreTableViewCell.swift
//  Enaco
//
//  Created by 송영모 on 2022/05/10.
//

import UIKit
import Then

class CoinTableViewCell: UITableViewCell {
    static let identifier = "CoinTableViewCell"
    
    var coin = Coin()
    
    var coinImageBackgroundView = UIView().then {
        $0.backgroundColor = Const.Color.systemGray6
        $0.layer.cornerRadius = 18
    }
    var coinImageView = UIImageView()
    var nameLabel = UILabel().then {
        $0.text = "BTC"
        $0.textColor = Const.Color.black
        $0.font = Const.Font.itemTitle
    }
    var symbolLabel = UILabel().then {
        $0.text = "12개"
        $0.textColor = Const.Color.systemGray
        $0.font = Const.Font.itemBody
    }
    var priceLabel = UILabel().then {
        $0.text = "124,598.00원"
        $0.textColor = Const.Color.black
        $0.font = Const.Font.itemTitle
    }
    var percentLabel = UILabel().then {
        $0.text = "+12.00%"
        $0.textColor = Const.Color.green
        $0.font = Const.Font.itemHeadline
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setView()
    }
    
    func update(coin: Coin) {
        if self.coin.imageUrl != coin.imageUrl {
            coinImageView.downloaded(from: coin.imageUrl)
        }
        self.coin = coin
        nameLabel.text = coin.name
        symbolLabel.text = coin.symbol.uppercased()
        priceLabel.text = String(ceil(coin.price * 100) / 100).insertComma + "원"
        percentLabel.text = String(ceil(coin.percent * 100) / 100).insertComma + "%"
        if coin.percent > 0 {
            percentLabel.textColor = Const.Color.green
        } else if coin.percent < 0 {
            percentLabel.textColor = Const.Color.pink
        } else {
            percentLabel.textColor = Const.Color.black
        }
    }
}

extension CoinTableViewCell {
    func setView() {
        let leftGuide = UILayoutGuide()
        let rightGuide = UILayoutGuide()
        
        addLayoutGuide(leftGuide)
        addLayoutGuide(rightGuide)
        addSubview(coinImageBackgroundView)
        addSubview(coinImageView)
        addSubview(nameLabel)
        addSubview(symbolLabel)
        addSubview(priceLabel)
        addSubview(percentLabel)
        
        coinImageBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        coinImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coinImageBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            coinImageBackgroundView.centerYAnchor.constraint(equalTo: centerYAnchor),
            coinImageBackgroundView.widthAnchor.constraint(equalToConstant: 36),
            coinImageBackgroundView.heightAnchor.constraint(equalToConstant: 36),
            
            coinImageView.topAnchor.constraint(equalTo: coinImageBackgroundView.topAnchor, constant: 3),
            coinImageView.leadingAnchor.constraint(equalTo: coinImageBackgroundView.leadingAnchor, constant: 3),
            coinImageView.trailingAnchor.constraint(equalTo: coinImageBackgroundView.trailingAnchor, constant: -3),
            coinImageView.bottomAnchor.constraint(equalTo: coinImageBackgroundView.bottomAnchor, constant: -3),
            
            leftGuide.leadingAnchor.constraint(equalTo: coinImageBackgroundView.trailingAnchor, constant: 5),
            leftGuide.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: leftGuide.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leftGuide.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: leftGuide.trailingAnchor),
            
            symbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            symbolLabel.leadingAnchor.constraint(equalTo: leftGuide.leadingAnchor),
            symbolLabel.trailingAnchor.constraint(equalTo: leftGuide.trailingAnchor),
            symbolLabel.bottomAnchor.constraint(equalTo: leftGuide.bottomAnchor),
            
            rightGuide.leadingAnchor.constraint(equalTo: leftGuide.trailingAnchor),
            rightGuide.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            rightGuide.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: rightGuide.topAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: rightGuide.trailingAnchor),
            
            percentLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            percentLabel.trailingAnchor.constraint(equalTo: rightGuide.trailingAnchor),
            percentLabel.bottomAnchor.constraint(equalTo: rightGuide.bottomAnchor),
        ])
    }
}
