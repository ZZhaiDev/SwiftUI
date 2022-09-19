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
                    NavigationLink {
                        CategoryDetailView()
                    } label: {
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

                }
            }.padding(.horizontal)
        }
    }
}

class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    @Published var places = [Int]()
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.isLoading = false
            self.places = Array(0...3)
        }
    }
}

struct LoadingView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    
    typealias UIViewType = UIActivityIndicatorView
}

struct CategoryDetailView: View {
    @ObservedObject var vm = CategoryDetailsViewModel()
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                VStack {
                    LoadingView()
                    Text("Loading..")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding()
                .background(Color.black)
                .cornerRadius(8)
                
            } else {
                ScrollView {
                    ForEach(vm.places, id: \.self) { num in
                        VStack(alignment: .leading, spacing: 0) {
                            Image("art1")
                                .resizable()
                                .scaledToFill()
                            Text("Demo123456")
                                .font(.system(size: 12, weight: .semibold))
                                .padding()
                                
                        }.asTile()
                        .padding()
                    }
                }
            }
        }.navigationBarTitle("Category", displayMode: .inline)
    }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailView()
        }
        
//        DiscoverCategoriesView()
//            .background(.orange)
//            .previewLayout(.sizeThatFits)
//
//        DiscoverView()
    }
}
