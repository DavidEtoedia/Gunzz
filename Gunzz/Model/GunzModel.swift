//
//  GunzModel.swift
//  Gunzz
//
//  Created by Inyene Etoedia on 18/10/2023.
//

import Foundation

struct GunzModel: Identifiable {
    let id = UUID()
    var name: String
    var title: String
    var cost: String
    var accuracy: CGFloat
    var range: CGFloat
    var stability: CGFloat
    var damage: CGFloat
}

let gunzzModel: [GunzModel] = [

    GunzModel(name: "handGun.scn", title: "Wingun-702", cost: "30,000", accuracy: 0.7, range: 0.1, stability: 0.6, damage: 0.3),
    GunzModel(name: "gold_gun.scn", title: "Gold Revolver", cost: "40,000", accuracy: 0.3, range: 0.7, stability: 0.3, damage: 0.2),
    GunzModel(name: "revolver.scn", title: "Survival Revolver", cost: "50,000", accuracy: 0.6, range: 0.3, stability: 0.4, damage: 0.5),
    GunzModel(name: "dessert.scn", title: "Desert Eagle", cost: "90,000", accuracy: 0.8, range: 0.7, stability: 0.7, damage: 0.5),
]


extension GunzModel {
    static func model() -> GunzModel {
        return GunzModel(name: "handGun.scn", title: "", cost: "30,000", accuracy: 0.2, range: 0.1, stability: 0.3, damage: 0.4)

    }
}
