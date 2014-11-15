//
//  MainViewController.swift
//  Flacco
//
//  Created by Gianni Settino on 2014-11-14.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()        
        view.backgroundColor = UIColor.whiteColor()
        
        var previewView = CaptureView(frame: view.bounds)
        view.addSubview(previewView)
        
        var previewSquareSize = view.bounds.size.width
        var topAndBottomViewHeight = (view.bounds.size.height-previewSquareSize)/2
        
        var blurEffect = UIBlurEffect(style: .Dark)
        var topBlurView = UIVisualEffectView(effect: blurEffect)
        topBlurView.frame = CGRect(x: 0, y: 0, width: previewSquareSize, height: topAndBottomViewHeight)
        view.addSubview(topBlurView)
        
        var bottomBlurView = UIVisualEffectView(effect: blurEffect)
        bottomBlurView.frame = CGRect(x: 0, y: view.bounds.size.height-topAndBottomViewHeight, width: previewSquareSize, height: topAndBottomViewHeight)
        view.addSubview(bottomBlurView)
        
        var recordButtonRadius: CGFloat = 45
        var recordButtonBorderOffset: CGFloat = 10
        
        var recordButtonBorder = UIView(frame: CGRectMake(0, 0, 2*(recordButtonRadius+recordButtonBorderOffset), 2*(recordButtonRadius+recordButtonBorderOffset)))
        recordButtonBorder.backgroundColor = UIColor.clearColor()
        recordButtonBorder.layer.borderColor = UIColor.whiteColor().CGColor
        recordButtonBorder.layer.borderWidth = recordButtonBorderOffset/2
        recordButtonBorder.layer.masksToBounds = true
        recordButtonBorder.layer.cornerRadius = recordButtonRadius+recordButtonBorderOffset
        recordButtonBorder.center = CGPoint(x: view.center.x, y: bottomBlurView.center.y)
        view.addSubview(recordButtonBorder)
        
        var recordButton = UIButton(frame: CGRectMake(0, 0, 2*recordButtonRadius, 2*recordButtonRadius))
        recordButton.layer.masksToBounds = true
        recordButton.layer.cornerRadius = recordButtonRadius
        recordButton.backgroundColor = UIColor.whiteColor()
        recordButton.center = CGPoint(x: view.center.x, y: bottomBlurView.center.y)
        view.addSubview(recordButton)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        UIApplication.sharedApplication().statusBarHidden = true
    }
    
}

