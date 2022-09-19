//
//  CategoryDetailView.swift
//  TravelApp
//
//  Created by Zijia Zhai on 9/18/22.
//

import SwiftUI
import Kingfisher

class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    @Published var places = [Place]()
    @Published var errorMessage = ""
    
    init(name: String) {
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased())".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        guard let url = URL(string: urlString) else {
            self.isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, res, err in
            if let statusCode = (res as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                self.isLoading = false
                self.errorMessage = "Bad status: \(statusCode)"
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                guard let data = data else {
                    return
                }
                
                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                } catch {
                    print("Failed to decode JSON:", error)
                }
                self.isLoading = false
            }
        }.resume()
    }
}

struct CategoryDetailView: View {
    private let name: String
    @ObservedObject var vm: CategoryDetailsViewModel
    
    init(name: String) {
        self.name = name
        vm = .init(name: name)
    }
    
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
                if !vm.errorMessage.isEmpty {
                    VStack {
                        Image(systemName: "xmark.octagon.fill")
                            .font(.system(size: 64, weight: .semibold, design: .default))
                            .foregroundColor(.red)
                        Text(vm.errorMessage)
                    }
                }
                
                ScrollView {
                    ForEach(vm.places, id: \.self) { place in
                        VStack(alignment: .leading, spacing: 0) {
                            KFImage(URL(string: place.thumbnail))
                                .resizable()
                                .scaledToFill()
                            Text(place.name)
                                .font(.system(size: 12, weight: .semibold))
                                .padding()
                                
                        }.asTile()
                        .padding()
                    }
                }
            }
        }.navigationBarTitle(name, displayMode: .inline)
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailView(name: "sports")
        }
    }
}
