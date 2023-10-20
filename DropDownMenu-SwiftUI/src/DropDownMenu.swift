//
//  DropDownMenu.swift
//  DropDownMenu-SwiftUI
//
//  Created by Sandeep on 20/10/23.
//

import Foundation
import SwiftUI
struct DropDownMenu: View {
    @Binding var options: [DropdownModel]
    @Binding var selectedOption: DropdownModel?
    var elementHeight: CGFloat = 45
    var cornerRadius: CGFloat = CGFloat(8.0)
    var menuTextColor: Color = Color.black
    var menuSelectTextColor: Color = Color.black
    var separatorColor: Color = Color.gray.opacity(0.2)
    var borderColor: Color = Color.gray.opacity(0.5)
    var borderWidth: CGFloat = 0.5
    var menuBackgroundColor: Color = Color.white
    var menuSelectItemBackgroundColor: Color = Color.white
    var internalPadding : CGFloat = 24
    var textFont: Font = Font(CTFont(.menuItem, size: 18))
    var maxHeight : CGFloat = 250
    var onSelect: ((_ selectedOption: DropdownModel) -> Void)?
    var body: some View {
        let listHeight = CGFloat(options.count) * elementHeight
        let maxHeight = listHeight > maxHeight ? maxHeight + elementHeight : listHeight + 2 * elementHeight
        ScrollView {
            VStack(spacing: 0) {
                DropdownElement(val: "", key: "", elementHeight: elementHeight, separatorColor: Color.clear, menuBackgroundColor: Color.clear, onSelect: nil).frame(width: .infinity, height: elementHeight, alignment: .center)
                ForEach(Array(options.enumerated()), id: \.element.id) { index, option in
                    let sepColor = ((index+1) == options.count) ? Color.clear : separatorColor
                    DropdownElement(val: option.val, key: option.key, element: option, textColor : menuTextColor, selectTextColor : menuSelectTextColor, elementHeight: elementHeight, separatorColor: sepColor, menuBackgroundColor: menuBackgroundColor, menuSelectItemBackgroundColor: menuSelectItemBackgroundColor, internalPadding: internalPadding, textFont: textFont, onSelect: { selectedOption in
                        for item in options {
                            if item.key == selectedOption.key {
                                item.isSelected = true
                            } else {
                                item.isSelected = false
                            }
                        }
                        self.selectedOption = selectedOption
                        self.onSelect?(selectedOption)
                    })
                }
            }
        }
        .frame(width: .infinity, height: maxHeight, alignment: .center)
        .background(menuBackgroundColor)
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(borderColor, lineWidth: borderWidth)
        )
    }
}
