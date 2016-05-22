//
//  MenuTableViewController.swift
//  CCSF_Resources
//
//  Created by christopher soria on 5/15/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    private let data = ["Ocean", "Mission", "Downtown", "Civic Center", "Chinatown", "Evans", "Fort Mason", "Gough Street", "John Adams", "Southeast", "Airport"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("menuCell", forIndexPath: indexPath)

        cell.textLabel?.text = data[indexPath.row]

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let viewControllers = navigationController?.viewControllers {
            for controller in viewControllers {
                if controller.restorationIdentifier == "container" {
                    let container = controller as! ContainerViewController
                    for child in container.childViewControllers {
                        if child.restorationIdentifier == "master" {
                            let master = child as! MasterViewController
                            container.text = data[indexPath.row]
                            container.viewWillAppear(false)
                        }
                    }
                    container.close()
                }
            }
        }
    }
}
