//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Lorenzo on 1/24/21.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setDateButton.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    @IBOutlet weak var setDateButton: UIButton!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
