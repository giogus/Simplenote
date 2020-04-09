//
//  AuthControlView.swift
//  Simplenote+
//
//  Created by Gustavo Severo on 06/04/20.
//  Copyright © 2020 Severo. All rights reserved.
//

import SwiftUI

struct AuthControlView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        VStack {
            
            Spacer()
            SNButton(text: " Sign in with Apple",
                     action: dismissView,
                     accentColor: .white,
                     backgroundColor: .black)
                .accessibility(label: Text("Sign in with Apple"))
            
            HStack {
                Color.black
                    .frame(height: 2.0)
                    .opacity(0.25)
                Text("or")
                    .accessibility(hidden: true)
                Color.black
                    .frame(height: 2.0)
                    .opacity(0.25)
            }
            .padding(.horizontal, 20.0)
            
            SNButton(text: "Sign Up",
                     action: dismissView,
                     accentColor: .white,
                     backgroundColor: .pink)
            
            SNButton(text: "Sign In",
                     action: dismissView,
                     accentColor: .pink,
                     backgroundColor: .clear)
        }.padding(.bottom, 16.0)
    }
    
    func dismissView(){
        self.viewModel.states.isAuthViewPresented = false
    }
}


struct AuthControlView_Previews: PreviewProvider {
    
    static var page: some View {
        AuthControlView().environmentObject(ViewModel())
    }
    
    static var previews: some View {
        Group {
            page
                .previewDevice("iPhone SE")
                .environment(\.colorScheme, .dark)
            
            page
                .previewDevice("iPhone 8 Plus")
                .environment(\.colorScheme, .light)
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            
            page
                .previewDevice("iPad Pro (12.9-inch) (4th generation)")
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        }
    }
    
    
}
