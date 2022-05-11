//
//  Coin.swift
//  Enaco
//
//  Created by 송영모 on 2022/05/10.
//

import Foundation

struct CoinChart {
    var timestamp: Double
    var open: Double
    var high: Double
    var low: Double
    var close: Double
}

struct Coin {
    var id: String = ""
    var symbol: String = ""
    var name: String = ""
    var price: Double = 0.0
    var percent: Double = 0.0
    var imageUrl: String = ""
}
