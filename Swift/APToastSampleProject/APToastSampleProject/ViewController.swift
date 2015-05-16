//
//  ViewController.swift
//  APToastSampleProject
//
//  Created by Andrej Poljanec on 5/14/15.
//  Copyright (c) 2015 Andrej Poljanec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showToastAction(sender: AnyObject) {
        let toast = APToast(parentView: view, message: "This is a toast notification.\nThis is a toast notification.")
        toast.show()
    }

}

