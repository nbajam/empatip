//
//  SettingsViewController.swift
//  empatip
//
//  Created by Nageshwar Bajamahal on 3/9/17.
//  Copyright © 2017 Nageshwar Bajamahal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    let defaults = UserDefaults.standard;

    @IBAction func onTap(_ sender: AnyObject) {
        
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTipPercent")
        defaults.synchronize()
        //print("settings onTap index = %d",defaultTipControl.selectedSegmentIndex)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        defaultTipControl.selectedSegmentIndex =
        defaults.integer(forKey: "defaultTipPercent")
        
        //print("settings Load index= %d",
        //    defaults.integer(forKey: "defaultTipPercent"))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
