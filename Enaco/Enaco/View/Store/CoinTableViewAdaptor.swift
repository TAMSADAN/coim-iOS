//
//  StoreTableViewAdaptor.swift
//  Enaco
//
//  Created by 송영모 on 2022/05/10.
//

import UIKit

class CoinTableViewAdaptor: NSObject, UITableViewDelegate, UITableViewDataSource {
    weak var superViewController: UIViewController!
    var coins: [Coin] = []
    
    func update(_ superViewController: UIViewController, coins: [Coin]) {
        self.superViewController = superViewController
        self.coins = coins
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoinTableViewCell.identifier, for: indexPath) as! CoinTableViewCell
        
        cell.update(coin: coins[indexPath.section])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Log(indexPath)
        let cell = tableView.cellForRow(at: indexPath) as! CoinTableViewCell
        let storeDetailVC = StoreDetailViewController(superViewController, coin: cell.coin)
        superViewController.navigationController?.pushViewController(storeDetailVC, animated: true)
    }
}
