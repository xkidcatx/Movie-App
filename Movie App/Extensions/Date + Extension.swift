//
//  Date + Extension.swift
//  Movie App
//
//  Created by Eugene Kotovich on 02.06.2022.
//

import Foundation

extension Date {
    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.string(from: self)
        return date
    }
}
