//
//  CryptoSwiftUIApp.swift
//  CryptoSwiftUI
//
//  Created by Arman on 1/9/25.
//

import SwiftUI

@main
struct CryptoSwiftUIApp: App {
    @State private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
