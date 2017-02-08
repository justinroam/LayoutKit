//
//  Size.swift
//  LayoutKit
//
//  Created by Avario.
//

import Foundation
import UIKit

public extension Layout {

    /// Applies constant `width` and `height` constraints to the view.
    ///
    /// - parameters:
    ///   - width: Constant to be used to create the `width` constraint.
    ///   - height: Constant to be used to create the `height` constraint.
    ///
    /// - returns: A labeled tuple containing the applied `width` and `height` constraints.

    @discardableResult public func size(width: CGFloat, height: CGFloat) ->
        (widthConstraint: NSLayoutConstraint,
        heightConstraint: NSLayoutConstraint) {

            let widthConstraint = (base.width == width)
            let heightConstraint = (base.height == height)

            NSLayoutConstraint.activate([widthConstraint, heightConstraint])

            return (widthConstraint, heightConstraint)
    }


    /// Applies a single constant to both the `width` and `height` constraints of the view.
    /// This makes the view a square.
    ///
    /// - parameters:
    ///   - size: Constant to be used to create the `width` and `height`constraints.
    ///
    /// - returns: A labeled tuple containing the applied `width` and `height` constraints.

    @discardableResult public func size(_ size: CGFloat) ->
        (widthConstraint: NSLayoutConstraint,
        heightConstraint: NSLayoutConstraint) {

            return self.size(width: size, height: size)
    }


    /// Applies a constant `width` constraint to the view.
    ///
    /// - parameters:
    ///   - width: Constant to be used to create the constraint.
    ///
    /// - returns: The applied `width` constraint.

    @discardableResult public func width(_ width: CGFloat) -> NSLayoutConstraint {

        let widthConstraint = (base.width == width)
        widthConstraint.isActive = true

        return widthConstraint
    }


    /// Applies a constant `height` constraint to the view.
    ///
    /// - parameters:
    ///   - width: Constant to be used to create the constraint.
    ///
    /// - returns: The applied `height` constraint.

    @discardableResult public func height(_ height: CGFloat) -> NSLayoutConstraint {

        let heightConstraint = (base.height == height)
        heightConstraint.isActive = true

        return heightConstraint
    }

}
