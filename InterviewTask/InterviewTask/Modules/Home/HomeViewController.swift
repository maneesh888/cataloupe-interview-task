//
//  HomeViewController.swift
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func didTapOnlineListButton(_ sender: Any) {
        if let url = textView.text,  let vc = VCFactory.getListViewController(fetchType: .online, URLString: url) {
            show(vc, sender: self)
        }
    }
    
    @IBAction func didTapOfflineListButton(_ sender: Any) {
        if let vc = VCFactory.getListViewController(fetchType: .mock) {
            show(vc, sender: self)
        }
    }
    
    @IBAction func didTapClearCacheButton(_ sender: Any) {
        CoreDataManager.shared.deleteAllData(entity: "UserList")
    }
}
