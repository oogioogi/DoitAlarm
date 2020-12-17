//
//  CoreDatas+CoreDataProperties.swift
//  DoitAlarm
//
//  Created by 이용석 on 2020/12/17.
//
//

import Foundation
import CoreData


extension CoreDatas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDatas> {
        return NSFetchRequest<CoreDatas>(entityName: "CoreDatas")
    }

    @NSManaged public var targetImage: Data?
    @NSManaged public var targetTitle: String?
    @NSManaged public var targetPlace: String?
    @NSManaged public var targetAlarm: Date?
    @NSManaged public var targetRepeat: Int16

}

extension CoreDatas : Identifiable {

}
