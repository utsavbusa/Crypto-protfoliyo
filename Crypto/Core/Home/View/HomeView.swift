//
//  HomeView.swift
//  Crypto
//
//  Created by Utsav busa on 19/03/23.
//

import SwiftUI

struct HomeView: View {
    @State private var showProtfolio : Bool = false
    
    var body: some View {
        ZStack{
            //background layer
            Color.theme.background
                .ignoresSafeArea()
            
            
            //content layer
            VStack{
                HomeHeader
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
}
