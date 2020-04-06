//
//  SNButton.swift
//  Simplenote+
//
//  Created by Gustavo Severo on 05/04/20.
//  Copyright © 2020 Severo. All rights reserved.
//

import SwiftUI

struct SNButton: View {
    
    @Environment(\.sizeCategory) var sizeCategory
    
    let text: String
    let action: () -> Void
    let accentColor: Color
    let backgroundColor: Color
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            ZStack {
                backgroundColor
                Text(text)
                    .bold()
                    .accentColor(accentColor)
                    .font(.body)
                    .lineLimit(nil)
                
            }
        }
        .cornerRadius(12.5)
        .frame(height: heightForSizeCategory())
        .padding(.horizontal, 20.0)
        .lineLimit(nil)
        .multilineTextAlignment(.center)
    }
    
    func heightForSizeCategory() -> CGFloat {
        switch sizeCategory {
        case .accessibilityExtraExtraExtraLarge:
            return 175.0
        case .accessibilityExtraExtraLarge:
            return 150.0
        case .accessibilityExtraLarge:
            return 125.0
        case .accessibilityLarge:
            return 100.0
        case .accessibilityMedium:
            return 75.0
        default:
            return 50.0
        }
    }
}


struct SNButton_Previews: PreviewProvider {
    static var previews: some View {
        SNButton(text: "Example",
                 action: { print("Example") },
                 accentColor: .pink,
                 backgroundColor: .black)
    }
}
