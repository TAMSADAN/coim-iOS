//
//  CoinService.swift
//  Enaco
//
//  Created by 송영모 on 2022/05/11.
//

import Foundation

class CoinService {
    let coinRepository = CoinRepository()
    
    func getCoins(completion: @escaping ([Coin]) -> Void) {
        coinRepository.getCoinEntities { coinEntities in
            var coins: [Coin] = []
            
            for coinEntity in coinEntities {
                let price = coinEntity.current_price ?? 0.0
                let percent = coinEntity.price_change_percentage_24h ?? 0.0
                
                let coin = Coin(id: coinEntity.id ?? "",
                                symbol: coinEntity.symbol ?? "",
                                name: coinEntity.name ?? "",
                                price: price  + Double.random(in: 0...0.1),
                                percent: percent + Double.random(in: -0...0.01),
                                imageUrl: coinEntity.image ?? "")
                coins.append(coin)
            }
            Log("모든 코인의 정보를 받았습니다.")
            completion(coins)
        }
    }
    
    func getCoinCharts(id: String, days: String, completion: @escaping ([CoinChart]) -> Void) {
        coinRepository.getCoinChartEntities(id: id, days: days) { coinChartEntities in
            var coinCharts: [CoinChart] = []
            
            for coinChartEntity in coinChartEntities {
                let coinChart = CoinChart(timestamp: coinChartEntity.timestamp,
                                          open: coinChartEntity.open,
                                          high: coinChartEntity.high,
                                          low: coinChartEntity.low,
                                          close: coinChartEntity.close)
                coinCharts.append(coinChart)
            }
            Log("\(id)의 차트를 \(days)단위로 받았습니다.")
            completion(coinCharts)
        }
    }
}
