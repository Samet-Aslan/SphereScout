//
//  Model.swift
//  SphereScout
//
//  Created by Samet Aslan on 10/07/2020.
//  Copyright © 2020 Samet Aslan. All rights reserved.
//

import Foundation

fileprivate class ModelSingleton {
    
static let sharedInstance = ModelSingleton()
}

class Model : NSObject{
    
    fileprivate let model = ModelSingleton.sharedInstance
    
}
