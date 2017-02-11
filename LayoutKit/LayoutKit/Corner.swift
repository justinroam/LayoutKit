//
//  Corner.swift
//  LayoutKit
//
//  Created by Avario.
//

import Foundation
import UIKit

public extension Layout {

    /// Apply constraints to position the view in a corner created by any two edges.
    /// The view's `size` can be constrained by using the `layout.size()` method.
    ///
    /// - parameters:
    ///   - horizontalEdge: Horizontal (`top` or `bottom`) `SidedLayoutItem` to use as one edge of the corner.
    ///                     Use `inside` to position on the inside of a view, and `outside` to position on the outside of it.
    ///                     Use `+` and `-` operators to add padding.
    ///   - verticalEdge: Vertical (`left` or `right`) `SidedLayoutItem` to use as the other edge of the corner.
    ///                   Use `inside` to position on the inside of a view, and `outside` to position on the outside of it.
    ///                   Use `+` and `-` operators to add padding.
    ///
    /// - returns: A labeled tuple containing the applied `horizontalEdge` and `verticalEdge` constraints.

    @discardableResult public func corner<I>(_ horizontalEdge: SidedLayoutItem<I, YAxis>, _ verticalEdge: SidedLayoutItem<LayoutRegion, XAxis>) ->
    (horizontalEdgeConstraint: NSLayoutConstraint,
     verticalEdgeConstraint: NSLayoutConstraint) {

        let horizontalEdgeConstraint: NSLayoutConstraint

        switch (horizontalEdge.layoutItem.attribute, horizontalEdge.side) {
        case (.top, .inside), (.bottom, .outside):
            horizontalEdgeConstraint = (base.top == horizontalEdge.layoutItem)
        case (.bottom, .inside), (.top, .outside):
            horizontalEdgeConstraint = (base.bottom == horizontalEdge.layoutItem)
        default:
            fatalError("Invalid layout item.")
        }


        let verticalEdgeConstraint: NSLayoutConstraint

        switch (verticalEdge.layoutItem.attribute, verticalEdge.side) {
        case (.left, .inside), (.right, .outside):
            verticalEdgeConstraint = (base.left == verticalEdge.layoutItem)
        case (.right, .inside), (.left, .outside):
            verticalEdgeConstraint = (base.right == verticalEdge.layoutItem)
        default:
            fatalError("Invalid layout item.")
        }


        NSLayoutConstraint.activate([horizontalEdgeConstraint, verticalEdgeConstraint])

        return (horizontalEdgeConstraint, verticalEdgeConstraint)
    }

}
