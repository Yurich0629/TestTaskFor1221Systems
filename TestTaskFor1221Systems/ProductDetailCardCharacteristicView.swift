//
//  ProductDetailCardCharacteristicView.swift
//  TestTaskFor1221Systems
//
//  Created by Илья Десятов on 04.02.2024.
//

import SwiftUI

struct Product: Identifiable {
    var id = UUID().uuidString
    var title: String
    var property: String
}




struct DotView: View {
    var body: some View {
        Text(".")
            .frame(width: 8, height: 20)
    }
}

struct DottedKeyValueView: View {

    var products: [Product]
    
    var body: some View {
        ScrollView {
            ForEach(products) { item in
                HStack(alignment: .bottom) {
                    Text(item.title)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(nil)
                        .layoutPriority(1)
                    Spacer()
                    GeometryReader { geometry in
                        VStack {
                            
                            Spacer()
                            
                            HStack(
                                alignment: .bottom, spacing: 0) {
                                    let dotWidth: CGFloat = 8
                                    let totalDots = Int((geometry.size.width - dotWidth) / dotWidth)
                                    ForEach(0..<totalDots, id: \.self) { _ in
                                        DotView()
                                    }
                                }
                        }
                    }
                    Spacer()
                    Text(item.property)
                        .lineLimit(2)
                        .layoutPriority(2)
                        .multilineTextAlignment(.trailing)

                }
                .padding(.vertical)
                
                
            }
        }
    }
}

#Preview {
    DottedKeyValueView(products: [
        Product(title: "Производство", property: "Россия, Краснодарский \nкрай"),
        Product(title: "Энергетическая ценность, ккал/100г", property: "25 ккал, 105 \nкДж"),
        Product(title: "Жиры/100г", property: "0,1г"),
        Product(title: "Белки/100г", property: "1,3г"),
        Product(title: "Углеводы/100г", property: "3,3")
    ])
}

