//
//  Datasource.swift
//  BulkAnnotation
//
//  Created by Paul Wilkinson on 19/12/2023.
//

import Foundation
import CoreLocation

struct Features: Codable {
var features: [Feature]
}

struct Feature: Codable, Hashable {
    static func == (lhs: Feature, rhs: Feature) -> Bool {
        return lhs.properties.name == rhs.properties.name
    }
    
    var properties: Property
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(properties.name)
    }
}

struct Property: Codable, Identifiable {
    var id: Int
    var name: String?
    var latitude: Double
    var longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case name = "DESCRIPTION"
        case id = "OBJECTID"
        case latitude = "LATITUDE"
        case longitude = "LONGITUDE"
    }
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

class Datasource: ObservableObject {
    @Published var features: [Feature] = []
    @Published var loading = false
    
    init() {
    }
    
    func load() {
        loading = true
        
        Task {
            let features = await reallyLoad()
            await MainActor.run {
                if let features {
                    self.features = features
                }
                loading = false
            }
        }
        
    }
    
    func reallyLoad() async -> [Feature]? {
        do {
            if let file = Bundle.main.url(forResource: "stops", withExtension: "geojson") {
                let data = try Data(contentsOf: file)
                let features = try JSONDecoder().decode(Features.self, from: data)
                print(features.features.count)
                return Array(features.features
//                    .prefix(1000)
                             )
            } else {
                print("Could not get url for geojson file")
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
