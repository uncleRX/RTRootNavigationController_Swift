//
//  UIViewController+RTRootNavigationController.swift
//  Pods-RTRootNavigationController_Swift_Example
//
//  Created by xujie on 2018/3/15.
//

import UIKit

private var disableInteractivePopKey: String = "disableInteractivePop"

@objc public protocol RTNavigationItemCustomizable {
    
   @objc optional func rt_customBackItemWithTarget(target: Any, action: Selector) ->UIBarButtonItem?
    
}

// TODO:  handel access control problems

extension UIViewController: RTNavigationItemCustomizable{
  
     public var rt_disableInteractivePop: Bool {
        
        set{
            objc_setAssociatedObject(self, &disableInteractivePopKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        
        get{
            return objc_getAssociatedObject(self, &disableInteractivePopKey) as! Bool
        }

    }
    
    public var rt_navigationController: RTRootNavigationController? {
        var vc: UIViewController? = self
        while vc != nil && !(vc is RTRootNavigationController) {
            vc = vc?.navigationController
        }
        return vc as? RTRootNavigationController
    }
    
  @objc open func rt_navigationBarClass() -> Swift.AnyClass? {
        return nil
    }
    
    open func rt_customBackItemWithTarget(target: Any, action: Selector) -> UIBarButtonItem? {return nil}
}
