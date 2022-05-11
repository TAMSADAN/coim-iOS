//
//  CoinService.swift
//  Enaco
//
//  Created by 송영모 on 2022/05/11.
//

import Foundation
import Alamofire

class CoinRepository {
    func getCoinEntities(completion: @escaping ([CoinEntity]) -> Void) {
        let url = Secret.Url.coinAPI
        let body: Parameters = [
            "vs_currency": "krw",
            "per_page": 250
        ]
        
        AF
            .request(url, method: .get, parameters: body)
            .validate(statusCode: 200..<300)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let value):
                    do {
                        let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                        let coinEntities = try JSONDecoder().decode([CoinEntity].self, from: data)
                        completion(coinEntities)
                    } catch {
                        Log("JSON Parsing Error \(error)")
                    }
                    
                case .failure(let error):
                    Log("response Error \(error)")
                    break
                }
            })
    }
    
    func getCoinChartEntities(id: String, days: String, completion: @escaping ([CoinChartEntity]) -> Void) {
        let url = Secret.Url.coinChartAPI(id: id)
        let body: Parameters = [
            "vs_currency": "krw",
            "days": days,
        ]
        
        AF
            .request(url, method: .get, parameters: body)
            .validate(statusCode: 200..<300)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(let value):
                    do {
                        let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                        let dataEntities = try JSONDecoder().decode([[Double]].self, from: data)
                        var coinChartEntities: [CoinChartEntity] = []
                        for dataEntity in dataEntities {
                            let coinChartEntity = CoinChartEntity(timestamp: dataEntity[0], open: dataEntity[1], high: dataEntity[2], low: dataEntity[3], close: dataEntity[4])
                            coinChartEntities.append(coinChartEntity)
                        }
                        completion(coinChartEntities)
                    } catch {
                        Log("JSON Parsing Error \(error)")
                    }
                    
                case .failure(let error):
                    Log("response Error \(error)")
                    break
                }
            })
    }
}
