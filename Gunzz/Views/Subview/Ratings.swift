//
//  Ratings.swift
//  Gunzz
//
//  Created by Inyene Etoedia on 17/10/2023.
//

import SwiftUI

struct Ratings: View {
    @State var offset: CGSize = .zero
    var accuracy: CGFloat
    var damage: CGFloat
    var stability: CGFloat
    var reloadSpeed: CGFloat
    var body: some View {
        VStack(alignment:.leading){
            Group {
                HStack {
                    Text("Accuracy")
                        .font(.custom(.usFont, size: 15))
                    .foregroundColor(.white.opacity(0.7))
                    Spacer()
                    
                    HStack(spacing: 0) {
                        Text("\((accuracy * 100).formatValue(decimalPlaces: 0))")
                              .font(.custom(.usFont, size: 15))
                              .foregroundColor(
                                
                                Float( (accuracy * 100).formatValue(decimalPlaces: 0))! < 50 ? .red :
                                        .green
                                
                              )
                        
                        Text("/100")
                              .font(.custom(.usFont, size: 15))
                          .foregroundColor(.white.opacity(0.9))
                    }

                }
                Progressbar(value: accuracy)
            }
            Spacer()
                .frame(height: 20)
            Group {
                HStack {
                    Text("Damage")
                          .font(.custom(.usFont, size: 15))
                      .foregroundColor(.white.opacity(0.7))
                    Spacer()
                    HStack(spacing: 0) {
                        Text("\((damage * 100).formatValue(decimalPlaces: 0))")
                              .font(.custom(.usFont, size: 15))
                              .foregroundColor(
                                
                                Float( (damage * 100).formatValue(decimalPlaces: 0))! < 50 ? .red :
                                        .green
                                
                              )
                        
                        Text("/100")
                              .font(.custom(.usFont, size: 15))
                          .foregroundColor(.white.opacity(0.9))
                    }
                }
                Spacer()
                    .frame(height: 7)
                Progressbar(value: damage)
            }
       
           
            Spacer()
                .frame(height: 20)
            Group {
                HStack {
                    Text("Stability")
                          .font(.custom(.usFont, size: 15))
                      .foregroundColor(.white.opacity(0.7))
                    Spacer()
                    HStack(spacing: 0) {
                        Text("\((stability * 100).formatValue(decimalPlaces: 0))")
                            .font(.custom(.usFont, size: 15))
                            .foregroundColor(
                                
                                Float( (stability * 100).formatValue(decimalPlaces: 0))! < 50 ? .red :
                                        .green
                                
                            )
                        
                        Text("/100")
                            .font(.custom(.usFont, size: 15))
                            .foregroundColor(.white.opacity(0.9))
                    }
                }
            }
          
            Progressbar(value: stability)
            Spacer()
                .frame(height: 20)
            
            
            HStack {
                Text("Reload Speed")
                      .font(.custom(.usFont, size: 15))
                  .foregroundColor(.white.opacity(0.7))
                
                Spacer()
                HStack(spacing: 0) {
                    Text("\((reloadSpeed * 100).formatValue(decimalPlaces: 0))")
                        .font(.custom(.usFont, size: 15))
                        .foregroundColor(
                            
                            Float( (reloadSpeed * 100).formatValue(decimalPlaces: 0))! < 50 ? .red :
                                    .green
                            
                        )
                    
                    Text("/100")
                        .font(.custom(.usFont, size: 15))
                        .foregroundColor(.white.opacity(0.9))
                }
            }
            Progressbar(value: reloadSpeed)
            }
          
//            .padding()
            .rotation3DEffect(offsetAngle(true), axis: (x: -1, y: 0, z: 0))
            .rotation3DEffect(offsetAngle(), axis: (x: 0, y: 3, z: 0))
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        offset = value.translation
                    })
                    .onEnded({ value in
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.3, blendDuration: 0.3)){
                            offset = .zero
                        }
                    })
                
            )
    }
    
    //MARK: converting the offset into X,Y angles
    
    func offsetAngle(_ isVertical: Bool = false)-> Angle {
        let progress = (isVertical ? offset.height : offset.width) / (isVertical ? screenSize.height : screenSize.width)
        return .init(degrees: progress * 10)
    }
    
    var screenSize: CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
    
        return window.screen.bounds.size
    }
    
    
}

struct Ratings_Previews: PreviewProvider {
    static var previews: some View {
        Ratings(accuracy: 0.1, damage: 0.3, stability: 0.2, reloadSpeed: 0.4)
    }
}


extension Double {
    func formatValue(decimalPlaces: Int) -> String {
        let formatString = String(format: "%%.%df", decimalPlaces)
        return String(format: formatString, self)
    }
}
