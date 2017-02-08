//
//  Fill.swift
//  LayoutKit
//
//  Created by Avario.
//

import Foundation
import UIKit

public extension Layout {

    /// Applies `top`, `bottom`, `left`, and `right` constraints to the view to make it fill another `UIView` or `UILayoutGuide`.
    /// 
    /// - parameters:
    ///   - layoutRegion: The `UIView` or `UILayoutGuide` to be filled.
    ///   - insets: Optional `UIEdgeInsets` to add padding around the view.
    ///
    /// - returns: A labeled tuple containing the applied `top`, `bottom`, `left`, and `right` constraints.

    @discardableResult public func fill(_ layoutRegion: LayoutRegion, _ insets: UIEdgeInsets = UIEdgeInsets.zero) ->
        (topConstraint: NSLayoutConstraint,
        bottomContraint: NSLayoutConstraint,
        leftConstraint: NSLayoutConstraint,
        rightConstraint: NSLayoutConstraint) {

            let topConstraint = (base.top == layoutRegion.top + insets.top)
            let bottomConstraint = (base.bottom == layoutRegion.bottom - insets.bottom)
            let leftConstraint = (base.left == layoutRegion.left + insets.left)
            let rightConstraint = (base.right == layoutRegion.right - insets.right)

            NSLayoutConstraint.activate([topConstraint, bottomConstraint, leftConstraint, rightConstraint])

            return (topConstraint, bottomConstraint, leftConstraint, rightConstraint)
    }

}
