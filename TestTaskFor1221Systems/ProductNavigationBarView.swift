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
                    Button {
                        
                    } label: {
                        Image(systemName: "arrowshape.left.fill")
                            .font(.title)
                            .foregroundColor(.green)
                            
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "list.bullet.rectangle.portrait.fill")
                                .font(.title)
                                .foregroundColor(.green)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrowshape.up.fill")
                                .font(.title)
                                .foregroundColor(.green)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "heart.fill")
                                .font(.title)
                                .foregroundColor(.green)
                        }
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
