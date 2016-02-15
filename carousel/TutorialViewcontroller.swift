//
//  TutorialViewcontroller.swift
//  carousel
//
//  Created by Emma Guo on 2/14/16.
//  Copyright © 2016 emmaguo. All rights reserved.
//

import UIKit

class TutorialViewcontroller: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backupButtonView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        scrollView.contentSize = CGSize(
            width: imageView.frame.width * 4,
            height: imageView.frame.height)
        backupButtonView.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if page == 3 {
            UIView.animateWithDuration(0.4, animations: {
                self.backupButtonView.alpha = 1
            })
        } else {
            backupButtonView.alpha = 0
        }
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
