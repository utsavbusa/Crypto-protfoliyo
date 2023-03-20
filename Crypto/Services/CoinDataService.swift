//
//  CoinDataService.swift
//  Crypto
//
//  Created by Utsav busa on 19/03/23.
//

import Foundation
import Combine

class CoinDataService{
    
    @Published var allCoin:[CoinModel] = []
    var coinSubscription:AnyCancellable?
    
    
    init(){
        getCoin()
    }
    
    private func getCoin(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
        else { return }
     
        coinSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap{(output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else{
                    throw URLError(.badServerResponse)
                }
                return output.data
                
            }
            .receive(on:DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink {  (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: {[weak self] (returnedCoins) in
                self?.allCoin = returnedCoins
                self?.coinSubscription?.cancel()
            }

            }
    }

