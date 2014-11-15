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
        
        var topBlurView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        topBlurView.frame = CGRect(x: 0, y: 0, width: previewSquareSize, height: topAndBottomViewHeight)
        view.addSubview(topBlurView)
        
        var bottomBlurView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        bottomBlurView.frame = CGRect(x: 0, y: view.bounds.size.height-topAndBottomViewHeight, width: previewSquareSize, height: topAndBottomViewHeight)
        view.addSubview(bottomBlurView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        UIApplication.sharedApplication().statusBarHidden = true
    }
    
}

