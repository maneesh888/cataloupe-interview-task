//
//  UserService.swift
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

import Foundation
import CoreData

enum UserServiceFetchType {
    case mock, online, offline
}

@objc final class UserService: NSObject, ListServiceAdaptorProtocol {
    
    let urlString:String
    let fetchType:UserServiceFetchType
    
    init(fetchType:UserServiceFetchType = .online, urlString:String? = nil) {
        self.urlString = urlString ?? ""
        self.fetchType = fetchType
    }
    
    
    func getListWithSuccess(_ successCompletion: (([ListViewItem]?) -> Void)!, error errorCompletion: ((Error?) -> Void)!) {
        
        
        switch self.fetchType {
            
        case .mock:
            getUserFromCache(successCompletion, error: errorCompletion)
        case .online:
            fetchOnline(successCompletion, error: errorCompletion)
        case .offline:
            fetchMockData(successCompletion, error: errorCompletion)
        }
        
        
    }
    
    private func fetchOnline(_ successCompletion: (([ListViewItem]?) -> Void)!, error errorCompletion: ((Error?) -> Void)!) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data else {
                if let error = error {
                    errorCompletion(error)
                }
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let list = try decoder.decode(UserListServerModel.self, from: data)
                
                if let self = self {
                    self.cacheUserList(userList: list)
                }
                successCompletion(list.results ?? [])
            } catch {
                print("error:\(error)")
                errorCompletion(error)
            }
        }.resume()
    }
    private func fetchMockData(_ successCompletion: (([ListViewItem]?) -> Void)!, error errorCompletion: ((Error?) -> Void)!) {
        if let url = Bundle.main.url(forResource: "mockData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(UserListServerModel.self, from: data)
                successCompletion(jsonData.results ?? [])
            } catch {
                print("error:\(error)")
                errorCompletion(error)
            }
        }
    }
    
    
    private func getUserFromCache(_ successCompletion: (([ListViewItem]?) -> Void)!, error errorCompletion: ((Error?) -> Void)!) {
        
        // TODO: - Should remove dependency on coredata from this class
        var fetchResults:[UserList] = []
        
        let context: NSManagedObjectContext = CoreDataManager.shared.getContext()
        
        let fetchReq:NSFetchRequest<UserList> = UserList.fetchRequest()
        
        do {
            fetchResults = try context.fetch(fetchReq)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            errorCompletion(error)
        }
        print(fetchResults.first?.results?.count)
        
//        if let result = fetchResults.first?.results {
//            re
//        }
        
//        successCompletion(result)
        if let results = fetchResults.first?.results {
            successCompletion(Array(_immutableCocoaArray: results))
        }else{
            successCompletion([])
        }
        
    }
    
    private func cacheUserList(userList:UserListServerModel) {
        //TODO: - Mapping should be improved
        let context = CoreDataManager.shared.getContext()
        let results = UserList(context: context)
        for serverUser in userList.results ?? [] {
            
            let user = User(context: context)
            
            user.id = serverUser.id?.value
            user.email = serverUser.email
            user.firstName = serverUser.name?.first
            user.lastName = serverUser.name?.last
            user.title = serverUser.name?.title
            user.nat = serverUser.nat
            
            
            let picture = Picture(context: context)
            picture.thumbnail = serverUser.picture?.thumbnail
            picture.large = serverUser.picture?.large
            picture.medium = serverUser.picture?.medium
            
            user.picture = picture
            
            results.addToResults(user)
        }
        
        CoreDataManager.shared.saveContext()
    }
    
    
}

