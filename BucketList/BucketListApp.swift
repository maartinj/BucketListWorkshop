//
//  BucketListApp.swift
//  BucketList
//
//  Created by Marcin Jędrzejak on 27/02/2023.
//

import SwiftUI

@main
struct BucketListApp: App {
    @StateObject var dataStore = DataStore()
    var body: some Scene {
        WindowGroup {
            BucketListView()
                .environmentObject(dataStore)
                .onAppear {
                    print(URL.documentsDirectory.path)
                }
        }
    }
}
