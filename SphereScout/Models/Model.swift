//
//  Model.swift
//  SphereScout
//
//  Created by Samet Aslan on 14/07/2020.
//  Copyright © 2020 Samet Aslan. All rights reserved.
//

import Foundation
import Combine
import CoreData


public struct DomainInfo : Codable{
        var DomainInfo : Domain
}

public struct Domain: Codable{
        var domainAvailability : String
        var domainName : String
}

public class DomainListItem : NSManagedObject, Identifiable{
    @NSManaged var da : String?
    @NSManaged var dn : String?
    @NSManaged public var id : UUID?

}

extension DomainListItem{
    static func getAllDomains() -> NSFetchRequest<DomainListItem> {
        let request: NSFetchRequest<DomainListItem> = DomainListItem.fetchRequest() as! NSFetchRequest<DomainListItem>
        let sortDescriptor = NSSortDescriptor(key: "dn", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}



