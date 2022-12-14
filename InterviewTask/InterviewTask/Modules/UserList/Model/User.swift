//
//  User.swift
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

import Foundation


// MARK: - UserList
@objc class UserListServerModel:NSObject, Decodable {
    let results: [UserServerModel]?
    //let info: Info?
}

// MARK: - User
@objc class UserServerModel: NSObject, Decodable {
    var name: NameData?
    var email: String?
    let dob, registered: DateData?
    let id: ID?
    let picture: PictureServerModel?
    let nat: String?
    
    
}

// MARK: - Dob
struct DateData: Decodable {
    let date: String?
    let age: Int?
}

// MARK: - ID
struct ID: Decodable {
    let name, value: String?
}

// MARK: - Name
struct NameData: Decodable {
    let title, first, last: String?
}

// MARK: - Picture
struct PictureServerModel: Decodable {
    let large, medium, thumbnail: String?
}






@objc extension UserServerModel: ListViewItem {

    var cellType: UnsafeMutablePointer<ListViewCellType>! {
        return UnsafeMutablePointer<ListViewCellType>.init(bitPattern: ListViewCellType.user.rawValue)
    }

    var displayName: String! {
        let title = name?.title ?? ""
        let first = name?.first ?? ""
        let last = name?.last ?? ""
        return title + "." + first + " " + last
    }

    var country: String! {
        guard let code = nat else {return ""}
        return LocaleUtililty.countryName(countryCode: code)
    }

    var imageUrl: String! {
        return picture?.thumbnail ?? ""
    }
}



