//
//  Offset.swift
//  LayoutKit
//
//  Created by Avario.
//

import Foundation
import UIKit

public extension UIOffset {

    /// Creates an `UIOffset` by specifying only horizontal of vertical offset.
    /// The offset not specified will be set to `others` (default `0`).
    ///
    /// - parameters:
    ///   - horizontal: The horizontal offset.
    ///   - vertical: The vertical offset.
    ///   - others: Value applied to unspecified offsets.
    ///
    /// - Note: `others` is really only included here to avoid name conflict with default initializer.

    public init(horizontal: CGFloat? = nil, vertical: CGFloat? = nil, others: CGFloat = 0) {
        self.init(horizontal: horizontal ?? others, vertical: vertical ?? others)
    }

}
