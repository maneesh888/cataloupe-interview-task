//
//  UserList+CoreDataProperties.swift
//  InterviewTask
//
//  Created by Maneesh M on 08/12/22.
//
//

import Foundation
import CoreData


extension UserList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserList> {
        return NSFetchRequest<UserList>(entityName: "UserList")
    }

    @NSManaged public var results: NSOrderedSet?

}

// MARK: Generated accessors for results
extension UserList {

    @objc(insertObject:inResultsAtIndex:)
    @NSManaged public func insertIntoResults(_ value: User, at idx: Int)

    @objc(removeObjectFromResultsAtIndex:)
    @NSManaged public func removeFromResults(at idx: Int)

    @objc(insertResults:atIndexes:)
    @NSManaged public func insertIntoResults(_ values: [User], at indexes: NSIndexSet)

    @objc(removeResultsAtIndexes:)
    @NSManaged public func removeFromResults(at indexes: NSIndexSet)

    @objc(replaceObjectInResultsAtIndex:withObject:)
    @NSManaged public func replaceResults(at idx: Int, with value: User)

    @objc(replaceResultsAtIndexes:withResults:)
    @NSManaged public func replaceResults(at indexes: NSIndexSet, with values: [User])

    @objc(addResultsObject:)
    @NSManaged public func addToResults(_ value: User)

    @objc(removeResultsObject:)
    @NSManaged public func removeFromResults(_ value: User)

    @objc(addResults:)
    @NSManaged public func addToResults(_ values: NSOrderedSet)

    @objc(removeResults:)
    @NSManaged public func removeFromResults(_ values: NSOrderedSet)

}

extension UserList : Identifiable {

}
