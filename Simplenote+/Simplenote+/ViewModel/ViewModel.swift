//
//  ViewModel.swift
//  Simplenote+
//
//  Created by Gustavo Severo on 05/04/20.
//  Copyright © 2020 Severo. All rights reserved.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var states: AppStates = AppStates()
    @Published var model: AppModel = AppModel()
}

struct AppStates: Identifiable {
    let id = UUID()
    var isAuthViewPresented: Bool = false
}

struct AppModel: Identifiable {
    let id = UUID()
    var notes: [Note] = [Note(text: "I think that by adding the Sign In with Apple feature or letting the user try the app before registering on the app could improve the Sign Up Conversion Rate."),
                         Note(text: "Something that I've found at Wordpress for iOS it's a PageViewController that show the user the app value proposition without the need to Sign In or Signup. I think it could improve the Sign Up Conversion Rate also."),
                         Note(text: "Accessibility it's another thing that is really necessary for the app to be available to everyone, I think it's something that could also be improved on the app onboarding. "),
                         Note(text: "A little UX improvement for this screen could be a making it's presentation style a UIModalPresentationPageSheet. The user could dismiss this modal screen and go directly write a new note.")]
}
