//
//  MainMenuView.swift
//  ChateauDuNox
//
//  Created by YIP ZI XIAN on 11/03/2023.
//

import SwiftUI
import BottomBar_SwiftUI

struct GuestMenuView: View {
    // Wines Data
    let wines = WineData.wineData
    
    // State Variables
    @State private var searchText = ""
    @State private var filteredWines = [Wine]()
    
    // Binding Variables
    @Binding var isLogin: Bool
    
    var body: some View {
            VStack {
                Image("chateauLogo")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 10)
                    .padding(.bottom, 75)
                
                SearchBarStruct(text: $searchText)
                    .onChange(of: searchText) { searchText in
                        if searchText.isEmpty {
                            filteredWines = wines
                        } else {
                            filteredWines = wines.filter {
                                $0.name.lowercased().contains(searchText.lowercased())
                            }
                        }
                    }
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(filteredWines, id:\.self) { wine in
                            WineRowStruct(isLogin: $isLogin, wine: wine)
                        }
                    }
                }
                .padding(.horizontal, 40)
            }
            .navigationBarHidden(true)
            .padding(.top, 90.0)
            .onAppear {
                filterWines()
        }
    }
    
    // All wines appear first
    private func filterWines() {
        if searchText.isEmpty {
            filteredWines = wines
        } else {
            filteredWines = wines.filter { wine in
                wine.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

struct GuestMenuView_Previews: PreviewProvider {
    static var previews: some View {
        GuestMenuView(isLogin: .constant(false))
    }
}
