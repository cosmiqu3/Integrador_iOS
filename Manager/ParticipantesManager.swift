//
//  ParticipantesManager.swift
//  Integrador_iOS
//
//  Created by training on 14-06-22.
//

import Foundation
class ParticipantesManager{
    var participante: Participantes? 
    
    
    static let shared = ParticipantesManager()
    
    func agregar(partici: Participantes){
        participante = partici
    }
    
}
