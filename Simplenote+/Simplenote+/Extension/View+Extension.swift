//
//  View+Extension.swift
//  Simplenote+
//
//  Created by Gustavo Severo on 05/04/20.
//  Copyright © 2020 Severo. All rights reserved.
//

import SwiftUI

extension View {
    func embedInScrollView(alignment: Alignment = .center) -> some View {
        GeometryReader { proxy in
            ScrollView {
                self.frame(
                    minHeight: proxy.size.height,
                    maxHeight: .infinity,
                    alignment: alignment
                )
            }
        }
    }
}
