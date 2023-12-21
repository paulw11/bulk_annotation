//
//  ContentView.swift
//  BulkAnnotation
//
//  Created by Paul Wilkinson on 19/12/2023.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var datasource: Datasource
    var body: some View {
        ZStack {
            
            Map() {
                if !self.datasource.features.isEmpty {
                    ForEach (datasource.features, id: \.self) { feature in
//                        Marker(feature.properties.name ??
//                                   "", coordinate: feature.properties.coordinate) 
                       Annotation(feature.properties.name ?? "", coordinate: CLLocationCoordinate2D(latitude: feature.properties.latitude, longitude: feature.properties.longitude ), anchor: .topTrailing) {
                          ArrowStarView()
                       }

                    }
                }
            }
            if datasource.loading {
                ProgressView().progressViewStyle(.circular)
            }
        }
        .padding()
        .onAppear() {
                self.datasource.load()
        }
    }
}

#Preview {
    ContentView().environmentObject(Datasource())
}
