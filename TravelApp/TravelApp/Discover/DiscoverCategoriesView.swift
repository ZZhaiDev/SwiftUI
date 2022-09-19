//
//  DiscoverCategoriesView.swift
//  TravelApp
//
//  Created by Zijia Zhai on 9/18/22.
//

import SwiftUI

struct DiscoverCategoriesView: View {
    
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "music.mic"),
        .init(name: "History", imageName: "music.mic"),
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top, spacing: 16) {
                ForEach(categories, id: \.self) { cat in
                    VStack {
                        Image(systemName: cat.imageName)
                            .frame(width: 50, height: 50)
                            .background(.white)
                            .foregroundColor(.orange)
                            .cornerRadius(.infinity)
                        Text(cat.name)
                            .font(.system(size: 12, weight: .semibold, design: .default))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }.frame(width: 48)
                }
            }.padding(.horizontal)
        }
    }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverCategoriesView()
            .background(.orange)
            .previewLayout(.sizeThatFits)
        DiscoverView()
    }
}
