//
//  CameraPhotosPermission.swift
//  SampleProject
//
//  Created by Bacancy Technology on 30/12/19.
//  Copyright © 2021 Bacancy Technology. All rights reserved.
//

import Foundation
import Photos
import UIKit

class CheckPermissionsClass: NSObject
{
    var photosAccessPermissionGranted : (() -> ())?
    var cameraAccessPermissionGranted : (() -> ())?

    func checkPhotoLibraryPermission()
    {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        if photoAuthorizationStatus == .authorized
        {
            self.photosAccessPermissionGranted!()
        }
        else if photoAuthorizationStatus == .notDetermined
        {
            PHPhotoLibrary.requestAuthorization({ (newStatus) in
                if newStatus ==  PHAuthorizationStatus.authorized
                {
                    self.photosAccessPermissionGranted!()
                }
                else
                {
                    self.openPermissionPopuop()
                }
            })
        }
        else if photoAuthorizationStatus == .denied
        {
            self.openPermissionPopuop()
        }
    }

    func checkCameraPermission()
    {
        let photoAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        
        if photoAuthorizationStatus == .authorized
        {
            self.cameraAccessPermissionGranted!()
        }
        else if photoAuthorizationStatus == .notDetermined
        {
            AVCaptureDevice.requestAccess(for: .video) { (newStatus) in
                if newStatus ==  true
                {
                    self.cameraAccessPermissionGranted!()
                }
                else
                {
                    self.openPermissionPopuop()
                }
            }
        }
        else if photoAuthorizationStatus == .denied
        {
            self.openPermissionPopuop()
        }
    }
    
    func openPermissionPopuop()
    {
        guard let topViewController = UIApplication.topViewController() else {
            return
        }
        topViewController.displayAlert(title: "", message: "Work In Progress", completion: nil)
    }
}
