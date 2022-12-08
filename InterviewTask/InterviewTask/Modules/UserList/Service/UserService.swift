//
//  UserService.swift
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

import Foundation

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
            fetchMockData(successCompletion, error: errorCompletion)
        case .online:
            fetchOnline(successCompletion, error: errorCompletion)
        case .offline:
            fetchMockData(successCompletion, error: errorCompletion)
        }
        
        
    }
    
    private func fetchOnline(_ successCompletion: (([ListViewItem]?) -> Void)!, error errorCompletion: ((Error?) -> Void)!) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
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
        
        
    }
    
}

