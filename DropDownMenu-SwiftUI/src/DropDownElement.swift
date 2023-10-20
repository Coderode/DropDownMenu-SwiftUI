//
//  DropDownElement.swift
//  DropDownMenu-SwiftUI
//
//  Created by Sandeep on 20/10/23.
//

import Foundation
import SwiftUI

struct DropdownElement: View {
    var val: String
    var key: String
    var element: DropdownModel?
    var isSelected : Bool = false
    var textColor = Color.black
    var selectTextColor = Color.black
    var elementHeight : CGFloat = CGFloat(45)
    var separatorColor: Color = Color.gray.opacity(0.2)
    var menuBackgroundColor: Color = Color.white
    var menuSelectItemBackgroundColor: Color = Color.white
    var internalPadding : CGFloat = 24
    var textFont: Font = Font(CTFont(.menuItem, size: 18))
    var onSelect: ((_ selectedOption: DropdownModel) -> Void)?
    var body: some View {
        VStack {
            Rectangle().frame(width: .infinity, height: 0.5, alignment: .center)
                .foregroundColor(Color.clear)
                .padding(.horizontal, internalPadding / 2.0)
            ZStack {
                VStack {
                    HStack {
                        Text(self.val)
                            .foregroundColor(
                                element?.isSelected ?? false ? selectTextColor : textColor
                            )
                            .font(textFont)
                        Spacer()
                    }
                }
                .frame(width: .infinity, height: elementHeight, alignment: .center)
                .padding(.horizontal, internalPadding)
            }
            Rectangle().frame(width: .infinity, height: 0.5, alignment: .center)
                .foregroundColor(separatorColor)
                .padding(.horizontal, internalPadding / 2.0)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if let onSelect = self.onSelect, let element = self.element {
                element.isSelected = true
                onSelect(element)
            }
        }.background(
            element?.isSelected ?? false ? menuSelectItemBackgroundColor : menuBackgroundColor
        )
    }
}
