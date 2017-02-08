//
//  EdgeInsets.swift
//  LayoutKit
//
//  Created by Avario.
//

import Foundation
import UIKit

public extension UIEdgeInsets {

    fileprivate init(_ topValue: CGFloat, _ leftValue: CGFloat, _ bottomValue: CGFloat, _ rightValue: CGFloat) {
        self.init(top: topValue, left: leftValue, bottom: bottomValue, right: rightValue)
    }


    /// Create `UIEdgeInsets` by specifying only insets unique edges.
    /// Unspecified edges will be set to `others` (default `0`).

    public init(top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil, others : CGFloat = 0) {
        self.init(top ?? others, left ?? others, bottom ?? others, right ?? others)
    }


    /// Create `UIEdgeInsets` by specifying horizontal and/or vertical insets.
    /// Unspecified insets default to `0`.
    ///
    /// - parameters:
    ///   - horizontal: `left` and `right` insets.
    ///   - vertical: `top` and `bottom` insets.

    public init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.init(vertical, horizontal, vertical, horizontal)
    }


    /// Create `UIEdgeInsets` with all insets the same.
    ///
    /// - parameters:
    ///   - inset: Value to be used for `top`, `left`, `bottom`, and `right` insets.

    public init(_ inset: CGFloat) {
        self.init(inset, inset, inset, inset)
    }

}
