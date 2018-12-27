//
//  TestWindow.swift
//  StashTests
//
//  Created by Daniel Romero on 12/27/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import UIKit
@testable import Stash

class TestWindow: UIWindowProtocol {
    
    private(set) var didCallMakeKeyAndVisible = false
    var rootViewController: UIViewController?
    
    func makeKeyAndVisible() {
        didCallMakeKeyAndVisible = true
    }
    
}
