//
//  BulkAnnotationApp.swift
//  BulkAnnotation
//
//  Created by Paul Wilkinson on 19/12/2023.
//

import SwiftUI

@main
struct BulkAnnotationApp: App {
    
    @StateObject var datasource = Datasource()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(datasource)
        }
    }
}
