//
//  HomeView.swift
//  Crypto
//
//  Created by Utsav busa on 19/03/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm : HomeViewModel
    @State private var showProtfolio : Bool = false
    
    var body: some View {
        ZStack{
            //background layer
            Color.theme.background
                .ignoresSafeArea()
            
            
            //content layer
            VStack{
                HomeHeader
                
                ColumTitleList
                
                if !showProtfolio{
                   AllCoinsList
                        .transition(.move(edge: .leading))
                }
                if showProtfolio{
                    PortfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                    Spacer()
                }
            }
        }
    }

    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
                
            }
            .environmentObject(dev.homeVm)
        }
    }
    
    
    extension HomeView{
        
        private var HomeHeader: some View{
            HStack{
                CirculeButtonView(iconeName: showProtfolio ? "plus" : "info")
                    .background(
                        CirculeButtonAnimationView(animate: $showProtfolio))
                Spacer()
                Text(showProtfolio ? "Protfolio" : "Live Price")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.theme.accent)
                    .animation(.none)
                Spacer()
                CirculeButtonView(iconeName: "chevron.right")
                    .rotationEffect(Angle(degrees: showProtfolio ? 180 : 0))
                    .onTapGesture {
                        withAnimation(.spring()){
                            showProtfolio.toggle()
                        }
                    }
            }
            .padding(.horizontal)
        }
        
        private var AllCoinsList:some View{
            List{
                ForEach(vm.allCoins){coin in
                    CoinRowView(coin: coin, showHoldingColum: false)
                        .listRowInsets(.init(top:10,leading: 0, bottom:10,trailing: 10))
                    
                }
            }
            .listStyle(PlainListStyle())
        }
        
        private var PortfolioCoinsList:some View{
            List{
                ForEach(vm.portfolioCoins){coin in
                    CoinRowView(coin: coin, showHoldingColum: true)
                        .listRowInsets(.init(top:10,leading: 0, bottom:10,trailing: 10))
                    
                }
            }
            .listStyle(PlainListStyle())
        }
        private var ColumTitleList:some View{
            HStack{
                Text("Coin")
                Spacer()
                if showProtfolio{
                    Text("Holding")
                }
                Text("Price")
                    .frame(width: UIScreen.main.bounds.width / 3,alignment: .trailing)
            }
            .font(.caption)
            .foregroundColor(Color.theme.secondaryText)
            .padding(.horizontal)
        }
    }

