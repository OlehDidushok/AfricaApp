//
//  MapAnnotationView.swift
//  AfricaApp
//
//  Created by Oleh on 14.07.2024.
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: - PROPERTIES
    let location: NationalParkLocation
    @State var animation: Double = 0.0
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 53, height: 53, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())
        } //: ZSTACK
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

//#Preview {
//    MapAnnotationView(location: Bundle.main.decode("locations.json"))
//}



