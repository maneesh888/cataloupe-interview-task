//
//  UserService.swift
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

import Foundation


@objc final class UserService: NSObject, ListServiceAdaptorProtocol {
    
    let urlString:String
    
    init(urlString:String) {
        self.urlString = urlString
    }
    
    func getListWithSuccess(_ successCompletion: (([ListViewItem]?) -> Void)!, error errorCompletion: ((Error?) -> Void)!) {
        
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
                let list = try decoder.decode(UserList.self, from: data)
                
                successCompletion(list.results ?? [])
            } catch {
                print(error)
                errorCompletion(error)
            }
        }.resume()
    }
    
    
    func getUserFromCache() {
        
        
    }
    
}
