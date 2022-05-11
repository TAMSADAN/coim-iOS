//
//  Secret.swift
//  Enaco
//
//  Created by 송영모 on 2022/05/11.
//

import Foundation

struct Secret {
    struct Url {
        static let coinAPI = "https://api.coingecko.com/api/v3/coins/markets"
        static func coinChartAPI(id: String) -> String {
            return "https://api.coingecko.com/api/v3/coins/\(id)/ohlc"
        }
    }
}
