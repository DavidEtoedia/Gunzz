//
//  CustomSceneView.swift
//  Gunzz
//
//  Created by Inyene Etoedia on 12/10/2023.
//

import SwiftUI
import SceneKit

struct CustomSceneView: UIViewRepresentable {
    @Binding var scene: SCNScene?
    
    func makeUIView(context: Context) ->  SCNView {
        
        let view = SCNView()
        view.allowsCameraControl = false
        view.contentScaleFactor = 4.3
        view.contentMode = .scaleAspectFill
        view.autoenablesDefaultLighting = true
        view.antialiasingMode = .multisampling2X
        view.backgroundColor = .clear
        view.scene = scene
        
        return view
    
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        
    }
   
}

struct CustomSceneView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSceneView(scene: .constant(SCNScene(named: "custom_gun.scn")))
    }
}
