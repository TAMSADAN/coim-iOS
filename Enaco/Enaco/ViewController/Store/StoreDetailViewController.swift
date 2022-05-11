//
//  ExchangeDetailViewController.swift
//  Enaco
//
//  Created by 송영모 on 2022/05/10.
//

import UIKit
import RxSwift
import RxCocoa
import Then
import LightweightCharts

class StoreDetailViewController: UIViewController {
    var disposeBag = DisposeBag()
    var superViewController: UIViewController!
    var coin: Coin!
    var viewModel: StoreDetailViewModel!
    
    var chartView: LightweightCharts!
    var series: BarSeries!
    var candleSeries: CandlestickSeries!
    
    var buttonStackView = UIStackView().then {
        $0.distribution = .fillEqually
        $0.spacing = 10
    }
    var segmentView = UISegmentedControl(items: ["1일", "30일", "전체"]).then {
        $0.selectedSegmentIndex = 0
    }
    var sellButton = CancelButton(text: "판매하기")
    var buyButton = ConfirmButton(text: "구매하기")
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(_ superViewController:  UIViewController, coin: Coin ) {
        super.init(nibName: nil, bundle: nil)
        self.superViewController = superViewController
        self.coin = coin
        self.viewModel = StoreDetailViewModel(coin: coin)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setView()
        setBind()
    }
}

extension StoreDetailViewController {
    func setNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "상세 페이지"
    }
    
    func setView() {
        chartView = LightweightCharts()
        candleSeries = chartView.addCandlestickSeries(options: nil)
        view.backgroundColor = Const.Color.white
        
        view.addSubview(chartView)
        view.addSubview(segmentView)
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(sellButton)
        buttonStackView.addArrangedSubview(buyButton)
        
        chartView.translatesAutoresizingMaskIntoConstraints = false
        segmentView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            chartView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            chartView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            chartView.heightAnchor.constraint(equalToConstant: 300),
            
            segmentView.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 10),
            segmentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            segmentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            segmentView.heightAnchor.constraint(equalToConstant: 30),
            
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            buttonStackView.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
}

extension StoreDetailViewController {
    func setBind() {
        segmentView.rx.selectedSegmentIndex
            .bind(to: viewModel.input.segmentIndex)
            .disposed(by: disposeBag)
        
        buyButton.rx.tap
            .withUnretained(self)
            .bind { owner, _ in
                let storeBuyVC = StoreBuyViewController(owner)
                storeBuyVC.modalPresentationStyle = .formSheet
                owner.navigationController?.present(storeBuyVC, animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
        
        sellButton.rx.tap
            .withUnretained(self)
            .bind { owner, _ in
                let storeSellVC = StoreSellViewController(owner)
                storeSellVC.modalPresentationStyle = .formSheet
                owner.navigationController?.present(storeSellVC, animated: true, completion: nil)
            }
            .disposed(by: disposeBag)
        
        viewModel.output.coinCharts
            .withUnretained(self)
            .bind { owner, coinCharts in
                var data: [CandlestickData] = []
                for (_, coinChart) in coinCharts.enumerated() {
                    let barData = CandlestickData(time: .utc(timestamp: coinChart.timestamp),
                                                  open: coinChart.open,
                                                  high: coinChart.high,
                                                  low: coinChart.low,
                                                  close: coinChart.close,
                                                  color: nil,
                                                  borderColor: nil,
                                                  wickColor: nil)
                    
                    data.append(barData)
                }
                owner.candleSeries.setData(data: data)
            }
            .disposed(by: disposeBag)
    }
}
