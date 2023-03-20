//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Utsav busa on 19/03/23.
//

import Foundation
import Combine

class HomeViewModel:ObservableObject{
    
    @Published var allCoins:[CoinModel] = []
    @Published var portfolioCoins:[CoinModel] = []
    
    private let dataService = CoinDataService()
    private var cansellables = Set<AnyCancellable>()
    
    init(){
      addSubscribers()
    }
    
    func addSubscribers(){
        dataService.$allCoin
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cansellables)

    }
}
