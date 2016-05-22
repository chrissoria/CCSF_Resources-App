//
//  ContainerViewController.swift
//  CCSF_Resources
//
//  Created by christopher soria on 5/15/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var navView: UIView!
    
    @IBOutlet weak var masterView: UIView!
    
    @IBOutlet weak var rightConstraint1: NSLayoutConstraint!
    @IBOutlet weak var rightConstraint2: NSLayoutConstraint!
    @IBOutlet weak var rightConstraint3: NSLayoutConstraint!
    
    @IBOutlet weak var campusLabel: UILabel!
    
    var text: String?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let text = text {
            campusLabel.text = text
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func swypeLeft(sender: UISwipeGestureRecognizer) {
        open()
        
    }
    @IBAction func swypeRight(sender: UISwipeGestureRecognizer) {
        close()
        
    }
    @IBAction func menuTapped(sender: AnyObject) {
        if rightConstraint1.constant == 0{
            open()
        } else {
            close()
        }
    }
    
    func open(){
        rightConstraint1.constant = menuView.frame.size.width
        rightConstraint3.constant = menuView.frame.size.width
        UIView.animateWithDuration(0.3) {
            self.view.layoutIfNeeded()
        }
    }
    func close(){
        rightConstraint1.constant = 0
        rightConstraint3.constant = 0
        UIView.animateWithDuration(0.3) {
            self.view.layoutIfNeeded()
        }
    }
}
