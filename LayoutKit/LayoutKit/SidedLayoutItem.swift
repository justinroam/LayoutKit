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
public struct SidedLayoutItem<I, A: AttributeType> {

    /// The side to be layed out on.
    internal let side: LayoutSide

    /// The layout item to be used for layout.
    public let layoutItem: LayoutItem<I, A>
}

public extension LayoutItem {

    /// Returns a `SidedLayoutItem` with `self` on the `outside`.
    public var outside: SidedLayoutItem<I, A> {
        return SidedLayoutItem(side: .outside, layoutItem: self)
    }

    /// Returns a `SidedLayoutItem` with `self` on the `inside`.
    public var inside: SidedLayoutItem<I, A> {
        return SidedLayoutItem(side: .inside, layoutItem: self)
    }
}

public func + <I, A>(lhs: SidedLayoutItem<I, A>, rhs: CGFloat) -> SidedLayoutItem<I, A> {
    return SidedLayoutItem(side: lhs.side, layoutItem: lhs.layoutItem + rhs)
}

public func - <I, A>(lhs: SidedLayoutItem<I, A>, rhs: CGFloat) -> SidedLayoutItem<I, A> {
    return SidedLayoutItem(side: lhs.side, layoutItem: lhs.layoutItem - rhs)
}
