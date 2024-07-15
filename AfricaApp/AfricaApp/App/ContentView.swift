//
//  ContentView.swift
//  AfricaApp
//
//  Created by Oleh on 24.06.2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    @State private var isGridActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolBarImage: String = "square.grid.2x2"
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: FUCTIONS
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number \(gridColumn)")
        
        // Toolbar image
        switch gridColumn {
        case 1:
            toolBarImage = "square.grid.2x2"
        case 2:
            toolBarImage = "square.grid.3x2"
        case 3:
            toolBarImage = "rectangle.grid.1x2"
        default:
            toolBarImage = "square.grid.2x2"
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Group {
                if !isGridActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                AnimalListItemView(animal: animal)
                            } //: LINK
                        } //: LOOP
                    } //: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink {
                                    AnimalDetailView(animal: animal)
                                } label: {
                                    AnimalGridItemView(animal: animal)
                                } //: LINK
                            } //: LOOP
                        } //: GRID
                        .padding(10)
                        .animation(.easeIn)
                    } //: SCROLL
                } //: Condition
            } //: GROUP
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        // LIST
                        Button(action: {
                            print("LIST VIEW IS ACTIVATED")
                            isGridActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridActive ? .primary : .accentColor)
                        })
                        
                        // GRID
                        Button {
                            print("grid view is Activated")
                            isGridActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolBarImage)
                                .font(.title2)
                                .foregroundColor(isGridActive ? .accentColor : .primary )
                        }
                        
                    } //: HSTACK
                } //: BUTTONS
            } //: TOOLBAR
        }//: NAVIGATION
    }
}


#Preview {
    ContentView()
}
