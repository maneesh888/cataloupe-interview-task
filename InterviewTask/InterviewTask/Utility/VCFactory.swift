//
//  VCFactory.swift
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

import Foundation
import UIKit

struct VCFactory {
    
    static func getHomeViewController() -> HomeViewController? {
        let vc: HomeViewController = HomeViewController(nibName: String(describing:HomeViewController.self), bundle: nil)
        
        return vc
    }
    
    static func getListViewController() -> ListTableViewController? {
        
        let listServiceAdaptor:ListServiceAdaptorProtocol = UserService()
        let viewModel = ListViewModel(listServiceAdaptor)
        
        let vc: ListTableViewController = ListTableViewController(nibName: String(describing:ListTableViewController.self), bundle: nil)
        vc.viewModel = viewModel
        
        return vc
    }
}


