//
//  ViewController.swift
//  TopNavBar
//
//  Created by Tobias Theil on 19/04/15.
//  Copyright (c) 2015 Tobias Theil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var topNavView: UIView!
    @IBOutlet var topNavTopContraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("myCell") as! UITableViewCell
        return cell
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let beginTransition: CGFloat = 100
        let maxOffset: CGFloat = 57

        if scrollView.contentOffset.y < beginTransition {
            let offset = scrollView.contentOffset.y - beginTransition
            
            if offset >= 0 {
                topNavTopContraint.constant = (offset * -1)
            } else {
                topNavTopContraint.constant = 0
            }
        } else if scrollView.contentOffset.y > beginTransition {
            let offset = scrollView.contentOffset.y - beginTransition
            
            if offset <= maxOffset {
                topNavTopContraint.constant = (offset * -1)
            } else {
                topNavTopContraint.constant = (maxOffset * -1)
            }
        }
    }
}