//
//  CoreDataManager.swift
//  iOS_Music_Player
//
//  Created by ho.bao.an on 15/03/2024.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager() // Singleton instance
    
    private init() {} // Private initializer to prevent multiple instances
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NoteCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
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
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Fetch data
    
    func fetchData() -> [SongCoreData] {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<SongCoreData> = SongCoreData.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Fetch failed: \(error.localizedDescription)")
            return []
        }
    }
    
    // MARK: - Add data
    
    func addData(nameSinger: String, nameSong: String) {
        let context = persistentContainer.viewContext
        if let newNote = NSEntityDescription.insertNewObject(forEntityName: "SongCoreData", into: context) as? SongCoreData {
            newNote.nameSinger = nameSinger
            newNote.nameSong = nameSong
            saveContext()
            print("Save data to CoreData success")
        }
    }
    
    // MARK: - Add data
    
    func deleteData(_ song: SongCoreData) {
        let context = persistentContainer.viewContext
        context.delete(song)
        saveContext()
        print("Delete data to CoreData success")
    }
}


