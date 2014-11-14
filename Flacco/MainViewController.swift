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
        
        var statusBarView = UIView(frame: CGRect(x: 0, y: 0, width: CGRectGetWidth(view.frame), height: 40))
        statusBarView.backgroundColor = UIColor.blackColor()
        view.addSubview(statusBarView)
        
        var titleLabel = UILabel()
        titleLabel.text = "FLACCO"
        titleLabel.font = UIFont(name: "Verdana-Bold", size: 13)
        titleLabel.textColor = UIColor(red: 1, green: 0.8, blue: 0, alpha: 1)
        titleLabel.sizeToFit()
        titleLabel.center = CGPoint(x: view.center.x, y: 30)
        view.addSubview(titleLabel)
        
        var previewView = UIView(frame: CGRect(x: 0, y: 40, width: CGRectGetWidth(view.frame), height: CGRectGetWidth(view.frame)))
        previewView.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(previewView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
}

