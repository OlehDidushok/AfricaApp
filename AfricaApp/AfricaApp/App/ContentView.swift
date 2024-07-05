//
//  ContentView.swift
//  AfricaApp
//
//  Created by Oleh on 24.06.2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            } //: LIST
            .navigationBarTitle("Africa", displayMode: .large)
        }//: NAVIGATION
    }
}


#Preview {
    ContentView()
}
