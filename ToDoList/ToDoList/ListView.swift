//
//  ContentView.swift
//  ToDoList
//
//  Created by Zijia Zhai on 7/29/22.
//

import SwiftUI

struct ListView: View {
    @State var items: [String] = ["first items", "2 items", "3 items"]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📝")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("Add", destination: AddView()))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ListView()
            }
            .previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}


