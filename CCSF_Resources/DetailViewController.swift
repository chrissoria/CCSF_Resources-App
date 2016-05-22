//
//  DetailViewController.swift
//  CCSF_Resources
//
//  Created by christopher soria on 5/17/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class DetailViewController: UIViewController {
    
    var detail: PFObject?

    @IBOutlet weak var detailTitle: UILabel!
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var fullDescriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var tuesdayLabel: UILabel!
    @IBOutlet weak var wednesdayLabel: UILabel!
    @IBOutlet weak var thursdayLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var DraggableImageView: CustomImageView!
    @IBOutlet weak var resourceImageView: UIImageView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: detailView.frame.size.height)
        
        //displaying data
        //loading image
        let resourceImage1 = detail!["resourceImage"] as? String
        load_image(resourceImage1!)
        let title = detail!["resourceTitle"] as? String
        detailTitle.text = title
        let fullDescription = detail!["fullDescription"] as? String
        fullDescriptionLabel.text = fullDescription
        let resouceLocation = detail!["location"] as? String
        locationLabel.text = resouceLocation
        
        //hours
        let monday = detail!["monday"] as? String
        mondayLabel.text = "M: "+monday!
        let tuesday = detail!["tuesday"] as? String
        tuesdayLabel.text = "T: "+tuesday!
        let wednesday = detail!["wednesday"] as? String
        wednesdayLabel.text = "W: "+wednesday!
        let thursday = detail!["thursday"] as? String
        thursdayLabel.text = "TH: "+thursday!
        let friday = detail!["friday"] as? String
        fridayLabel.text = "F: "+friday!
        
        //animating view
        UIView.animateWithDuration(0.6) { () -> Void in
            self.detailView.alpha = 1
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBack(sender: AnyObject) {
        self.performSegueWithIdentifier("unwindToMenu", sender: self)
    }
    
    func load_image(urlString:String)
    {
        let imgURL = NSURL(string: urlString)
        let request: NSURLRequest = NSURLRequest(URL: imgURL!)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            if (error == nil && data != nil)
            {
                func display_image()
                {
                    self.resourceImageView.image = UIImage(data: data!)
                }
                
                dispatch_async(dispatch_get_main_queue(), display_image)
            }
        }
        
        task.resume()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
