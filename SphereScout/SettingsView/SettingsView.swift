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
            Section{
                Text("General").bold()
                
                Toggle(isOn: $userDefaultsManager.isToggle){
                    Text("Auto-Add to Favourites")
                }
            }
            
            Section{
                Text("Domain Endings").bold()
                
                Toggle(isOn: $userDefaultsManager.isCom){
                    Text(".com")
                }
                              
                Toggle(isOn: $userDefaultsManager.isNet){
                    Text(".net")
                }
                     
                Toggle(isOn: $userDefaultsManager.isIo){
                    Text(".io")
                }
                     
                Toggle(isOn: $userDefaultsManager.isUs){
                    Text(".us")
                }
                     
                Toggle(isOn: $userDefaultsManager.isOrg){
                    Text(".org")
                }
                     
                Toggle(isOn: $userDefaultsManager.isBiz){
                    Text(".biz")
                }
                     
                Toggle(isOn: $userDefaultsManager.isUk){
                    Text(".uk")
                }
                
                
                
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
