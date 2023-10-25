//
//  GunView.swift
//  Gunzz
//
//  Created by Inyene Etoedia on 18/10/2023.
//

import SwiftUI

struct GunViews: View {
    @State private var pageIndex = 0
    @State private var loading = false
    var otherColor = #colorLiteral(red: 0.3500443101, green: 0.3373158872, blue: 0.2306360006, alpha: 1)
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(otherColor), Color.black]),
                startPoint: .topTrailing,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            VStack {
                HStack(alignment: .top) {
                    
                    Image("points")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(15)
                        .background{
                            Rectangle()
                                .foregroundColor(.yellow)
                        }
                    
                    Spacer()
                        .frame(width: 20)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(gunzzModel[pageIndex].title)
                                .font(.custom(.usFont, size: 24))
                            .foregroundColor(.white)
                            
                            Spacer()
                            Image("dollar")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 20, height: 20)
                            Text(gunzzModel[pageIndex].cost)
                                .font(.custom(.usFont, size: 20))
                                .foregroundColor(.white)
                        }
                        
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                            .font(.custom(.futura, size: 12))
                            .foregroundColor(.white.opacity(0.7))
                            .padding(.trailing, 30)
                        
                    }
                    
                }
                .padding(.horizontal, 20)
             
                TabView (selection: $pageIndex){
                        ForEach(gunzzModel.indices, id: \.self) { index in
                            
                            Gunzs(guns: gunzzModel[index])
                                .tag(index)
                                .contentShape(Rectangle()).gesture(DragGesture())

                            
                        }
                    }
                .frame(height: 300)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.spring(response: 0.7, dampingFraction: 0.7, blendDuration: 0.25), value: pageIndex)
 
            
            
                
                HStack {
                    
                    Button {
                        
                        if pageIndex > 0 {
                            pageIndex -= 1
                        }
                    } label: {
                        Image(systemName: "arrow.backward.circle.fill")
                            .font(.system(size: 35))
                            .foregroundColor(pageIndex == 0 ?.yellow.opacity(0.2) : .yellow)
                        
                    }
                    .disabled(pageIndex == 0)
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.spring(response: 0.7, dampingFraction: 0.7)) {
                            if pageIndex < gunzzModel.count - 1 {
                                pageIndex += 1
                            }
                        }
                    } label: {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.system(size: 35))
                            .foregroundColor(
                                pageIndex == gunzzModel.count - 1 ? .yellow.opacity(0.2) :
                                .yellow)
                        
                    }
                    .disabled(pageIndex == gunzzModel.count - 1)
                    
                  
                }
                .padding(.horizontal, 50)
                
                Spacer()
                    .frame(height: 50)
                
                Text("Combat Rating:")
                    .font(.custom(.usFont, size: 30))
                    .foregroundColor(.white.opacity(0.6))
                Spacer()
                    .frame(height: 20)
                Ratings(accuracy: !loading ? 0.0 : gunzzModel[pageIndex].accuracy, damage: !loading ? 0.0 : gunzzModel[pageIndex].damage, stability: !loading ? 0.0 : gunzzModel[pageIndex].stability, reloadSpeed: !loading ? 0.0 : gunzzModel[pageIndex].range)
                    .padding(.horizontal, 20)
                    .animation(.spring(response: 0.6, dampingFraction: 0.6), value: !loading ? Int(0.0) : pageIndex)
                    .onAppear{
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.6).delay(0.4)) {
                            loading = true
                            
                        }
                    }
                    
                
                Spacer()
                    
            }
           
        }
          

       
    }
}





struct GunView_Previews: PreviewProvider {
    static var previews: some View {
        GunViews()
    }
}
