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

public protocol LayoutRegion: AnyObject {}

extension UIView: LayoutRegion {}
extension UILayoutGuide: LayoutRegion {}

public struct XAxis {}
public struct YAxis {}
public struct Dimension {}

public struct LayoutItem<C> {
    public let item: AnyObject
    public let attribute: NSLayoutAttribute
    public let multiplier: CGFloat
    public let constant: CGFloat
    
    fileprivate func constrain(_ secondItem: LayoutItem, relation: NSLayoutRelation) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: attribute, relatedBy: relation, toItem: secondItem.item, attribute: secondItem.attribute, multiplier: secondItem.multiplier, constant: secondItem.constant)
    }
    
    fileprivate func constrain(_ constant: CGFloat, relation: NSLayoutRelation) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: attribute, relatedBy: relation, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: constant)
    }
    
    fileprivate func itemWithMultiplier(_ multiplier: CGFloat) -> LayoutItem {
        return LayoutItem(item: self.item, attribute: self.attribute, multiplier: multiplier, constant: self.constant)
    }
    
    fileprivate func itemWithConstant(_ constant: CGFloat) -> LayoutItem {
        return LayoutItem(item: self.item, attribute: self.attribute, multiplier: self.multiplier, constant: constant)
    }
}

public func *<C>(lhs: LayoutItem<C>, rhs: CGFloat) -> LayoutItem<C> {
    return lhs.itemWithMultiplier(lhs.multiplier * rhs)
}

public func /<C>(lhs: LayoutItem<C>, rhs: CGFloat) -> LayoutItem<C> {
    return lhs.itemWithMultiplier(lhs.multiplier / rhs)
}

public func +<C>(lhs: LayoutItem<C>, rhs: CGFloat) -> LayoutItem<C> {
    return lhs.itemWithConstant(lhs.constant + rhs)
}

public func -<C>(lhs: LayoutItem<C>, rhs: CGFloat) -> LayoutItem<C> {
    return lhs.itemWithConstant(lhs.constant - rhs)
}

public func ==<C>(lhs: LayoutItem<C>, rhs: LayoutItem<C>) -> NSLayoutConstraint {
    return lhs.constrain(rhs, relation: .equal)
}

public func ==(lhs: LayoutItem<Dimension>, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.constrain(rhs, relation: .equal)
}

public func >=<C>(lhs: LayoutItem<C>, rhs: LayoutItem<C>) -> NSLayoutConstraint {
    return lhs.constrain(rhs, relation: .greaterThanOrEqual)
}

public func >=(lhs: LayoutItem<Dimension>, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.constrain(rhs, relation: .greaterThanOrEqual)
}

public func <=<C>(lhs: LayoutItem<C>, rhs: LayoutItem<C>) -> NSLayoutConstraint {
    return lhs.constrain(rhs, relation: .lessThanOrEqual)
}

public func <=(lhs: LayoutItem<Dimension>, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs.constrain(rhs, relation: .lessThanOrEqual)
}

private func layoutItem<C>(_ item: AnyObject, _ attribute: NSLayoutAttribute) -> LayoutItem<C> {
    return LayoutItem(item: item, attribute: attribute, multiplier: 1.0, constant: 0.0)
}

public extension LayoutRegion {
    public var left: LayoutItem<XAxis> { return layoutItem(self, .left) }
    public var right: LayoutItem<XAxis> { return layoutItem(self, .right) }
    public var top: LayoutItem<YAxis> { return layoutItem(self, .top) }
    public var bottom: LayoutItem<YAxis> { return layoutItem(self, .bottom) }
    public var leading: LayoutItem<XAxis> { return layoutItem(self, .leading) }
    public var trailing: LayoutItem<XAxis> { return layoutItem(self, .trailing) }
    public var width: LayoutItem<Dimension> { return layoutItem(self, .width) }
    public var height: LayoutItem<Dimension> { return layoutItem(self, .height) }
    public var centerX: LayoutItem<XAxis> { return layoutItem(self, .centerX) }
    public var centerY: LayoutItem<YAxis> { return layoutItem(self, .centerY) }
}

public extension UILayoutSupport {
    public var left: LayoutItem<XAxis> { return layoutItem(self, .left) }
    public var right: LayoutItem<XAxis> { return layoutItem(self, .right) }
    public var top: LayoutItem<YAxis> { return layoutItem(self, .top) }
    public var bottom: LayoutItem<YAxis> { return layoutItem(self, .bottom) }
    public var leading: LayoutItem<XAxis> { return layoutItem(self, .leading) }
    public var trailing: LayoutItem<XAxis> { return layoutItem(self, .trailing) }
    public var width: LayoutItem<Dimension> { return layoutItem(self, .width) }
    public var height: LayoutItem<Dimension> { return layoutItem(self, .height) }
    public var centerX: LayoutItem<XAxis> { return layoutItem(self, .centerX) }
    public var centerY: LayoutItem<YAxis> { return layoutItem(self, .centerY) }
}

public extension UIView {
    public var baseline: LayoutItem<YAxis> { return layoutItem(self, .lastBaseline) }
    
    @available(iOS 8.0, OSX 10.11, *)
    public var firstBaseline: LayoutItem<YAxis> { return layoutItem(self, .firstBaseline) }
    public var lastBaseline: LayoutItem<YAxis> { return layoutItem(self, .lastBaseline) }
}

public extension UIViewController {
    public var topLayoutGuideTop: LayoutItem<YAxis> {
        return layoutItem(topLayoutGuide, .top)
    }
    
    public var topLayoutGuideBottom: LayoutItem<YAxis> {
        return layoutItem(topLayoutGuide, .bottom)
    }
    
    public var bottomLayoutGuideTop: LayoutItem<YAxis> {
        return layoutItem(bottomLayoutGuide, .top)
    }
    
    public var bottomLayoutGuideBottom: LayoutItem<YAxis> {
        return layoutItem(bottomLayoutGuide, .bottom)
    }
}

public extension UIView {
    public var leftMargin: LayoutItem<XAxis> { return layoutItem(self, .leftMargin) }
    public var rightMargin: LayoutItem<XAxis> { return layoutItem(self, .rightMargin) }
    public var topMargin: LayoutItem<YAxis> { return layoutItem(self, .topMargin) }
    public var bottomMargin: LayoutItem<YAxis> { return layoutItem(self, .bottomMargin) }
    public var leadingMargin: LayoutItem<XAxis> { return layoutItem(self, .leadingMargin) }
    public var trailingMargin: LayoutItem<XAxis> { return layoutItem(self, .trailingMargin) }
    public var centerXWithinMargins: LayoutItem<XAxis> { return layoutItem(self, .centerXWithinMargins) }
    public var centerYWithinMargins: LayoutItem<YAxis> { return layoutItem(self, .centerYWithinMargins) }
}

infix operator ~ : LogicalConjunctionPrecedence

public func ~(lhs: NSLayoutConstraint, rhs: UILayoutPriority) -> NSLayoutConstraint {
    let newConstraint = NSLayoutConstraint(item: lhs.firstItem, attribute: lhs.firstAttribute, relatedBy: lhs.relation, toItem: lhs.secondItem, attribute: lhs.secondAttribute, multiplier: lhs.multiplier, constant: lhs.constant)
    newConstraint.priority = rhs
    return newConstraint
}
