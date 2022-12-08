//
//  CoreDataManager.swift
//  InterviewTask
//
//  Created by Maneesh M on 08/12/22.
//

import Foundation
import CoreData

class CoreDataManager{
    
    private init(){ }
    public static var shared:CoreDataManager = CoreDataManager()
    
    func getContext() -> NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    // MARK: - Core Data stack
    
    var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        
        let container = NSPersistentContainer(name: "InterviewTask")
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
                print("DB SAVE ERROR -\(error.localizedDescription ?? "NO Error Description")")

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
                print("DB SAVE ERROR -\(nserror.localizedDescription )")
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                
            }
        }
    }
   
    @discardableResult func deleteAllData(entity: String)->Bool
    {
        
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        
        do
        {
            let results = try CoreDataManager.shared.getContext().fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                CoreDataManager.shared.getContext().delete(managedObjectData)
                
            }
            return true
        } catch let error as NSError {
            print("Detele all data in \(entity) error : \(error) \(error.userInfo)")
            return false
        }
    }
}

