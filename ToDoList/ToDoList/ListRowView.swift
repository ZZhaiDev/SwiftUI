//
//  SwiftUIView.swift
//  ToDoList
//
//  Created by Zijia Zhai on 8/1/22.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "first view")
    }
}
