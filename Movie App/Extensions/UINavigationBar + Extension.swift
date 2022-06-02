//
//  UINavigationBar + Extension.swift
//  Movie App
//
//  Created by Eugene Kotovich on 02.06.2022.
//

import UIKit

extension UINavigationBar {
    
    public func setupNavigationBar(barColor: UIColor, textColor: UIColor) {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = barColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: textColor]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: textColor]
        self.standardAppearance = coloredAppearance
        self.scrollEdgeAppearance = coloredAppearance

        self.tintColor = textColor
        self.prefersLargeTitles = true
    }
}
