//
//  Flow.swift
//  PeripheralBLE
//
//  Created by durgesh on 21/08/19.
//  Copyright © 2019 All rights reserved.
//


import Foundation

class Flow {

    // MARK: - Functions
    // Execute code block asynchronously
    static func async(block: @escaping () -> Void) { DispatchQueue.main.async(execute: block) }

    // Execute code block asynchronously after given delay time
    static func delay(for delay: TimeInterval, block: @escaping () -> Void) {

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: block)
        
    }
    
}

