//
//  NotesView.swift
//  Simplenote+
//
//  Created by Gustavo Severo on 05/04/20.
//  Copyright © 2020 Severo. All rights reserved.
//

import SwiftUI

struct NotesView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            List(viewModel.model.notes) { note in
                VStack {
                    Text(note.text)
                }
            }
            .navigationBarItems(trailing:
                Button(action: {
                    withAnimation {
                        self.viewModel.states.isAuthViewPresented = true
                    }
                    
                }) {
                    Text("Save")
                        .font(.system(size: 16.0,
                                      weight: .bold,
                                      design: .default))
                        .accentColor(.pink)
                }
            )
            .navigationBarTitle("Notes")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $viewModel.states.isAuthViewPresented) {
            AuthView().environmentObject(self.viewModel)
        }
    }
}

// MARK: - Preview -
struct NotesView_Previews: PreviewProvider {
    
    static var page: some View {
        NotesView().environmentObject(ViewModel())
    }
    
    static var previews: some View {
        Group {
//            page
//                .previewDevice("iPhone SE")
//                .environment(\.colorScheme, .dark)
            
            //            page
            //                .previewDevice("iPhone 8 Plus")
            //                .environment(\.colorScheme, .light)
            //
            page
                .previewDevice("iPad Pro (12.9-inch) (4th generation)")
                .environment(\.colorScheme, .dark)
            page
            .previewDevice("iPad (7th generation)")
            .environment(\.colorScheme, .dark)
        }
    }
}
