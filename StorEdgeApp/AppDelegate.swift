//
//  AppDelegate.swift
//  StorEdgeApp
//
//  Created by admin on 21/07/23.
//

import UIKit
import CoreData
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        deletePersistentStore()
        application.statusBarStyle = .default
        //RunLoop.current.run(until: Date(timeIntervalSinceNow: 1.0))
//        resetPersistentStore()

        // Customize the appearance of the navigation bar
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.tintColor = .orange
        // Set the text color to orange
        let textAttributes: [NSAttributedString.Key: Any] = [ .foregroundColor: UIColor.orange,// Set the text color to orange
            .font: UIFont.boldSystemFont(ofSize: 17.0)
        // Set the font to bold
        ]
        navigationBarAppearance.titleTextAttributes = textAttributes
        navigationBarAppearance.largeTitleTextAttributes = textAttributes
        
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { granted, error in
            print(granted)
        }
        
        return true
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "testNotification" {
            self.window?.rootViewController?.view.backgroundColor = .red
            print("received notification")
        }
        completionHandler()
    }
    
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "StorEdgeApp")
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
    
//    func resetPersistentStore() {
//        let persistentContainer = self.persistentContainer
//        do { try persistentContainer.persistentStoreCoordinator.destroyPersistentStore(at: persistentContainer.persistentStoreCoordinator.persistentStores.first!.url!, ofType: NSSQLiteStoreType, options: nil) // Reset the persistent container to release the old store
//        persistentContainer.viewContext.reset()
//        // Re-create the persistent store (this will use the updated data model)
//        try
//            persistentContainer.persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: persistentContainer.persistentStoreCoordinator.persistentStores.first!.url!, options: nil)
//            print("Persistent store reset successfully.")
//
//        }
//        catch { print("Error resetting persistent store: \(error)") } }
    

    func deletePersistentStore() {
    let persistentContainer = self.persistentContainer

    do {
    // Get all the entities in your Core Data model.
        if let entities=persistentContainer.managedObjectModel.entities ?? nil {
    for entity in entities {
    // Create a fetch request for the current entity.
        let fetchRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity.name ?? "")
    let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

    // Perform the batch delete request.
    try persistentContainer.persistentStoreCoordinator.execute(batchDeleteRequest, with: persistentContainer.viewContext)
    }
    }

    // Save the context to persist the deletion.
    try persistentContainer.viewContext.save()

    print("Data in the persistent store deleted successfully.")
    } catch {
    print("Error deleting data from the persistent store: \(error)")
    }
    }

    // ...

}

