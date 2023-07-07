//
//  UIViewExtansion.swift
//  Navigation
//
//  Created by NikkiLodeon on 6/23/23.
//

import UIKit

extension UIView {
    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

