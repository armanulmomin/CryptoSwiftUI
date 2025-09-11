//
//  HomeView.swift
//  CryptoSwiftUI
//
//  Created by Arman on 2/9/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    var body: some View {
        ZStack{
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            //content layer
            VStack{
                homeHeader
                columnTitles
                
                if !showPortfolio {
                    allCoinLists
                    .transition(.move(edge: .leading))
                }
                if showPortfolio{
                    portfolioCoinLists
                        .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
            }
        }
    }
}


extension HomeView {
    private var homeHeader: some View {
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
                
            Spacer()
            Text(showPortfolio ? "Portfolio" :"Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                    }

                }
        }
        .padding(.horizontal)
    }
    private var allCoinLists: some View{
        List {
            ForEach(vm.allcoin){ coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                
            }
        }
        .listStyle(PlainListStyle() )
    }
    
    private var portfolioCoinLists: some View{
        List {
            ForEach(vm.allcoin){ coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                
            }
        }
        .listStyle(PlainListStyle() )
    }
    private var columnTitles: some View {
        HStack{
            Text("Coin")
            Spacer()
            if showPortfolio{
                Text("Holdings")
            }
         
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            
        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}

#Preview {
    NavigationView {
        HomeView()
            .navigationBarHidden(true)
    }
    .environmentObject(Preview.dev.homeVM)
}
