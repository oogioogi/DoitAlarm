//
//  DataManager.swift
//  DoitAlarm
//
//  Created by 이용석 on 2020/12/17.
//

import Foundation
import CoreData

class DataManager {
    
    static var shared = DataManager()
    var coreDataList = [CoreDatas]()
    
    
    // MARK: - 코어 데이터 베이스 새로운 데이터 추가
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // 기존 코어 데이터 로딩
    func fetchMemo() {
        let request: NSFetchRequest<CoreDatas> = CoreDatas.fetchRequest()
        let sortByDateDesc = NSSortDescriptor(key: "id", ascending: false)
        request.sortDescriptors = [sortByDateDesc]
        
        do {
            coreDataList = try mainContext.fetch(request)
        } catch {
            print("\(error.localizedDescription)")
        }
        
    }
    
    // 새로운 코어 데이터 저장
    func addNewContext(id: Int64, title: String, photo: Data, place: String, alarmTime: Date, cycle: Int16) {
        
        let addCoreData = CoreDatas(context: mainContext)
        addCoreData.id = id
        addCoreData.targetTitle = title
        addCoreData.targetImage = photo
        addCoreData.targetPlace = place
        addCoreData.targetAlarm = alarmTime
        addCoreData.targetRepeat = cycle
        
        coreDataList.insert(addCoreData, at: 0)
        saveContext()
        
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "DoitAlarm")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

