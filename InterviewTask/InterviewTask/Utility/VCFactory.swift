//
//  VCFactory.swift
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

import Foundation
import UIKit

struct VCFactory {
    
    static func getListViewController() -> ListTableViewController? {
        
        let listServiceAdaptor:ListServiceAdaptorProtocol = UserService()
        let viewModel = ListViewModel(listServiceAdaptor)
        
        let vc: ListTableViewController = ListTableViewController(nibName: String(describing:ListTableViewController.self), bundle: nil)
        vc.viewModel = viewModel
        
        return vc
    }
}


