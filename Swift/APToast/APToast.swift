//
//  APToast.swift
//
//  Created by Andrej Poljanec on 5/14/15.
//  Copyright (c) 2015 Andrej Poljanec. All rights reserved.
//

import UIKit

class APToast: UIView {
    
    let APTOAST_PADDING: CGFloat = 8
    
    let parentView: UIView
    let message: NSAttributedString
    
    init(parentView: UIView, message: NSAttributedString) {
        self.parentView = parentView
        self.message = message
        super.init(frame: parentView.frame)
        
        initialize()
    }
    
    convenience init(parentView: UIView, message: NSString) {
        self.init(parentView: parentView, message: NSAttributedString(string: message))
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        frame = parentView.frame
        alpha = 0
        
        let fullScreenFrame = UIScreen.mainScreen().bounds
        
        let maxHeight = CGFloat.max
        let maxWidth = fullScreenFrame.width - 4 * APTOAST_PADDING
        let label = UILabel(frame: CGRectMake(0, 0, maxWidth, maxHeight))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.textAlignment = NSTextAlignment.Center
        label.attributedText = message
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "HelveticaNeue", size: 13)
        label.sizeToFit()
        let size = label.frame.size
        
        let centerPoint = CGPointMake(fullScreenFrame.size.width / 2, fullScreenFrame.size.height / 10 * 8)

        let mainFrame = CGRectMake(centerPoint.x - size.width / 2 - APTOAST_PADDING, centerPoint.y - size.height / 2 - APTOAST_PADDING, size.width + 2 * APTOAST_PADDING, size.height + 2 * APTOAST_PADDING)
        let mainView = UIView(frame: mainFrame)
        mainView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        mainView.layer.cornerRadius = 10
        mainView.layer.borderColor = UIColor(white: 0, alpha: 0.1).CGColor
        mainView.layer.borderWidth = 1
        mainView.layer.shadowColor = UIColor.blackColor().CGColor
        mainView.layer.shadowRadius = 2
        mainView.layer.shadowOpacity = 0.5
        mainView.layer.shadowOffset = CGSizeMake(0, 0)
        addSubview(mainView)
        
        label.frame = CGRectMake(APTOAST_PADDING, APTOAST_PADDING, size.width, size.height)
        mainView.addSubview(label)
    }
    
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        return false
    }
    
    func show() {
        parentView.addSubview(self)
        UIView.animateWithDuration(0.25,
            animations: {
                self.alpha = 1.0
        },
            completion: {
                (value: Bool) in
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
                    self.hide()
                })
        })
    }
    
    private func hide() {
        UIView.animateWithDuration(0.25,
            animations: {
                self.alpha = 0.0
            },
            completion: {
                (value: Bool) in
                self.removeFromSuperview()
        })
    }
   
}
