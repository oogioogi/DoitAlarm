//
//  CoreDatas+CoreDataProperties.swift
//  DoitAlarm
//
//  Created by 이용석 on 2020/12/18.
//
//

import Foundation
import CoreData


extension CoreDatas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDatas> {
        return NSFetchRequest<CoreDatas>(entityName: "CoreDatas")
    }

    @NSManaged public var targetAlarm: Date?
    @NSManaged public var targetImage: Data?
    @NSManaged public var targetPlace: String?
    @NSManaged public var targetRepeat: Int16
    @NSManaged public var targetTitle: String?
    @NSManaged public var id: Int64

}

extension CoreDatas : Identifiable {

}
