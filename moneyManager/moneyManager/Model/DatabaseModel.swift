//
//  DatabaseModel.swift
//  moneyManager
//
//  Created by tree on 2021/5/11.
//

import Foundation
import CoreData
import UIKit

//帳本類型：主帳本/副帳本
enum Account: String {
    case main
    case secondary
}

class DatabaseModel : NSObject, NSFetchedResultsControllerDelegate {
    var payment : [Payment] = []
    var income : [Income] = []
    var fetchResultController : NSFetchedResultsController<Payment>!
    
    public func addAPayment(amount: UInt, categorize: Int, tag: Int, infomation: String) -> Bool {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let paymentToAdd = Payment(context: appDelegate.persistentContainer.viewContext)
            paymentToAdd.account = Account.main.rawValue
            paymentToAdd.categorize = 1
            paymentToAdd.tag = 1
            paymentToAdd.date = Date().getCurrentLocationDate()
            paymentToAdd.amount = String(amount)
            paymentToAdd.infomation = ""
            print("Saving data to context ...")
            appDelegate.saveContext()
        }
        return true //一筆帳新增成功
    }
    
    func fetchPayment() {
        let fetchRequest: NSFetchRequest<Payment> = Payment.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                               managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            do {
                try fetchResultController.performFetch()
                if let fetchedObjects = fetchResultController.fetchedObjects {
                    payment = fetchedObjects
                }
            } catch {
                print(error)
            }
        }
    }
    
    //MARK: - NSFetchedResultsController Delegate
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            print("insert")
        case .delete:
            print("delete")
        case .move:
            print("move")
        case .update:
            print("update")
        default:
            print("none")
        }
        if let fetchedObjects = controller.fetchedObjects {
            payment = fetchedObjects as! [Payment]
        }
    }
    
    
}
