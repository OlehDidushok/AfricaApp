//
//  CreditsView.swift
//  AfricaApp
//
//  Created by Oleh on 15.07.2024.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
    Copyright @ Oleh Didushok
    All right reserved
    Better Apps ❤️ Less Code
    """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        } //: VSTACK
        .padding()
        .opacity(0.4)
    }
}

#Preview {
    CreditsView()
}
