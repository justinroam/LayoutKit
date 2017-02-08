//
//  Size.swift
//  LayoutKit
//
//  Created by Avario.
//

import Foundation
import UIKit

public extension CGSize {

    /// Creates a square `CGSize`.
    ///
    /// - parameters:
    ///   - square: `CGFloat` used for both the `width` and `height` of the `CGSize`.
    ///

    public init(_ square: CGFloat) {
        self.init(width: square, height: square)
    }

}
