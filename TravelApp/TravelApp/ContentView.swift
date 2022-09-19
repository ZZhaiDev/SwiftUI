//
//  ContentView.swift
//  TravelApp
//
//  Created by Zijia Zhai on 9/18/22.
//

import SwiftUI

struct Category: Hashable {
    let name, imageName: String
}

struct Destination: Hashable {
    let name, country, imageName: String
}

struct Restaurant: Hashable {
    let name, imageName: String
}

struct User: Hashable {
    let name, imageName: String
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                DiscoverCategoriesView()
                PopularDestinationsView()
                PopularRestaurantsView()
                TrendingCreatorsView()
            }.navigationTitle("Discover")
        }
    }
}

struct TrendingCreatorsView: View {
    
    let users: [User] = [
        .init(name: "Amy Adams", imageName: "amy"),
        .init(name: "Billy", imageName: "billy"),
        .init(name: "Sam Smith", imageName: "sam"),
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Trending Creators")
                Spacer()
                Text("See All")
            }.padding(.horizontal)
            .padding(.top)
            .font(.system(size: 14, weight: .semibold))
            
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(users, id: \.self) { user in
                        VStack {
                            Image(user.imageName)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .cornerRadius(60)
                            Text(user.name)
                                .font(.system(size: 11, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 60)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

private struct PopularRestaurantsView: View {
    
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
                            .background(Color.init(white: 0.9))
                            .cornerRadius(6)
                    }
                }.padding(.horizontal)
            }
        }
    }
}


private struct PopularDestinationsView: View {
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
                        }.background(Color(.init(white: 0.9, alpha: 1)))
                        .cornerRadius(5)
                    }
                }.padding(.horizontal)
            }
        }
    }
}


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
                            .background(.gray)
                            .foregroundColor(.white)
                            .cornerRadius(.infinity)
                        Text(cat.name)
                            .font(.system(size: 12, weight: .semibold, design: .default))
                            .multilineTextAlignment(.center)
                    }.frame(width: 48)
                    
                }
            }.padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
