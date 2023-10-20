//
//  DropDownModel.swift
//  DropDownMenu-SwiftUI
//
//  Created by Sandeep on 20/10/23.
//

import Foundation
class DropdownModel: Identifiable {
    var id = UUID()
    var key: String
    var val: String
    var isSelected: Bool = false
    init(id: UUID = UUID(), key: String, val: String, isSelected: Bool = false) {
        self.id = id
        self.key = key
        self.val = val
        self.isSelected = isSelected
    }
}
