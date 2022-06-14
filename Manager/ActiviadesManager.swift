//
//  ActiviadesManager.swift
//  Integrador_iOS
//
//  Created by training on 09-06-22.
//

import Foundation
class ActividadesManager{
    var activiadesArr = [Activiades(nombreActiviad: "Education", typeActividad: "education"),
                         Activiades(nombreActiviad: "Recreational", typeActividad: "recreational"),
                         Activiades(nombreActiviad: "Social", typeActividad: "social"),
                         Activiades(nombreActiviad: "Diy", typeActividad: "diy"),
                         Activiades(nombreActiviad: "Charity", typeActividad: "charity"),
                         Activiades(nombreActiviad: "Cooking", typeActividad: "cooking"),
                         Activiades(nombreActiviad: "Relaxation", typeActividad: "relaxation"),
                         Activiades(nombreActiviad: "Music", typeActividad: "music"),
                         Activiades(nombreActiviad: "Busywork", typeActividad: "busywork")
    ]

    static let shared = ActividadesManager()
    
}
