//
//  VideoModel.swift
//  AfricaApp
//
//  Created by Oleh on 08.07.2024.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
