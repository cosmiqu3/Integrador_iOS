//
//  ActividadesResponse.swift
//  Integrador_iOS
//
//  Created by training on 13-06-22.
//

import Foundation
class ActividadesResponse: Decodable   {
    
    let activity: String?
    let accessibility: Double?
    let type: String?
    let participants: Int?
    let price: Double?
    let link: String?
    let key: String?
    
    init (activity: String,
          accessibility: Double,
          type: String,
          participants: Int,
          price: Double,
          link: String,
          key: String ) {
        
        self.activity = activity
        self.accessibility = accessibility
        self.type = type
        self.participants = participants
        self.price = price
        self.link = link
        self.key = key
        
    }
    
}
