//
//  BucketItem.swift
//  BucketList
//
//  Created by Marcin Jędrzejak on 03/03/2023.
//

import Foundation

struct BucketItem: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var note = ""
    var completedDate = Date.distantPast
    
    static var samples: [BucketItem] {
        [
            BucketItem(name: "Climb Mt. Everest"),
            BucketItem(name: "Visit Hawaii", note: "Go to Maui and Oahu"),
            BucketItem(name: "Get Married", note: "Found the love of my life", completedDate: Date())
        ]
    }
}
