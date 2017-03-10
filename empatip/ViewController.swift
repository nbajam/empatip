//
//  ViewController.swift
//  empatip
//
//  Created by Nageshwar Bajamahal on 3/8/17.
//  Copyright © 2017 Nageshwar Bajamahal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totaLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var roundTipLabel: UILabel!
    @IBOutlet weak var totalRoundTipLabel: UILabel!
    
    @IBOutlet weak var tipRoundTotalLabel: UILabel!
    @IBOutlet weak var roundTotalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    let defaults = UserDefaults.standard;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipControl.selectedSegmentIndex =
            defaults.integer(forKey: "defaultTipPercent");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.15, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex];
        let total = bill + tip;
        
        //let minTip = bill * tipPercentages[0]
        //let maxTip = bill * tipPercentages[2]
        
        let roundedTip = round(tip)
        let totalRoundedTip = bill + roundedTip;
        
        let roundedTotal = round(total)
        let roundedTotalTip = roundedTotal - bill;
        
        
        tipLabel.text = String(format: "$%.2f",tip)
        totaLabel.text = String(format: "$%.2f",total)
        
        roundTipLabel.text = String(format: "$%.2f",roundedTip);
        totalRoundTipLabel.text = String(format: "$%.2f",totalRoundedTip);
        
        tipRoundTotalLabel.text = String(format: "$%.2f",roundedTotalTip);
        roundTotalLabel.text = String(format: "$%.2f",roundedTotal);
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipControl.selectedSegmentIndex =
            defaults.integer(forKey: "defaultTipPercent");
        //print("calc view will appear %d",
        //      defaults.integer(forKey: "defaultTipPercent"))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tipControl.selectedSegmentIndex =
            defaults.integer(forKey: "defaultTipPercent");

        //print("calc view did appear %d",
        //      defaults.integer(forKey: "defaultTipPercent"))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //print("view did disappear")
    }
    
    
}

