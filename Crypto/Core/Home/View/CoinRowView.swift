//
//  CoinViewRow.swift
//  Crypto
//
//  Created by Utsav busa on 19/03/23.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin:CoinModel
    var showHoldingColum : Bool
    
    var body: some View {
        HStack{
            
            LeftcolumView
            Spacer()
            if showHoldingColum{
                CenterColumView
            }
            
           RightColumView
            
            
        }
        .font(.subheadline)
    }
}

struct CoinViewRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CoinRowView(coin: dev.coin,showHoldingColum: true)
                .previewLayout(.sizeThatFits)
            
            CoinRowView(coin: dev.coin,showHoldingColum: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}


extension CoinRowView{
    private var LeftcolumView : some View{
        HStack{
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30,height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading,6)
                .foregroundColor(Color.theme.accent)
        }
    }
    private var CenterColumView : some View{
        VStack(alignment: .trailing){
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var RightColumView : some View{
        VStack(alignment: .trailing){
            Text("\(coin.currentPrice.asCurrencyWith2Decimals())")
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? " ")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0)>=0 ? Color.theme.green : Color.theme.red)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5,alignment: .trailing)
    }
}
