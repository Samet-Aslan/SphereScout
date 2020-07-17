//
//  FetchDomain.swift
//  SphereScout
//
//  Created by Samet Aslan on 10/07/2020.
//  Copyright © 2020 Samet Aslan. All rights reserved.
//

import Foundation

class FetchDomain : ObservableObject{
    @Published var results : DomainInfo?
    typealias FinishedFetch = () -> ()
    
    func startToFetch(dn : String, completed: @escaping FinishedFetch){
    
        guard let url = URL(string: "https://domain-availability.whoisxmlapi.com/api/v1?apiKey=at_DreDeFhd4ifkzgPVGePm81a9B3Set&domainName=" + dn + "&outputFormat=json&mode=DNS_AND_WHOIS") else { return }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let data = data {
                    let decodedData = try JSONDecoder().decode(DomainInfo.self, from: data)
                    DispatchQueue.main.async {
                        self.results = decodedData
                        completed()
                    }
                } else {
                    print("No data")
                }
            }catch{
                print(error)
                self.results = DomainInfo.init(DomainInfo: Domain.init(domainAvailability: "no", domainName: "no"))
            }
        }.resume()
        
        
    
    }
}
