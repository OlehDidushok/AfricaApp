//
//  MapView.swift
//  AfricaApp
//
//  Created by Oleh on 05.07.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - BODY
    var body: some View {
        // MARK: Basic Map
//        Map(coordinateRegion: $region)
        
        // MARK: Advanced Map
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // PIN: Old style (always static)
            //            MapPin(coordinate: item.location, tint: .accentColor)
            
            // MARKER: Old style (always static)
            //            MapMarker(coordinate: item.location, tint: .accentColor)
            
            
            // Custom Basic Annotation
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            } //: ANNOTATION
        }
    }
}

#Preview {
    MapView()
}
