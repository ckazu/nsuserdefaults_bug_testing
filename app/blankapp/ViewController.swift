//
//  ViewController.swift
//  blankapp
//
//  Created by ckazu on 2017/06/26.
//  Copyright © 2017年 ckazu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let random_number = arc4random() % 1000000

        if UserDefaults.standard.object(forKey: "random_number") != nil {
            label.text = "hit!\n"
                + String(random_number) + "\n"
                + UserDefaults.standard.string(forKey: "random_number")!
        } else {
            label.text = String(random_number)
        }
        UserDefaults.standard.set(random_number, forKey: "random_number")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

