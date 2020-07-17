//
//  FavListView.swift
//  SphereScout
//
//  Created by Samet Aslan on 10/07/2020.
//  Copyright © 2020 Samet Aslan. All rights reserved.
//

import SwiftUI
import Combine

struct FavListView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: DomainListItem.getAllDomains()) var domainListItems : FetchedResults<DomainListItem>

    var body: some View {
        NavigationView{
            List{
                ForEach(domainListItems, id: \.id) { domain in
                    NavigationLink(destination: DetailView(item: domain)){
                         FavListRow(domainListItem: domain)
                    }
                }.onDelete(perform: deleteDomain)
            }.navigationBarTitle("Domains")
        }
    }
    
    func deleteDomain(at offsets: IndexSet) {
        for index in offsets {
            let domain = domainListItems[index]
            managedObjectContext.delete(domain)
        }
        do{
            try managedObjectContext.save()
        }catch {
           print(error)
        }
    }
}

struct FavListView_Previews: PreviewProvider {
    static var previews: some View {
        FavListView()
    }
}
 
