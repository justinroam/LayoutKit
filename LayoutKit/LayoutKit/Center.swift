//
//  Center.swift
//  LayoutKit
//
//  Created by Avario.
//

import Foundation
import UIKit

public extension Layout {

    /// Applies `centerX` and `centerY` constraints to the view to make it center within another `UIView` or `UILayoutGuide`.
    /// The view's `size` can be constrained by using the `layout.size()` method.
    ///
    /// - parameters:
    ///   - layoutRegion: The `UIView` or `UILayoutGuide` to center within.
    ///   - offset: Optional `UIOffset` to offset the center of the view from the center of the `layoutRegion`.
    ///
    /// - returns: A labeled tuple containing the applied `centerX` and `centerY` constraints.

    @discardableResult public func center(in layoutRegion: LayoutRegion, _ offset: UIOffset = UIOffset.zero) ->
    (centerXConstraint: NSLayoutConstraint,
     centerYConstraint: NSLayoutConstraint) {

        let centerXConstraint = (base.centerX == layoutRegion.centerX + offset.horizontal)
        let centerYConstraint = (base.centerY == layoutRegion.centerY + offset.vertical)

        NSLayoutConstraint.activate([centerXConstraint, centerYConstraint])

        return (centerXConstraint, centerYConstraint)
    }

}
