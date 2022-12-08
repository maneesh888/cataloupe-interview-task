//
//  User+CoreDataProperties.swift
//  InterviewTask
//
//  Created by Maneesh M on 08/12/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var title: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var age: Int64
    @NSManaged public var dob: Date?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var picture: Picture?

}

extension User : Identifiable {

}
