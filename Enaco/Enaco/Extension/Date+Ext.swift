//
//  Date+Ext.swift
//  Enaco
//
//  Created by 송영모 on 2022/05/11.
//

import Foundation

extension Date {
    func getTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        print(dateFormatter.string(from: self))
        return dateFormatter.string(from: self)
    }
}
