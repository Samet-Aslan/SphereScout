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
}
