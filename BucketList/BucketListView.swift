//
//  BucketListView.swift
//  BucketList
//
//  Created by Marcin Jędrzejak on 27/02/2023.
//

import SwiftUI

// Playlista: https://www.youtube.com/watch?v=C8FWpccVYro&list=PLBn01m5Vbs4CTP6FpTWG0ZPDTyj4Fpt-3&ab_channel=StewartLynch

struct BucketListView: View {
    @State private var bucketList = BucketItem.samples
    @State private var newItem = ""
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("New Bucket Item", text: $newItem)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        let newBucketItem = BucketItem(name: newItem)
                        bucketList.append(newBucketItem)
                        newItem = ""
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newItem.isEmpty)
                }
                .padding()
                List {
                    ForEach($bucketList) { $item in
                        NavigationLink(value: item) {
                            TextField(item.name, text: $item.name, axis: .vertical)
                                .textFieldStyle(.roundedBorder)
                                .font(.title3)
                                .foregroundColor(item.completedDate == .distantPast ? .primary : .red)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .onDelete { indexSet in
                        bucketList.remove(atOffsets: indexSet)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Bucket List")
            .navigationDestination(for: BucketItem.self) { item in
                DetailView(bucketItem: item, bucketList: $bucketList)
            }
        }
    }
}

struct BucketListView_Previews: PreviewProvider {
    static var previews: some View {
        BucketListView()
    }
}
