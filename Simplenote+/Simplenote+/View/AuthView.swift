//
//  AuthView.swift
//  Simplenote+
//
//  Created by Gustavo Severo on 05/04/20.
//  Copyright © 2020 Severo. All rights reserved.
//

import SwiftUI

struct AuthView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "doc.text.fill")
                    .font(.system(size: 102.0,
                                  weight: .bold,
                                  design: .rounded))
                    .foregroundColor(.pink)
                    .accessibility(label: Text("Simplenote+ App Icon"))
                Spacer(minLength: 36.0)
                Text("Simplenote+")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                Spacer(minLength: 8.0)
                Text("The simplest way to keep notes.")
                    .font(.callout)
                    .multilineTextAlignment(.center)
                Spacer(minLength: 8.0)
                AuthControlView().environmentObject(viewModel)
            }
            .navigationBarItems(trailing:
                Button(action: {
                    self.dismissView()
                }) {
                    Text("Skip")
                        .font(.system(size: 16.0,
                                      weight: .bold,
                                      design: .default))
                        .accentColor(.pink)
                }
            )
                .embedInScrollView()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func dismissView(){
        self.viewModel.states.isAuthViewPresented = false
    }
}

// MARK: - Preview -
struct AuthView_Previews: PreviewProvider {
    
    static var page: some View {
        AuthView().environmentObject(ViewModel())
    }
    
    static var previews: some View {
        Group {
            page
                .previewDevice("iPhone SE")
                .environment(\.colorScheme, .dark)
            
            //            page
            //                .previewDevice("iPhone 8 Plus")
            //                .environment(\.colorScheme, .light)
            //
            //            page
            //            .previewDevice("iPad Pro (12.9-inch) (4th generation)")
        }
    }
}

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
