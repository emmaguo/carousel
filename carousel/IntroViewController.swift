//
//  IntroViewController.swift
//  carousel
//
//  Created by Emma Guo on 2/13/16.
//  Copyright © 2016 emmaguo. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    var yOffsets : [Float] = [-285, -240, -415, -388, -480, -500]
    var xOffsets : [Float] = [-30, 35, 10, 80, -100, -75]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = introImageView.image!.size
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fancyTransform(tileView: UIImageView, index: Int) {
        let offset = CGFloat(scrollView.contentOffset.y)
        let tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: CGFloat(xOffsets[index]), r2Max: 0)
        let ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: CGFloat(yOffsets[index]), r2Max: 0)
        let scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: CGFloat(scales[index]), r2Max: 1)
        let rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: CGFloat(rotations[index]), r2Max: 0)
        
        tileView.transform = CGAffineTransformMakeTranslation(tx, ty)
        tileView.transform = CGAffineTransformScale(tileView.transform, scale, scale)
        tileView.transform = CGAffineTransformRotate(tileView.transform, CGFloat(rotation * CGFloat(M_PI / 180)))
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        fancyTransform(tile1View, index: 0)
        fancyTransform(tile2View, index: 1)
        fancyTransform(tile3View, index: 2)
        fancyTransform(tile4View, index: 3)
        fancyTransform(tile5View, index: 4)
        fancyTransform(tile6View, index: 5)
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
