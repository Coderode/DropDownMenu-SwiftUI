//
//  ContentView.swift
//  DropDownMenu-SwiftUI
//
//  Created by Sandeep on 20/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var shouldShowDropdown = false
    var displayText = "Drop down Menu"
    var options = [
        DropdownModel(key: "a", val: "Orange"),
        DropdownModel(key: "b", val: "Mango"),
        DropdownModel(key: "c", val: "Banana"),
        DropdownModel(key: "d", val: "Apple"),
        DropdownModel(key: "e", val: "Grapes"),
        DropdownModel(key: "f", val: "Guava")
    ]
    var body: some View {
        let onSelect : ((_ selectedOption: DropdownModel) -> Void)? = { selectedOption in
            self.shouldShowDropdown = false
        }
        VStack {
            Dropdown(shouldShowDropdown: self.$shouldShowDropdown, displayText: displayText, options: self.options, onSelect: onSelect, buttonHeight: 52, cornerRadius: 12)
        }
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0.0, y: 0.0)
        .onTapBackground(enabled: true) {
            self.shouldShowDropdown = false
        }
    }
}

#Preview {
    ContentView()
}
