//
//  BucketListView.swift
//  BucketList
//
//  Created by Marcin Jędrzejak on 27/02/2023.
//

import SwiftUI

struct BucketListView: View {
    let bucketList = ["Climb Everest", "Visit Hawaii", "Get Married"]
    var body: some View {
        List {
            ForEach(bucketList, id: \.self) { item in
                Text(item)
            }
        }
    }
}

struct BucketListView_Previews: PreviewProvider {
    static var previews: some View {
        BucketListView()
    }
}
