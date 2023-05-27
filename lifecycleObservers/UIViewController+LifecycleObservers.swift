//
//  UIViewController+LifecycleObservers.swift
//  lifecycleObservers
//
//  Created by Yevhenii Veretennikov on 27.05.2023.
//

import UIKit

protocol Observer {
    func remove()
}

extension UIViewController {
    @discardableResult
    func onViewWillAppear(run callback: @escaping () -> Void) -> Observer {
        return ViewControllerLifecycleObserver(
            parent: self,
            viewWillAppearCallback: callback
        )
    }
    
    @discardableResult
    func onViewDidAppear(run callback: @escaping () -> Void) -> Observer {
        return ViewControllerLifecycleObserver(
            parent: self,
            viewDidAppearCallback: callback
        )
    }
    
    @discardableResult
    func onViewWillDisappear(run callback: @escaping () -> Void) -> Observer {
        return ViewControllerLifecycleObserver(
            parent: self,
            viewWillDisappearCallback: callback
        )
    }
    
    @discardableResult
    func onViewDidDisappear(run callback: @escaping () -> Void) -> Observer {
        return ViewControllerLifecycleObserver(
            parent: self,
            viewDidDisappearCallback: callback
        )
    }
}

private class ViewControllerLifecycleObserver: UIViewController, Observer {
    
    private var viewWillAppearCallback: (() -> Void)?
    private var viewDidAppearCallback: (() -> Void)?
    private var viewWillDisappearCallback: (() -> Void)?
    private var viewDidDisappearCallback: (() -> Void)?
    
    convenience init(
        parent: UIViewController,
        viewWillAppearCallback: (() -> Void)? = nil,
        viewDidAppearCallback: (() -> Void)? = nil,
        viewWillDisappearCallback: (() -> Void)? = nil,
        viewDidDisappearCallback: (() -> Void)? = nil) {
        self.init()
        self.add(parent)
        self.viewWillAppearCallback = viewWillAppearCallback
        self.viewDidAppearCallback = viewDidAppearCallback
        self.viewWillDisappearCallback = viewWillDisappearCallback
        self.viewDidDisappearCallback = viewDidDisappearCallback
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillAppearCallback?()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidAppearCallback?()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewWillDisappearCallback?()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewDidDisappearCallback?()
    }
    
    private func add(_ parent: UIViewController) {
        parent.addChild(self)
        view.isHidden = true
        parent.view.addSubview(view)
        didMove(toParent: parent)
    }
    
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
    
}
