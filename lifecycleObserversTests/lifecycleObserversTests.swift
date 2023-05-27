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
        assertObserverAddedAsChild(when: { sut in
            sut.onViewWillAppear {}
        })
    }
    
    func test_viewWillAppearObserverViewIsAddedAsSubview() {
        assertObserverViewIsAddedAsSubview(when: { sut in
            sut.onViewWillAppear {}
        })
    }

    func test_viewWillAppearObserviewViewIsInvisible() {
        assertObserverViewIsInvisible(when: { sut in
            sut.onViewWillAppear {}
        })
    }
    
    func test_viewWillAppearObserverFiresCallback() {
        assertObserverFires(
            callback: { $0.onViewWillAppear },
            when: { $0.viewWillAppear(false) }
        )
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
        assertObserverAddedAsChild(when: { sut in
            sut.onViewDidAppear {}
        })
    }
    
    func test_viewDidAppearObserverViewIsAddedAsSubview() {
        assertObserverViewIsAddedAsSubview(when: { sut in
            sut.onViewDidAppear {}
        })
    }

    func test_viewDidAppearObserviewViewIsInvisible() {
        assertObserverViewIsInvisible(when: { sut in
            sut.onViewDidAppear {}
        })
    }
    
    func test_viewDidAppearObserverFiresCallback() {
        assertObserverFires(
            callback: { $0.onViewDidAppear },
            when: { $0.viewDidAppear(false) }
        )
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
        assertObserverAddedAsChild(when: { sut in
            sut.onViewWillDisappear {}
        })
    }
    
    func test_viewWillDisappearObserverViewIsAddedAsSubview() {
        assertObserverViewIsAddedAsSubview(when: { sut in
            sut.onViewWillDisappear {}
        })
    }

    func test_viewWillDisappearObserviewViewIsInvisible() {
        assertObserverViewIsInvisible(when: { sut in
            sut.onViewWillDisappear {}
        })
    }
    
    func test_viewWillDisappearObserverFiresCallback() {
        assertObserverFires(
            callback: { $0.onViewWillDisappear },
            when: { $0.viewWillDisappear(false) }
        )
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
        assertObserverAddedAsChild(when: { sut in
            sut.onViewDidDisappear {}
        })
    }
    
    func test_viewDidDisappearObserverViewIsAddedAsSubview() {
        assertObserverViewIsAddedAsSubview(when: { sut in
            sut.onViewDidDisappear {}
        })
    }

    func test_viewDidDisappearObserviewViewIsInvisible() {
        assertObserverViewIsInvisible(when: { sut in
            sut.onViewDidDisappear {}
        })
    }
    
    func test_viewDidDisappearObserverFiresCallback() {
        assertObserverFires(
            callback: { $0.onViewDidDisappear },
            when: { $0.viewDidDisappear(false) }
        )
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
    
    // MARK: Helpers
    
    private func assertObserverAddedAsChild(when action: @escaping (UIViewController) -> Void, file: StaticString = #file, line: UInt = #line) {
        let sut = UIViewController()
        
        action(sut)
        
        XCTAssertEqual(sut.children.count, 1, file: file, line: line)
    }
    
    private func assertObserverViewIsAddedAsSubview(when action: @escaping (UIViewController) -> Void, file: StaticString = #file, line: UInt = #line) {
        let sut = UIViewController()
        
        action(sut)
        
        let observer = sut.children.first
        XCTAssertEqual(observer?.view.superview, sut.view, file: file, line: line)
    }
    
    private func assertObserverViewIsInvisible(when action: @escaping (UIViewController) -> Void, file: StaticString = #file, line: UInt = #line) {
        let sut = UIViewController()
        
        action(sut)
        
        let observer = sut.children.first
        XCTAssertEqual(observer?.view.isHidden, true, file: file, line: line)
    }
    
    typealias ObserverCallback = (UIViewController) -> ((@escaping () -> Void) -> Observer)
    typealias LifecycleAction = (UIViewController) -> Void
    private func assertObserverFires(callback: ObserverCallback, when action: LifecycleAction, file: StaticString = #file, line: UInt = #line) {
        let sut = UIViewController()
        
        var callCount = 0
        _ = callback(sut)({ callCount += 1 })
        
        let observer = sut.children.first!
        XCTAssertEqual(callCount, 0, file: file, line: line)
        
        action(observer)
        XCTAssertEqual(callCount, 1, file: file, line: line)
        
        action(observer)
        XCTAssertEqual(callCount, 2, file: file, line: line)
    }
    }
    
}
