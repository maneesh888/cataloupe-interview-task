//
//  HomeViewController.swift
//  InterviewTask
//
//  Created by Maneesh M on 07/12/22.
//

import UIKit

class HomeViewController: UIViewController {

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
        if let vc = VCFactory.getListViewController() {
            show(vc, sender: self)
        }
    }
}
