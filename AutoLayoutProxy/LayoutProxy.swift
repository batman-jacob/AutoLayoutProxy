//
//  LayoutProxy.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 28/10/18.
//  Copyright © 2018 Bibin Jacob Pulickal. All rights reserved.
//

import UIKit

public class LayoutProxy {
    
    private let view: UIView
    private let superView: UIView
    
    public lazy var leading = property(with: view.leadingAnchor)
    public lazy var trailing = property(with: view.trailingAnchor)
    public lazy var top = property(with: view.topAnchor)
    public lazy var bottom = property(with: view.bottomAnchor)
    public lazy var left = property(with: view.leftAnchor)
    public lazy var right = property(with: view.rightAnchor)
    public lazy var width = property(with: view.widthAnchor)
    public lazy var height = property(with: view.heightAnchor)
    public lazy var centerX = property(with: view.centerXAnchor)
    public lazy var centerY = property(with: view.centerYAnchor)
    
    public lazy var size = properties(with: [view.widthAnchor, view.heightAnchor])
    
    init(view: UIView, superView: UIView) {
        self.view = view
        self.superView = superView
    }
    
    private func property<A>(with anchor: A) -> LayoutProperty<A> {
        return LayoutProperty(anchor: anchor)
    }
    
    private func properties<A>(with anchors: [A]) -> [LayoutProperty<A>] {
        return anchors.map({LayoutProperty(anchor: $0)})
    }
}

public extension LayoutProxy {
    
    public func fillSuperView(padding: UIEdgeInsets = .zero) {
        fillView(superView, padding: padding)
    }
    
    public func fillView(_ view: UIView, padding: UIEdgeInsets = .zero) {
        top == view.topAnchor + padding.top
        bottom == view.bottomAnchor - padding.bottom
        leading == view.leadingAnchor + padding.left
        trailing == view.trailingAnchor - padding.right
    }
    
    public func alignCentersToSuperView() {
        alignCenters(to: superView)
    }
    
    public func alignCenters(to view: UIView) {
        centerX == view.centerXAnchor
        centerY == view.centerYAnchor
    }
}
