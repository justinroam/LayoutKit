//
//  Rect.swift
//  LayoutKit
//
//  Created by Avario.
//

import Foundation
import UIKit

public extension CGRect {

    /// Creates `CGRect` of given size with origin `CGPoint.zero`.
    ///
    /// - parameters:
    ///   - size: Size of the `CGRect`.
    ///

    public init(size: CGSize) {
        self.init(origin: CGPoint.zero, size: size)
    }


    /// Creates a square `CGRect` with origin `CGPoint.zero`.
    ///
    /// - parameters:
    ///   - square: `CGFloat` used for both the `width` and `height` of the `CGRect`.
    ///

    public init(_ square: CGFloat) {
        self.init(size: CGSize(square))
    }

}
