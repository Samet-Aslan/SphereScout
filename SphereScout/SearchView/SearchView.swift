//
//  SearchView.swift
//  SphereScout
//
//  Created by Samet Aslan on 10/07/2020.
//  Copyright © 2020 Samet Aslan. All rights reserved.
//

import SwiftUI
import Combine

struct SearchView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: DomainListItem.getAllDomains()) var domainListItems : FetchedResults<DomainListItem>
    
    @ObservedObject var fetch = FetchDomain()
    
    @State private var domainname: String = ""
    @State private var isToggled = false
    @State public var showAlert = false
    
    var body: some View {
        
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(){
                LottieView(filename: "astronaut").frame(width: 200, height: 200)
                Text("SphereScout").font(.title).foregroundColor(Color.white)
                TextField("Domain eingeben", text: $domainname)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 32)).background(Color.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth:1))
                
                Spacer().frame(width: 50, height: 50)
                Button(action: {
                    if(UserDefaults.standard.bool(forKey: "autoFav")){
                        DispatchQueue.main.async {
                            self.fetch.startToFetch(dn: self.domainname.lowercased(), completed: {
                                self.saveAsFav()
                            })
                        }
                    }
                    self.fetch.startToFetch(dn: self.domainname.lowercased(), completed: { self.isToggled = true })
                        
                })
                {
                    Text("Search")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.system(size: 18))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white, lineWidth: 2))
                }
            }
            .sheet(isPresented: $isToggled, content: {
                    if(self.fetch.results?.DomainInfo.domainAvailability == "UNAVAILABLE"){
                        Group{
                            LottieView(filename: "cross").frame(width: 300, height: 300)
                            Text("Die Domain").font(.system(size: 20))
                            Text("\((self.fetch.results?.DomainInfo.domainName.lowercased())!)").font(.system(size: 30)).bold()
                            Text("ist bereits vergeben!").font(.system(size: 20))
                                
                        }
                    }
                    else if(self.fetch.results?.DomainInfo.domainAvailability == "AVAILABLE"){
                        Group{
                            VStack{
                                LottieView(filename: "check").frame(width: 300, height: 300)
                                Text("Die Domain").font(.system(size: 20))
                                Text("\((self.fetch.results?.DomainInfo.domainName)!)").font(.system(size: 30)).bold()
                                Text("ist verfügbar!").font(.system(size: 20))
                                    .onAppear{
                                        self.isToggled = true
                                    }
                            }
                        }
                    }
                    else if(self.fetch.results?.DomainInfo.domainAvailability == "no"){
                        Group{
                            VStack{
                                LottieView(filename: "question").frame(width: 300, height: 300)
                                Text("Diese Domain existiert nicht.").font(.system(size: 20))
                            }
                        }
                    }
                
                    Spacer()
                           .frame(height: 50)
                            
                    HStack{
                        if(!UserDefaults.standard.bool(forKey: "autoFav")){
                            Button(action: {
                                self.saveAsFav()
                                self.showAlert = true
                            })
                            {
                                Text("Favorisieren")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 18))
                                .padding()
                                .foregroundColor(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black, lineWidth: 1))
                            }
                            .alert(isPresented: self.$showAlert){
                                Alert(title: Text("Erfolgreich"), message: Text("Die Domain wurde erfolgreich den Favoriten hinzugefügt"), dismissButton: .default(Text("OK")))
                            }
                            Button(action: {
                                self.isToggled = false
                            })
                            {
                                Text("Schließen")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 18))
                                .padding()
                                .foregroundColor(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black, lineWidth: 1))
                            }
                        }
                        else{
                            
                            VStack{
                                Text("Die Domain wurde dem Favoriten hinzugefügt")
                                Button(action: {
                                    self.isToggled = false
                                }){
                                    Text("Schließen")
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .font(.system(size: 18))
                                    .padding()
                                    .foregroundColor(.black)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.black, lineWidth: 1))
                                    
                                }
                            }
                            
                        }
                    }
            })
        }
    }

    func saveAsFav(){
        let myDomainListItem = DomainListItem(context: self.managedObjectContext)
        myDomainListItem.id = UUID()
        myDomainListItem.dn = self.fetch.results?.DomainInfo.domainName
        myDomainListItem.da = self.fetch.results?.DomainInfo.domainAvailability
        do{
            try self.managedObjectContext.save()
        }catch{
            print(error)
        }
    }
    
    struct SearchView_Previews: PreviewProvider {
        static var previews: some View {
            SearchView()
        }
    }
}
