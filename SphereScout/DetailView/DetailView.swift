//
//  DetailView.swift
//  SphereScout
//
//  Created by Samet Aslan on 14/07/2020.
//  Copyright © 2020 Samet Aslan. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var fetch = FetchDomain()
    @State var isToggle = false
    var item : DomainListItem
    
    var body: some View {
        NavigationView{
            VStack{
                Text(item.dn ?? "nil").font(.title)
                 VStack{
                    Text("Seite ist \(item.da ?? "nil")")
                    Spacer().frame(width: 50, height: 50)
                        Button(action: {
                            self.fetch.startToFetch(dn: (self.item.dn?.lowercased()) as! String, completed: { print("Fetch complete")})
                            self.isToggle = true
                         }){
                            Text("Überprüfen")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.system(size: 18))
                            .padding()
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black, lineWidth: 2))
                         }
                }
                VStack{
                    if(isToggle){
                        Text("\(self.fetch.results?.DomainInfo.domainAvailability ?? "Überprüfe...")")
                    }
                }
            }
            
        }.navigationBarTitle("\(item.dn ?? "nil")")

    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
           Text("Test")
        }
    }
}
