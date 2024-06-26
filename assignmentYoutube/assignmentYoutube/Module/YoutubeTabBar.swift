//
//  YoutubeTabBar.swift
//  assignmentYoutube
//
//  Created by Roh on 4/25/24.
//

enum YoutubeTabBar: CaseIterable {
    case home(title: String, icon: String)
    case short(title: String, icon: String)
    case add(title: String, icon: String)
    case subscribe(title: String, icon: String)
    case storage(title: String, icon: String)
    
    static var allCases: [YoutubeTabBar] = [
        .home(title: "Home", icon: "homeIcon"),
        .short(title: "Short", icon: "shortsIcon"),
        .add(title: "Add", icon: "plueCircleIcon"),
        .subscribe(title: "Subscribe", icon: "subscriptionsIcon"),
        .storage(title: "Storage", icon: "LibraryIcon")
    ]
}

extension YoutubeTabBar {
    var title: String {
        switch self {
        case .home(let title, _),
            .short(let title, _),
            .add(let title, _),
            .subscribe(let title, _),
            .storage(let title, _):
           return title
       }
    }
    
    var icon: String {
        switch self {
        case .home(_, let icon),
             .short(_, let icon),
             .add(_, let icon),
             .subscribe(_, let icon),
             .storage(_, let icon):
            return icon
        }
    }
}
