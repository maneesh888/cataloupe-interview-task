//
//  Picture+CoreDataProperties.swift
//  InterviewTask
//
//  Created by Maneesh M on 08/12/22.
//
//

import Foundation
import CoreData


extension Picture {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Picture> {
        return NSFetchRequest<Picture>(entityName: "Picture")
    }

    @NSManaged public var large: String?
    @NSManaged public var medium: String?
    @NSManaged public var thumbnail: String?

}

extension Picture : Identifiable {

}
