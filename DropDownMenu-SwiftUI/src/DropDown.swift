//
//  DropDown.swift
//  DropDownMenu-SwiftUI
//
//  Created by Sandeep on 20/10/23.
//

import Foundation
import SwiftUI
struct Dropdown: View {
    @Binding var shouldShowDropdown : Bool
    @State var displayText: String
    @State var options: [DropdownModel]
    @State var selectedOption : DropdownModel?
    var onSelect: ((_ selectedOption: DropdownModel) -> Void)?
    var buttonHeight: CGFloat = 45
    var cornerRadius : CGFloat = CGFloat(8.0)
    var textColor: Color = Color.gray.opacity(0.5)
    var menuTextColor: Color = Color.gray.opacity(0.8)
    var menuSelectTextColor: Color = Color.black
    var borderColor: Color = Color.gray.opacity(0.5)
    var borderWidth: CGFloat = 0.5
    var backgroundColor: Color = Color.white
    var menuBackgroundColor: Color = Color.white
    var menuSelectItemBackgroundColor: Color = Color.gray.opacity(0.1)
    var textFont: Font = Font(CTFont(.menuTitle, size: 18))
    var menuTextFont: Font = Font(CTFont(.menuItem, size: 18))
    var internalPadding : CGFloat = 24
    var maxHeight : CGFloat = 250
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(borderColor, lineWidth: borderWidth)
                .frame(width: .infinity, height: buttonHeight, alignment: .center)
                .overlay(
                    VStack {
                        if self.shouldShowDropdown {
                            VStack {
                                DropDownMenu(options: self.$options, selectedOption: self.$selectedOption, elementHeight: self.buttonHeight - 5, cornerRadius: self.cornerRadius, menuTextColor: menuTextColor, menuSelectTextColor: menuSelectTextColor, borderColor: borderColor, borderWidth: borderWidth, menuBackgroundColor : menuBackgroundColor, menuSelectItemBackgroundColor: menuSelectItemBackgroundColor, internalPadding: internalPadding, textFont: menuTextFont, maxHeight: maxHeight, onSelect: { selectedOption in
                                    self.displayText = selectedOption.val
                                    self.onSelect?(selectedOption)
                                }).frame(width: .infinity, height: .infinity, alignment: .center).zIndex(1)
                                    .fixedSize(horizontal: false, vertical: false)
                            }
                        }
                    }, alignment: .topLeading
                )
            HStack {
                Text(displayText)
                    .foregroundColor(textColor)
                    .font(textFont)
                Spacer()
                Image(systemName: self.shouldShowDropdown ? "chevron.up" : "chevron.down").foregroundColor(Color.black)
            }
            .padding(.horizontal, internalPadding)
            .cornerRadius(cornerRadius)
            .frame(height: self.buttonHeight)
            .zIndex(10)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .background(backgroundColor)
            .containerShape(RoundedRectangle(cornerRadius: cornerRadius))
            .background(
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
            )
            .onTapGesture {
                self.shouldShowDropdown.toggle()
            }
        }.background(Color.clear)
            .padding(.horizontal,0)
    }
}
