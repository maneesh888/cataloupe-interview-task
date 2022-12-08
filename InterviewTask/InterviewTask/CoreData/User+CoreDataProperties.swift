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
    @NSManaged public var nat: String?

}

extension User : Identifiable {

}

@objc extension User: ListViewItem {

   public var cellType: UnsafeMutablePointer<ListViewCellType>! {
        return UnsafeMutablePointer<ListViewCellType>.init(bitPattern: ListViewCellType.user.rawValue)
    }

   public var displayName: String! {
       let title = self.title ?? ""
       let first = self.firstName ?? ""
       let last = self.lastName ?? ""
        return title + "." + first + " " + last
    }

   public var country: String! {
        guard let code = nat else {return ""}
        return LocaleUtililty.countryName(countryCode: code)
    }

   public var imageUrl: String! {
        return picture?.thumbnail ?? ""
    }
}
