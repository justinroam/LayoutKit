//
//  Licensed under the MIT license.
//  See https://github.com/indragiek/SwiftAutoLayout
//
//  SwiftAutoLayout.swift
//  LayoutKit
//
//  Modified by Avario.
//

import UIKit

public protocol AttributeType { }

public struct XAxis: AttributeType { }
public struct YAxis: AttributeType { }
public struct Dimension: AttributeType { }

public struct LayoutItem<I, A: AttributeType> {

    var item: I
    var attribute: NSLayoutAttribute
    var multiplier: CGFloat
    var constant: CGFloat

    fileprivate func constrain<I, A>(_ toItem: LayoutItem<I, A>, _ relation: NSLayoutRelation) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: attribute, relatedBy: relation, toItem: toItem.item, attribute: toItem.attribute, multiplier: toItem.multiplier / multiplier, constant: toItem.constant - constant)
    }

    fileprivate func constrain(_ toConstant: CGFloat, _ relation: NSLayoutRelation) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: attribute, relatedBy: relation, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0 / multiplier, constant: toConstant - constant)
    }

    fileprivate func withMultiplier(_ multiplier: CGFloat) -> LayoutItem {
        return LayoutItem(item: item, attribute: attribute, multiplier: multiplier, constant: constant)
    }

    fileprivate func withConstant(_ constant: CGFloat) -> LayoutItem {
        return LayoutItem(item: item, attribute: attribute, multiplier: multiplier, constant: constant)
    }
}

public protocol LayoutRegion { }

extension UIView: LayoutRegion { }
extension UILayoutGuide: LayoutRegion { }

public extension LayoutRegion {

    fileprivate func layoutItem<A>(_ attribute: NSLayoutAttribute) -> LayoutItem<LayoutRegion, A> {
        return LayoutItem(item: self, attribute: attribute, multiplier: 1, constant: 0)
    }

    public var left: LayoutItem<LayoutRegion, XAxis> { return layoutItem(.left) }
    public var right: LayoutItem<LayoutRegion, XAxis> { return layoutItem(.right) }
    public var top: LayoutItem<LayoutRegion, YAxis> { return layoutItem(.top) }
    public var bottom: LayoutItem<LayoutRegion, YAxis> { return layoutItem(.bottom) }
    public var width: LayoutItem<LayoutRegion, Dimension> { return layoutItem(.width) }
    public var height: LayoutItem<LayoutRegion, Dimension> { return layoutItem(.height) }
    public var centerX: LayoutItem<LayoutRegion, XAxis> { return layoutItem(.centerX) }
    public var centerY: LayoutItem<LayoutRegion, YAxis> { return layoutItem(.centerY) }
}

public extension UILayoutSupport {
    fileprivate func layoutItem<A>(_ attribute: NSLayoutAttribute) -> LayoutItem<UILayoutSupport, A> {
        return LayoutItem(item: self, attribute: attribute, multiplier: 1, constant: 0)
    }

    public var top: LayoutItem<UILayoutSupport, YAxis> { return layoutItem(.top) }
    public var bottom: LayoutItem<UILayoutSupport, YAxis> { return layoutItem(.bottom) }
    public var height: LayoutItem<UILayoutSupport, Dimension> { return layoutItem(.height) }
}

public func * <I, A>(lhs: LayoutItem<I, A>, rhs: CGFloat) -> LayoutItem<I, A> {
    return lhs.withMultiplier(lhs.multiplier * rhs)
}

public func / <I, A>(lhs: LayoutItem<I, A>, rhs: CGFloat) -> LayoutItem<I, A> {
    return lhs.withMultiplier(lhs.multiplier / rhs)
}

public func + <I, A>(lhs: LayoutItem<I, A>, rhs: CGFloat) -> LayoutItem<I, A> {
    return lhs.withConstant(lhs.constant + rhs)
}

public func - <I, A>(lhs: LayoutItem<I, A>, rhs: CGFloat) -> LayoutItem<I, A> {
    return lhs.withConstant(lhs.constant - rhs)
}

public func == <I1, I2, A1, A2>(lhs: LayoutItem<I1, A1>, rhs: LayoutItem<I2, A2>) -> NSLayoutConstraint {
    return lhs.constrain(rhs, .equal)
}

public func >= <I1, I2, A1, A2>(lhs: LayoutItem<I1, A1>, rhs: LayoutItem<I2, A2>) -> NSLayoutConstraint {
    return lhs.constrain(rhs, .greaterThanOrEqual)
}

public func <= <I1, I2, A1, A2>(lhs: LayoutItem<I1, A1>, rhs: LayoutItem<I2, A2>) -> NSLayoutConstraint {
    return lhs.constrain(rhs, .lessThanOrEqual)
}


public func == (lhs: LayoutItem<LayoutRegion, Dimension>, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.constrain(rhs, .equal)
}

public func >= (lhs: LayoutItem<LayoutRegion, Dimension>, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.constrain(rhs, .greaterThanOrEqual)
}

public func <= (lhs: LayoutItem<LayoutRegion, Dimension>, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.constrain(rhs, .lessThanOrEqual)
}


infix operator ~: LogicalConjunctionPrecedence

public func ~(lhs: NSLayoutConstraint, rhs: UILayoutPriority) -> NSLayoutConstraint {
    let newConstraint = NSLayoutConstraint(item: lhs.firstItem, attribute: lhs.firstAttribute, relatedBy: lhs.relation, toItem: lhs.secondItem, attribute: lhs.secondAttribute, multiplier: lhs.multiplier, constant: lhs.constant)
    newConstraint.priority = rhs
    return newConstraint
}
