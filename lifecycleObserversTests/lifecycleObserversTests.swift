//
//  lifecycleObserversTests.swift
//  lifecycleObserversTests
//
//  Created by Yevhenii Veretennikov on 27.05.2023.
//

import XCTest
@testable import lifecycleObservers

final class lifecycleObserversTests: XCTestCase {

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
    
}
