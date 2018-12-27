//
//  UIWindowExtensions.swift
//  Stash
//
//  Created by Daniel Romero on 12/27/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import UIKit

protocol UIWindowProtocol: class {
    func makeKeyAndVisible()
    var rootViewController: UIViewController? { get set }
}

extension UIWindow: UIWindowProtocol {}
