//
//  SettingsView.swift
//  SphereScout
//
//  Created by Samet Aslan on 14/07/2020.
//  Copyright © 2020 Samet Aslan. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var userDefaultsManager = UserDefaultsManager()
    var body: some View {
        Form{
            Toggle(isOn: $userDefaultsManager.isToggle){
                Text("Auto-Add to Favourites")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
        .environment(\.colorScheme, .dark)
    }
}
