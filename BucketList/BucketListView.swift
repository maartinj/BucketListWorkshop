//
//  BucketListView.swift
//  BucketList
//
//  Created by Marcin Jędrzejak on 27/02/2023.
//

import SwiftUI

// Playlista: https://www.youtube.com/watch?v=C8FWpccVYro&list=PLBn01m5Vbs4CTP6FpTWG0ZPDTyj4Fpt-3&ab_channel=StewartLynch

struct BucketListView: View {
    @State private var bucketList = ["Climb Everest", "Visit Hawaii", "Get Married"]
    @State private var newItem = ""
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("New Bucket Item", text: $newItem)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        bucketList.append(newItem)
                        newItem = ""
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newItem.isEmpty)
                }
                .padding()
                List {
                    ForEach(bucketList, id: \.self) { item in
                        NavigationLink(value: item) {
                            Text(item)
                        }
                    }
                    .onDelete { indexSet in
                        bucketList.remove(atOffsets: indexSet)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Bucket List")
            .navigationDestination(for: String.self) { item in
                Text(item)
                    .font(.title)
            }
        }
    }
}

struct BucketListView_Previews: PreviewProvider {
    static var previews: some View {
        BucketListView()
    }
}
