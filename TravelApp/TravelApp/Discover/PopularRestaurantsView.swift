//
//  PopularRestaurantsView.swift
//  TravelApp
//
//  Created by Zijia Zhai on 9/18/22.
//

import SwiftUI

struct PopularRestaurantsView: View {
    
    let restaurants: [Restaurant] = [
        .init(name: "Japan's Finest Tapas", imageName: "tapas"),
        .init(name: "Bar & Grill", imageName: "bar_grill"),
        .init(name: "Japan's Finest Tapas", imageName: "tapas"),
        .init(name: "Bar & Grill", imageName: "bar_grill"),
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Popular Places To Eat")
                Spacer()
                Text("See All")
            }.padding(.horizontal)
                .padding(.top)
                .font(.system(size: 14, weight: .semibold, design: .default))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(restaurants, id: \.self) { res in
                        HStack(spacing: 8) {
                            Image(res.imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(4)
                                .padding(.leading, 4)
                                .padding(.vertical, 4)
                            
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(res.name)
                                    Spacer()
                                    Button(action: {}) {
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(.gray)
                                    }
                                }
                                HStack {
                                    Image(systemName: "star.fill")
                                    Text("4.7 • Sushi • $$")
                                }
                                
                                Text("Tokyo, Japan")
                            }.font(.system(size: 12, weight: .semibold, design: .default))
                            Spacer()
                        }.frame(width: 240)
                            .asTile()
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct PopularRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularRestaurantsView()
        DiscoverView()
    }
}
