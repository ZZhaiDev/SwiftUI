//
//  MapAppApp.swift
//  MapApp
//
//  Created by Zijia Zhai on 8/12/22.
//

import SwiftUI

@main
struct MapAppApp: App {
    @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
