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
        view.backgroundColor = UIColor.lightGrayColor()
        
        var statusBarView = UIView(frame: CGRect(x: 0, y: 0, width: CGRectGetWidth(view.frame), height: 40))
        statusBarView.backgroundColor = UIColor(red: 0.6, green: 0.2, blue: 0.6, alpha: 1)
        view.addSubview(statusBarView)
        
        var titleLabel = UILabel()
        titleLabel.text = "FLACCO"
        titleLabel.font = UIFont.boldSystemFontOfSize(13)
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.sizeToFit()
        titleLabel.center = CGPoint(x: view.center.x, y: 30)
        view.addSubview(titleLabel)
        
        var previewView = UIView(frame: CGRect(x: 0, y: 40, width: CGRectGetWidth(view.frame), height: CGRectGetWidth(view.frame)))
        previewView.backgroundColor = UIColor.blackColor()
        view.addSubview(previewView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
}

