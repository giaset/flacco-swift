//
//  CaptureView.swift
//  Flacco
//
//  Created by Gianni Settino on 2014-11-14.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit
import AVFoundation

class CaptureView: UIView {
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        if (newSuperview != nil && newSuperview != superview) {
            setupCaptureSession()
        } else if (newSuperview == nil) {
            tearDownCaptureSession()
        }
    }
    
    func setupCaptureSession() {
        tearDownCaptureSession()
        captureSession = AVCaptureSession()
        setupDeviceInput()
        setupVideoPreviewLayer()
        captureSession?.startRunning()
    }
    
    func tearDownCaptureSession() {
        if (captureSession == nil) {
            return;
        }
        
        captureSession?.stopRunning()
        videoPreviewLayer?.removeFromSuperlayer()
        
        captureSession = nil
        videoPreviewLayer = nil
    }
    
    func setupDeviceInput() {
        for device: AVCaptureDevice in AVCaptureDevice.devices() as [AVCaptureDevice] {
            if (device.position == .Back) {
                var error: NSError? = nil
                var input = AVCaptureDeviceInput(device: device, error: &error)
                if (error == nil) {
                    if (captureSession!.canAddInput(input)) {
                        captureSession?.addInput(input)
                    } else {
                        println("Capture session can't add camera input")
                    }
                } else {
                    println("Error adding camera: " + error!.localizedDescription)
                }
            }
        }
    }
    
    func setupVideoPreviewLayer() {
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.frame = bounds
        layer.addSublayer(videoPreviewLayer)
    }
    
}
