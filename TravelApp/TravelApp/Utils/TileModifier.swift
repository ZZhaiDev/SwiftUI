//
//  TileModifier.swift
//  TravelApp
//
//  Created by Zijia Zhai on 9/18/22.
//

import SwiftUI

extension View {
    func asTile() -> some View {
        modifier(TileModifer())
    }
}



struct TileModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.white)
            .cornerRadius(5)
    }
}
