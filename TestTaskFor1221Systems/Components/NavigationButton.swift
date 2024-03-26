//
//  NavigationButton.swift
//  TestTaskFor1221Systems
//
//  Created by Илья Десятов on 26.03.2024.
//

import SwiftUI

struct NavigationButton: View {
    
    let navButton: NavigationsButtons
    let action: () -> ()
        
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: navButton.imageTitle)
                .font(.title)
                .foregroundColor(.green)
                
        }
    }
}

extension NavigationButton {
    enum NavigationsButtons: String {
        case bullet, arrowLeft, arrowUp, heart
        
        var imageTitle: String {
            switch self {
            case .bullet:
                return "list.bullet.rectangle.portrait.fill"
            case .arrowLeft:
                return "arrowshape.left.fill"
            case .arrowUp:
                return "arrowshape.up.fill"
            case .heart:
                return "heart.fill"
            }
        }
    }

}

#Preview {
    NavigationButton(navButton: .heart, action: {} )
}
