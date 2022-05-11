//
//  StoreViewModel.swift
//  Enaco
//
//  Created by 송영모 on 2022/05/10.
//

import Foundation
import RxSwift
import RxCocoa

class StoreViewModel: ViewModel {
    let coinService = CoinService()
    var disposeBag = DisposeBag()
    
    var input = Input()
    var output = Output()
    
    struct Input {
        
    }
    
    struct Output {
        let coins = PublishRelay<[Coin]>()
    }
    
    init() {
        setBind()
        updateCoins()
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { [weak self] (timer) in
            self?.updateCoins()
            //            if someCondition {
            //                timer.invalidate()
            //            }
        }
    }
}

extension StoreViewModel {
    func updateCoins() {
        coinService.getCoins {
            [weak self] coins in
            self?.output.coins.accept(coins)
        }
    }
    
    func refresh() {
        setBind()
    }
    
    func setBind() {
        output.coins.accept([Coin(), Coin(), Coin(), Coin(), Coin(), Coin(), Coin(), Coin(), Coin(), Coin(), Coin(), Coin()])
    }
}
