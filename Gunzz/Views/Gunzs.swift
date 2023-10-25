//
//  Gunzs.swift
//  Gunzz
//
//  Created by Inyene Etoedia on 18/10/2023.
//

import SwiftUI
import SceneKit

struct Gunzs: View {
    var guns: GunzModel
     @State private var scene: SCNScene? = nil
     @GestureState private var dragState: CGFloat = .zero

     init(guns: GunzModel) {
         self.guns = guns
         self._scene = State(initialValue: SCNScene(named: guns.name))
     }
    var body: some View {
        CustomSceneView(scene: $scene)
            .frame(height: 350)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        scene?.rootNode.eulerAngles.y = Float((value.translation.width * .pi) / 180)
                        
                    })
                    .onEnded({ value in
                        onDrag(animate: dragState == .zero)
                    })
            )
        
    }
    
    
    
    
    func onDrag(animate: Bool = false ){
        
        if animate {
            SCNTransaction.begin()
          SCNTransaction.animationDuration = 0.4
        }
        
        scene?.rootNode.eulerAngles.y = 0
        
        if animate {
           SCNTransaction.commit()
        }
    }
}

struct Gunzs_Previews: PreviewProvider {
    static var previews: some View {
        Gunzs(guns: .model())
    }
}
