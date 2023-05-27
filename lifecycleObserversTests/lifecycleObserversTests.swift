//
//  lifecycleObserversTests.swift
//  lifecycleObserversTests
//
//  Created by Yevhenii Veretennikov on 27.05.2023.
//

import XCTest
@testable import lifecycleObservers

final class lifecycleObserversTests: XCTestCase {

    // MARK: ViewWillAppear Tests
    
    func test_viewWillAppearObserverIsAddedAsChild() {
        let sut = UIViewController()
        
        sut.onViewWillAppear {}
        
        XCTAssertEqual(sut.children.count, 1)
    }
    
    func test_viewWillAppearObserverViewIsAddedAsSubview() {
        let sut = UIViewController()
        
        sut.onViewWillAppear {}
        
        let observer = sut.children.first
        XCTAssertEqual(observer?.view.superview, sut.view)
    }

    func test_viewWillAppearObserviewViewIsInvisible() {
        let sut = UIViewController()
        
        sut.onViewWillAppear {}
        
        let observer = sut.children.first
        XCTAssertEqual(observer?.view.isHidden, true)
    }
    
    func test_viewWillAppearObserverFiresCallback() {
        let sut = UIViewController()
        
        var callCount = 0
        sut.onViewWillAppear { callCount += 1 }
        
        let observer = sut.children.first
        XCTAssertEqual(callCount, 0)
        
        observer?.viewWillAppear(false)
        XCTAssertEqual(callCount, 1)
        
        observer?.viewWillAppear(false)
        XCTAssertEqual(callCount, 2)
    }
    
    func test_canRemoveViewWillAppearObserver() {
        let sut = UIViewController()
        
        sut.onViewWillAppear(run: { }).remove()
        
        XCTAssertEqual(sut.children.count, 0)
    }
    
    func test_canRemoveViewWillAppearObserverView() {
        let sut = UIViewController()
        
        sut.onViewWillAppear(run: { }).remove()
        
        XCTAssertEqual(sut.view.subviews.count, 0)
    }
    
    // MARK: ViewDidAppear Tests
    
    func test_viewDidAppearObserverIsAddedAsChild() {
        let sut = UIViewController()
        
        sut.onViewDidAppear {}
        
        XCTAssertEqual(sut.children.count, 1)
    }
    
    func test_viewDidAppearObserverViewIsAddedAsSubview() {
        let sut = UIViewController()
        
        sut.onViewDidAppear {}
        
        let observer = sut.children.first
        XCTAssertEqual(observer?.view.superview, sut.view)
    }

    func test_viewDidAppearObserviewViewIsInvisible() {
        let sut = UIViewController()
        
        sut.onViewDidAppear {}
        
        let observer = sut.children.first
        XCTAssertEqual(observer?.view.isHidden, true)
    }
    
    func test_viewDidAppearObserverFiresCallback() {
        let sut = UIViewController()
        
        var callCount = 0
        sut.onViewDidAppear { callCount += 1 }
        
        let observer = sut.children.first
        XCTAssertEqual(callCount, 0)
        
        observer?.viewDidAppear(false)
        XCTAssertEqual(callCount, 1)
        
        observer?.viewDidAppear(false)
        XCTAssertEqual(callCount, 2)
    }
    
    func test_canRemoveViewDidAppearObserver() {
        let sut = UIViewController()
        
        sut.onViewDidAppear(run: { }).remove()
        
        XCTAssertEqual(sut.children.count, 0)
    }
    
    func test_canRemoveViewDidAppearObserverView() {
        let sut = UIViewController()
        
        sut.onViewDidAppear(run: { }).remove()
        
        XCTAssertEqual(sut.view.subviews.count, 0)
    }
    
    // MARK: ViewWillDisappear Tests
    
    func test_viewWillDisappearObserverIsAddedAsChild() {
        let sut = UIViewController()
        
        sut.onViewWillDisappear {}
        
        XCTAssertEqual(sut.children.count, 1)
    }
    
    func test_viewWillDisappearObserverViewIsAddedAsSubview() {
        let sut = UIViewController()
        
        sut.onViewWillDisappear {}
        
        let observer = sut.children.first
        XCTAssertEqual(observer?.view.superview, sut.view)
    }

    func test_viewWillDisappearObserviewViewIsInvisible() {
        let sut = UIViewController()
        
        sut.onViewWillDisappear {}
        
        let observer = sut.children.first
        XCTAssertEqual(observer?.view.isHidden, true)
    }
    
    func test_viewWillDisappearObserverFiresCallback() {
        let sut = UIViewController()
        
        var callCount = 0
        sut.onViewWillDisappear { callCount += 1 }
        
        let observer = sut.children.first
        XCTAssertEqual(callCount, 0)
        
        observer?.viewWillDisappear(false)
        XCTAssertEqual(callCount, 1)
        
        observer?.viewWillDisappear(false)
        XCTAssertEqual(callCount, 2)
    }
    
    func test_canRemoveViewWillDisappearObserver() {
        let sut = UIViewController()
        
        sut.onViewWillDisappear(run: { }).remove()
        
        XCTAssertEqual(sut.children.count, 0)
    }
    
    func test_canRemoveViewWillDisappearObserverView() {
        let sut = UIViewController()
        
        sut.onViewWillDisappear(run: { }).remove()
        
        XCTAssertEqual(sut.view.subviews.count, 0)
    }
    
    // MARK: ViewDidDisappear Tests
    
    func test_viewDidDisappearObserverIsAddedAsChild() {
        let sut = UIViewController()
        
        sut.onViewDidDisappear {}
        
        XCTAssertEqual(sut.children.count, 1)
    }
    
    func test_viewDidDisappearObserverViewIsAddedAsSubview() {
        let sut = UIViewController()
        
        sut.onViewDidDisappear {}
        
        let observer = sut.children.first
        XCTAssertEqual(observer?.view.superview, sut.view)
    }

    func test_viewDidDisappearObserviewViewIsInvisible() {
        let sut = UIViewController()
        
        sut.onViewDidDisappear {}
        
        let observer = sut.children.first
        XCTAssertEqual(observer?.view.isHidden, true)
    }
    
    func test_viewDidDisappearObserverFiresCallback() {
        let sut = UIViewController()
        
        var callCount = 0
        sut.onViewDidDisappear { callCount += 1 }
        
        let observer = sut.children.first
        XCTAssertEqual(callCount, 0)
        
        observer?.viewDidDisappear(false)
        XCTAssertEqual(callCount, 1)
        
        observer?.viewDidDisappear(false)
        XCTAssertEqual(callCount, 2)
    }
    
    func test_canRemoveViewDidDisappearObserver() {
        let sut = UIViewController()
        
        sut.onViewDidDisappear(run: { }).remove()
        
        XCTAssertEqual(sut.children.count, 0)
    }
    
    func test_canRemoveViewDidDisappearObserverView() {
        let sut = UIViewController()
        
        sut.onViewDidDisappear(run: { }).remove()
        
        XCTAssertEqual(sut.view.subviews.count, 0)
    }
    
}
