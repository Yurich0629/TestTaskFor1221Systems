//
//  ProductReviewCollectionView.swift
//  TestTaskFor1221Systems
//
//  Created by Илья Десятов on 02.02.2024.
//

import SwiftUI

struct ProductReviewCollectionView: View {
    
    var model: Reviews
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(spacing: 16) {
                ForEach(model.review) { item in
                    ZStack {
                        VStack(spacing: -8) {
                            HStack {
                                Text(item.userName)
                                    .bold()
                                    .font(.title3)
                                
                                Spacer()
                            }
                            .padding(8)
                            
                            HStack {
                                Text(item.dateReview)
                                    .foregroundColor(.gray)
                                
                                Spacer()
                            }
                            .padding(8)
                            
                            HStack {
                                ForEach(0..<5) { index in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(
                                            index < item.rating ? .yellow : .gray
                                        )
                                }
            
                                Spacer()
                            }
                            .padding(8)
                            
                            HStack {
                                Text(item.userMessage)
                            }
                            .padding(8)
                            
                            
                            .shadow(color: .black.opacity(20), radius: 12, x: 20, y: 160)
                        }
                    }
                    .frame(width: 260, height: 200)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 24.0))
                    .shadow(radius: 8)
                    
                }
            }
            .padding(.all,16)
            
            
        })
    }
        
    
    
}


#Preview {
    ProductReviewCollectionView(model: .mockData())
}
