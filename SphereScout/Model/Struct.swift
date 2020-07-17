//
//  Struct.swift
//  SphereScout
//
//  Created by Samet Aslan on 10/07/2020.
//  Copyright © 2020 Samet Aslan. All rights reserved.
//

import Foundation

public struct Domain : Codable, Identifiable{

    public var id : UUID
    public var domainName : String
    public var domainAv : Bool
    
    init(domainName : String, domainAv : Bool ) {
        self.id = UUID()
        self.domainName = domainName
        self.domainAv = domainAv
    }
    
    
    
}
