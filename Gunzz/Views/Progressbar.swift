//
//  Progressbar.swift
//  Gunzz
//
//  Created by Inyene Etoedia on 17/10/2023.
//

import SwiftUI

struct Progressbar: View {
    var value: CGFloat
    var someColor = #colorLiteral(red: 0.9256662726, green: 0.9123106003, blue: 0, alpha: 1)
    var otherColor = #colorLiteral(red: 0.4936552644, green: 0.469527781, blue: 0, alpha: 1)
    var body: some View {
            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(Color(otherColor).opacity(0.3))
                        .frame(width: proxy.size.width, height: 10.5)
                    .cornerRadius(3)

                    Rectangle()
                        .foregroundColor(Color(someColor))
                        .frame(width: self.value * proxy.size.width, height: 9)

                }
            }
            .frame(height: 10)
    
    }
}

struct Progressbar_Previews: PreviewProvider {
    static var previews: some View {
        Progressbar(value: 0.3)
    }
}



extension View {
    func glow(color: Color = .green, radius: CGFloat = 20) -> some View {
        self
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
    }
}



