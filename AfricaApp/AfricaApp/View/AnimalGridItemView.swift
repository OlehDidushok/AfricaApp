//
//  AnimalGridItemView.swift
//  AfricaApp
//
//  Created by Oleh on 15.07.2024.
//

import SwiftUI

struct AnimalGridItemView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    // MARK: - BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    AnimalGridItemView(animal: Bundle.main.decode("animals.json"))
}
