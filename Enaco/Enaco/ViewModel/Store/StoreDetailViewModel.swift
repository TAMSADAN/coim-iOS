//
//  StoreDetailViewModel.swift
//  Enaco
//
//  Created by 송영모 on 2022/05/11.
//

import Foundation
import RxSwift
import RxCocoa

class StoreDetailViewModel: ViewModel {
    let coinService = CoinService()
    var disposeBag = DisposeBag()
    
    var input = Input()
    var output = Output()
    var coin: Coin!
    
    struct Input {
        let segmentIndex = PublishSubject<Int>()
    }
    
    struct Output {
        let coinCharts = PublishRelay<[CoinChart]>()
    }
    
    init(coin: Coin) {
        self.coin = coin
        setBind()
        
    }
}

extension StoreDetailViewModel {
    func refresh() {
        setBind()
    }
    
    func setBind() {
        input.segmentIndex
            .withUnretained(self)
            .bind { owner, index in
                if index == 0 {
                    owner.coinService.getCoinCharts(id: owner.coin.id, days: "1") {
                        coinCharts in
                        owner.output.coinCharts.accept(coinCharts)
                    }
                } else if index == 1 {
                    owner.coinService.getCoinCharts(id: owner.coin.id, days: "30") {
                        coinCharts in
                        owner.output.coinCharts.accept(coinCharts)
                    }
                } else if index == 2 {
                    owner.coinService.getCoinCharts(id: owner.coin.id, days: "max") {
                        coinCharts in
                        owner.output.coinCharts.accept(coinCharts)
                    }
                }
            }
            .disposed(by: disposeBag)
    }
}
