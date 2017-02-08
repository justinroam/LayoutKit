//
//  LayoutProxy.swift
//  LayoutKit
//
//  Created by Avario.
//

import Foundation
import UIKit

public extension LayoutRegion {

    /// Proxy used to access layout helper methods.
    var layout: Layout {

        if let `self` = self as? UIView {
            self.translatesAutoresizingMaskIntoConstraints = false
        }

        return Layout(self)
    }

}

public struct Layout {

    /// The layout region the proxy applies to.
    public let base: LayoutRegion


    /// Construct a proxy.
    ///
    /// - parameters:
    ///   - layoutRegion: The layout region to by proxied.

    fileprivate init(_ layoutRegion: LayoutRegion) {
        self.base = layoutRegion
    }

}
