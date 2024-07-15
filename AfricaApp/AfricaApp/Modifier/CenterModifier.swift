//
//  CenterModifier.swift
//  AfricaApp
//
//  Created by Oleh on 15.07.2024.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
