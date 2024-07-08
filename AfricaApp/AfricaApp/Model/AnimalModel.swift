//
//  AnimalModel.swift
//  AfricaApp
//
//  Created by Oleh on 08.07.2024.
//

import SwiftUI

struct Animal: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
