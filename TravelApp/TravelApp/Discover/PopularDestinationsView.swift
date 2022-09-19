//
//  PopularDestinationsView.swift
//  TravelApp
//
//  Created by Zijia Zhai on 9/18/22.
//

import SwiftUI

struct PopularDestinationsView: View {
    let destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "eiffel_tower"),
        .init(name: "Tokyo", country: "Japan", imageName: "japan"),
        .init(name: "New York", country: "US", imageName: "new_york"),
        .init(name: "Paris", country: "France", imageName: "eiffel_tower"),
        .init(name: "Tokyo", country: "Japan", imageName: "japan"),
        .init(name: "New York", country: "US", imageName: "new_york"),
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Destinations")
                Spacer()
                Text("See All")
            }
            .padding(.horizontal)
            .padding(.top)
            .font(.system(size: 14, weight: .semibold, design: .default))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(destinations, id: \.self) { des in
                        VStack(alignment: .leading) {
                            Image(des.imageName)
                                .resizable()
                                .frame(width: 125, height: 125)
                                .cornerRadius(4)
                                .padding(6)
                                
                            Text(des.name)
                                .font(.system(size: 12, weight: .semibold, design: .default))
                                .padding(.horizontal, 12)
                            Text(des.country)
                                .font(.system(size: 12, weight: .semibold, design: .default))
                                .foregroundColor(.gray)
                                .padding(.horizontal, 12)
                                .padding(.bottom, 6)
                        }.asTile()
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationsView()
            .previewLayout(.sizeThatFits)
        DiscoverView()
    }
}
