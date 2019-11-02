//
//  AutoLayoutableHelpers.swift
//  AutoLayoutProxy
//
//  Created by Bibin Jacob Pulickal on 24/08/19.
//  Copyright © 2019 Bibin Jacob Pulickal. All rights reserved.
//

public extension AutoLayoutable {

    func addSubview(_ view: View, layout: (() -> Void)) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        layout()
    }

    func addSubview(_ view: View, layout: ((View) -> Void)) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        layout(view)
    }

    func addSubview(_ view: View, layout: ((View, Self) -> Void)) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        layout(view, self)
    }
}