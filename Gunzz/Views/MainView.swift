//
//  MainView.swift
//  Gunzz
//
//  Created by Inyene Etoedia on 12/10/2023.
//

import SwiftUI
import SceneKit

struct MainView: View {
    @State var showGuns: Bool = false
    @State var bullets: Int = 0
    @State var timer: Timer? = nil
    @State private var isPulsating = false
    var body: some View {
        ZStack {
            
            if showGuns {
                GunViews()
            }
            
            ZStack {
                Image("splash")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack (spacing: 20){
                    HStack {
                        ForEach(0..<bullets, id: \.self ) { index in
                            Image("bullets")
                                .resizable()
                                .frame(width: 10, height: 50)
                                .offset(x: index <= bullets ? 0 : 50)
                                 .opacity(index <= bullets ? 1 : 0)
                        }
                       Spacer()
                    }
                    
                    Text("Loading...")
                        .font(.custom(.usFont, size: 20))
                        .foregroundColor(.white)
                        .opacity(bullets > 3 ? 1 : 0)
                        .opacity(isPulsating ? 0.5 : 1.0)
                   
                }
                .offset(y: 300)
                .padding()
                .onAppear{
                    timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
                        
                        withAnimation {
                            isPulsating.toggle()
                        }
                     
                        if bullets < 20 {
                            bullets += 1
                        }
                        else{
                            timer.invalidate()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                withAnimation(.spring()){
                                    showGuns = true
                                }
                                
                            }
                            
                        }
                        
                    }
            }
            }
            .scaleEffect(showGuns ? 5 : 1)
            .opacity(showGuns ? 0 : 1)
            
        }
       
        
    }
    
    

    

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
