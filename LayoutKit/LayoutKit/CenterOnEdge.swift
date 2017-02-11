//
//  CenterOnEdge.swift
//  LayoutKit
//
//  Created by Avario.
//

import Foundation
import UIKit

public extension Layout {

    /// Applies constraints to center the view on a horizontal edge.
    /// The view's `size` can be constrained by using the `layout.size()` method.
    ///
    /// - parameters:
    ///   - edge: Horizontal (`top` or `bottom`) `SidedLayoutItem` to center on.
    ///           Use `inside` to center on the inside of a view, and `outside` to center on the outside of it.
    ///           Use `+` and `-` operators to add padding.
    ///
    /// - returns: A labeled tuple containing the applied `edge` (`top` or `bottom`) and `centerX` constraint.

    @discardableResult public func center(on edge: SidedLayoutItem<LayoutRegion, YAxis>) ->
    (edgeConstraint: NSLayoutConstraint,
     centerConstraint: NSLayoutConstraint) {

        let edgeConstraint: NSLayoutConstraint

        switch (edge.layoutItem.attribute, edge.side) {
        case (.top, .inside), (.bottom, .outside):
            edgeConstraint = (base.top == edge.layoutItem)
        case (.bottom, .inside), (.top, .outside):
            edgeConstraint = (base.bottom == edge.layoutItem)
        default:
            fatalError("Invalid layout item.")
        }

        let centerConstraint = (base.centerX == edge.layoutItem.item.centerX)

        NSLayoutConstraint.activate([edgeConstraint, centerConstraint])

        return (edgeConstraint, centerConstraint)
    }


    /// Applies constraints to center the view on a vertical edge.
    /// The view's `size` can be constrained by using the `layout.size()` method.
    ///
    /// - parameters:
    ///   - edge: Vertical (`left` or `right`) `SidedLayoutItem` to center on.
    ///           Use `inside` to center on the inside of a view, and `outside` to center on the outside of it.
    ///           Use `+` and `-` operators to add padding.
    ///
    /// - returns: A labeled tuple containing the applied `edge` (`left` or `right`) and `centerY` constraint.

    @discardableResult public func center(on edge: SidedLayoutItem<LayoutRegion, XAxis>) ->
    (edgeConstraint: NSLayoutConstraint,
     centerConstraint: NSLayoutConstraint) {

        let edgeConstraint: NSLayoutConstraint

        switch (edge.layoutItem.attribute, edge.side) {
        case (.left, .inside), (.right, .outside):
            edgeConstraint = (base.left == edge.layoutItem)
        case (.right, .inside), (.left, .outside):
            edgeConstraint = (base.right == edge.layoutItem)
        default:
            fatalError("Invalid layout item.")
        }

        let centerConstraint = (base.centerY == edge.layoutItem.item.centerY)

        NSLayoutConstraint.activate([edgeConstraint, centerConstraint])

        return (edgeConstraint, centerConstraint)
    }

}
