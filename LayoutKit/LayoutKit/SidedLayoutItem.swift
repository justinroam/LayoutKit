//
//  SidedLayoutItem.swift
//  LayoutKit
//
//  Created by Avario.
//

import Foundation
import UIKit

/// The side of an edge to be layed out on.
internal enum LayoutSide {
    case outside
    case inside
}

/// A layout item with an additional `side` property.
public struct SidedLayoutItem<C> {

    /// The side to be layed out on.
    internal let side: LayoutSide

    /// The layout item to be used for layout.
    public let layoutItem: LayoutItem<C>
}

public extension LayoutItem {

    /// Returns a `SidedLayoutItem` with `self` on the `outside`.
    public var outside: SidedLayoutItem<C> {
        return SidedLayoutItem(side: .outside, layoutItem: self)
    }

    /// Returns a `SidedLayoutItem` with `self` on the `inside`.
    public var inside: SidedLayoutItem<C> {
        return SidedLayoutItem(side: .inside, layoutItem: self)
    }
}

public func +<C>(lhs: SidedLayoutItem<C>, rhs: CGFloat) -> SidedLayoutItem<C> {
    return SidedLayoutItem(side: lhs.side, layoutItem: lhs.layoutItem + rhs)
}

public func -<C>(lhs: SidedLayoutItem<C>, rhs: CGFloat) -> SidedLayoutItem<C> {
    return SidedLayoutItem(side: lhs.side, layoutItem: lhs.layoutItem - rhs)
}
