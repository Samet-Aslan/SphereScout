//
//  UserDefaultsManager.swift
//  SphereScout
//
//  Created by Samet Aslan on 17/07/2020.
//  Copyright © 2020 Samet Aslan. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class UserDefaultsManager: ObservableObject {
    @Published var isToggle: Bool = UserDefaults.standard.bool(forKey: "autoFav") {
        didSet { UserDefaults.standard.set(self.isToggle, forKey: "autoFav") }
    }
    
    @Published var isDe: Bool = UserDefaults.standard.bool(forKey: "isDe") {
           didSet { UserDefaults.standard.set(self.isToggle, forKey: "isDe") }
    }
    
    @Published var isAt: Bool = UserDefaults.standard.bool(forKey: "isAt") {
              didSet { UserDefaults.standard.set(self.isToggle, forKey: "isAt") }
    }
    
    @Published var isCom: Bool = UserDefaults.standard.bool(forKey: "isCom") {
              didSet { UserDefaults.standard.set(self.isToggle, forKey: "isCom") }
    }
    
    @Published var isOrg: Bool = UserDefaults.standard.bool(forKey: "isOrg") {
              didSet { UserDefaults.standard.set(self.isToggle, forKey: "isOrg") }
    }
    
    @Published var isNet: Bool = UserDefaults.standard.bool(forKey: "isNet") {
              didSet { UserDefaults.standard.set(self.isToggle, forKey: "isNet") }
    }
    
    @Published var isIo: Bool = UserDefaults.standard.bool(forKey: "isIo") {
              didSet { UserDefaults.standard.set(self.isToggle, forKey: "isIo") }
    }
    
    @Published var isBiz: Bool = UserDefaults.standard.bool(forKey: "isBiz") {
              didSet { UserDefaults.standard.set(self.isToggle, forKey: "isBiz") }
    }
    
    @Published var isUk: Bool = UserDefaults.standard.bool(forKey: "isUk") {
              didSet { UserDefaults.standard.set(self.isToggle, forKey: "isUk") }
    }
    
    @Published var isUs: Bool = UserDefaults.standard.bool(forKey: "isUs") {
              didSet { UserDefaults.standard.set(self.isToggle, forKey: "isUs") }
    }
}
