//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Samuele Mattiuzzo on 18/01/2017.
//  Copyright © 2017 Samuele Mattiuzzo. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func close() {
        dismiss(animated: true, completion: nil);
    }

}
