//
//  UICustomizeHelper.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 4/8/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit

class UICustomizeHelper: NSObject {
    
    static func buildFlag(view: UIView!, cornerRadius: CGFloat, withBorder: Bool) {
        view.layer.cornerRadius = cornerRadius
        view.layer.masksToBounds = true
        
        if (withBorder) {
            view.layer.borderColor = UIColor.whiteColor().CGColor
            view.layer.borderWidth = 2
        }
    }
    
    static func buildPictureProfile(imageView: UIImageView) {
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 65
        imageView.layer.borderColor = UIColor.whiteColor().CGColor
        imageView.layer.borderWidth = 2
    }
    
    static func applyPlainShadow(view: UIView) {
        let layer = view.layer
        
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 1
        
        layer.cornerRadius = 4
    }
    
    static func applyBlurEffect(imageView: UIImageView) {
        let darkBlur = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurView = UIVisualEffectView(effect: darkBlur)
        
        blurView.frame = imageView.bounds
        imageView.addSubview(blurView)
    }
    
    static func addShadowInView(view: UIView) {
        view.layer.shadowColor = UIColor.blackColor().CGColor
        view.layer.shadowOffset = CGSizeMake(5, 5)
        view.layer.shadowRadius = 5
    }
    
    static func customizeNavBar() {
        
        let backgroundColor = UIColor(red: 52.0/255.0, green: 73.0/255.0, blue: 94.0/255.0, alpha: 1)
        let foregroundColor = UIColor(red: 238.0/255.0, green: 241.0/255.0, blue: 203.0/255.0, alpha: 1)
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        UINavigationBar.appearance().backgroundColor = backgroundColor
        UINavigationBar.appearance().tintColor = foregroundColor
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: foregroundColor]
        
        UINavigationBar.appearance().translucent = false
    }
}
