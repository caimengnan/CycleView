//
//  View(Extension).swift
//  立体轮播
//
//  Created by caimengnan on 2018/4/20.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import Foundation
import UIKit
//屏幕尺寸
//屏幕宽度
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
//屏幕高度
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
//自适应屏幕宽度
func FIT_SCREEN_WIDTH(_ size:CGFloat) -> CGFloat {
    return size * SCREEN_WIDTH / 375.0
}

//自适应屏幕高度
func FIT_SCREEN_HEIGHT(_ size:CGFloat) -> CGFloat {
    return size * SCREEN_HEIGHT / 667.0
}

extension UIView {
    
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    
    public var left: CGFloat
    {
        get {
            return self.frame.origin.x
        }
        
        set {
            
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
        
        
    }
    
    public var y : CGFloat {
        
        get  {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    
    }
    
    
    public var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
        
    }
    
    public var width: CGFloat {
        
        get {
            return self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    
    }
    
    
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    public var bottom: CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        
        set {
            var frame = self.frame
            frame.origin.y = newValue - self.frame.size.height
            self.frame = frame
        }
    }
    
    public var right:CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        
        set {
            var frame = self.frame
            frame.origin.x = newValue - self.frame.size.width
            self.frame = frame
        }
        
    }
    
    
    public var size: CGSize {
        get {
            return self.frame.size
        }
        
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    public var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    
    
    public var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    
    
    
}
