//
//  FillEdge.swift
//  LayoutKit
//
//  Created by Avario.
//

import Foundation
import UIKit

public extension Layout {

    /// Applies constraints to the view to make it fill a horizontal edge (i.e., stretch along it).
    /// The view's `height` can be constrained by using the `layout.height()` method.
    ///
    /// - parameters:
    ///   - edge: Horizontal (`top` or `bottom`) `SidedLayoutItem` to fill against.
    ///           Use `inside` to fill along the inside of a view, and `outside` to fill along the outside of it.
    ///   - insets: Optional `UIEdgeInsets` to add padding around the view.
    ///
    /// - returns: A labeled tuple containing the applied `left`, `right`, and `edge` (either `top` or `bottom`) constraints.

    @discardableResult public func fill(_ edge: SidedLayoutItem<YAxis>, _ insets: UIEdgeInsets = UIEdgeInsets.zero) ->
        (edgeConstraint: NSLayoutConstraint,
        leftConstraint: NSLayoutConstraint,
        rightConstraint: NSLayoutConstraint) {

            guard let layoutRegion = edge.layoutItem.item as? LayoutRegion else {
                fatalError("Invalid layout item.")
            }

            let edgeConstraint: NSLayoutConstraint

            switch (edge.layoutItem.attribute, edge.side) {
            case (.top, .inside), (.bottom, .outside):
                edgeConstraint = (base.top == edge.layoutItem + insets.top)
            case (.bottom, .inside), (.top, .outside):
                edgeConstraint = (base.bottom == edge.layoutItem - insets.bottom)
            default:
                fatalError("Invalid layout item.")
            }

            let leftConstraint = (base.left == layoutRegion.left + insets.left)
            let rightConstraint = (base.right == layoutRegion.right - insets.right)

            NSLayoutConstraint.activate([edgeConstraint, leftConstraint, rightConstraint])

            return (edgeConstraint, leftConstraint, rightConstraint)
    }


    /// Applies constraints to the view to make it fill a vertical edge (i.e., stretch along it).
    /// The view's `width` can be constrained by using the `layout.width()` method.
    ///
    /// - parameters:
    ///   - edge: Vertical (`left` or `right`) `SidedLayoutItem` to fill against.
    ///           Use `inside` to fill along the inside of a view, and `outside` to fill along the outside of it.
    ///   - insets: Optional `UIEdgeInsets` to add padding around the view.
    ///
    /// - returns: A labeled tuple containing the applied `top`, `bottom`, and `edge` (either `left` or `right`) constraints.

    @discardableResult public func fill(_ edge: SidedLayoutItem<XAxis>, _ insets: UIEdgeInsets = UIEdgeInsets.zero) ->
        (edgeConstraint: NSLayoutConstraint,
        topConstraint: NSLayoutConstraint,
        bottomConstraint: NSLayoutConstraint) {

            guard let layoutRegion = edge.layoutItem.item as? LayoutRegion else {
                fatalError("Invalid layout item.")
            }

            let edgeConstraint: NSLayoutConstraint

            switch (edge.layoutItem.attribute, edge.side) {
            case (.left, .inside), (.right, .outside):
                edgeConstraint = (base.left == edge.layoutItem + insets.left)
            case (.right, .inside), (.left, .outside):
                edgeConstraint = (base.right == edge.layoutItem - insets.right)
            default:
                fatalError("Invalid layout item.")
            }

            let topConstraint = (base.top == layoutRegion.top + insets.top)
            let bottomConstraint = (base.bottom == layoutRegion.bottom - insets.bottom)

            NSLayoutConstraint.activate([edgeConstraint, topConstraint, bottomConstraint])

            return (edgeConstraint, topConstraint, bottomConstraint)
    }

}
