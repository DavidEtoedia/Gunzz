//
//  ContentView.swift
//  Gunzz
//
//  Created by Inyene Etoedia on 12/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }

//    init(){
//    for family in UIFont.familyNames {
//    print(family)
//
//    for names in UIFont.fontNames(forFamilyName: family){
//    print("== \(names)")
//    }
//    }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
