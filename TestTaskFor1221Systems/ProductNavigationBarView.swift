//
//  ProductNavigationBarView.swift
//  TestTaskFor1221Systems
//
//  Created by Илья Десятов on 02.02.2024.
//

import SwiftUI

struct NavigationBarView<Content: View >: View {
    let content: () -> Content
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    NavigationButton(navButton: .arrowLeft) {}
                    
                    Spacer()
                    
                    HStack {
                        NavigationButton(navButton: .bullet) {}
                        
                        NavigationButton(navButton: .arrowUp) {}
                        
                        NavigationButton(navButton: .heart) {}
                    }
                }
                .padding()
                Divider()
            }
            .frame(height: 80)
            Spacer()
            content()
            Spacer()
        }
    }
}

struct anyStruct: View {
    var body: some View {
        NavigationBarView {
            MainTabView()
            
        }
    }
}

#Preview {
    anyStruct()
}
