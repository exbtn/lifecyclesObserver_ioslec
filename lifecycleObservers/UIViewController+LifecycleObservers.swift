//
//  UIViewController+LifecycleObservers.swift
//  lifecycleObservers
//
//  Created by Yevhenii Veretennikov on 27.05.2023.
//

import UIKit

protocol UIViewControllerLifecycleObserver {
    func remove()
}

extension UIViewController {
    @discardableResult
    func onViewWillAppear(run callback: @escaping () -> Void) -> UIViewControllerLifecycleObserver {
        let observer = ViewControllerLifecycleObserver(viewWillAppearCallback: callback)
        add(observer)
        return observer
    }
    
    @discardableResult
    func onViewDidAppear(run callback: @escaping () -> Void) -> UIViewControllerLifecycleObserver {
        let observer = ViewControllerLifecycleObserver(viewDidAppearCallback: callback)
        add(observer)
        return observer
    }
    
    private func add(_ observer: UIViewController) {
        addChild(observer)
        observer.view.isHidden = true
        view.addSubview(observer.view)
        observer.didMove(toParent: self)
    }
}

private class ViewControllerLifecycleObserver: UIViewController, UIViewControllerLifecycleObserver {
    
    private var viewWillAppearCallback: () -> Void = {}
    private var viewDidAppearCallback: () -> Void = {}
    
    convenience init(viewWillAppearCallback: @escaping () -> Void = {}) {
        self.init()
        self.viewWillAppearCallback = viewWillAppearCallback
    }
    
    convenience init(viewDidAppearCallback: @escaping () -> Void = {}) {
        self.init()
        self.viewDidAppearCallback = viewDidAppearCallback
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillAppearCallback()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidAppearCallback()
    }
    
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
    
}
