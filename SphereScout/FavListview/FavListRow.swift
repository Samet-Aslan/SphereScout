//
//  FavListRow.swift
//  SphereScout
//
//  Created by Samet Aslan on 10/07/2020.
//  Copyright © 2020 Samet Aslan. All rights reserved.
//

import SwiftUI

struct FavListRow: View {
    @State private var showingActionSheet = false
    @State var showModal : Bool = false
    let domainListItem : DomainListItem
    
    var body: some View {
        HStack {
            VStack {
                Text(domainListItem.dn ?? "nil")
                Text(domainListItem.da ?? "nil").font(.subheadline)
            }
            .onTapGesture {
                self.showingActionSheet = true
            }
        }
        .actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(title: Text("Domains verwalten"), message: Text("Wähle eine Aktion aus"), buttons: [.default(Text("\(domainListItem.dn ?? "nil") anschauen")) {
                    self.showModal = true
                    self.showingActionSheet = false
            },
            .cancel()
            ])
        }
        .sheet(isPresented: $showModal, content: { DetailView(item: self.domainListItem)})
    }
}
