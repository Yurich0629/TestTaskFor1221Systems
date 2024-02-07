//
//  DataFromBackOffice.swift
//  TestTaskFor1221Systems
//
//  Created by Илья Десятов on 05.02.2024.
//

import Foundation

struct ProductDetailCard {
    
    let name: String
    let image: String
    let country: String
    let description: String
    let price: Double
    let priceWithDiscount: Double?
    let characteristics: [ProductCharacteristic]
    let reviews: Reviews
    
    static func mockData() -> Self {
        .init(name: "Добавка 'Облепиха' к чаю 200 г",
              image: "Product",
              country: "Испания, Риоха",
              description: "Флавоноиды облепихового цвета обладают противовоспалительным действием, способствуют укреплению стенки сосудов(наверное :) ).",
              price: 199.0,
              priceWithDiscount: 55.9,
              characteristics: [.init(title: "Производство", description: "Россия, Краснодарский \nкрай"),
                                .init(title: "Энергетическая ценность, ккал/100г", description: "25 ккал, 105 \nкДж"),
                                .init(title: "Жиры/100г", description: "0,1г"),
                                .init(title: "Белки/100г", description: "1,3г"),
                                .init(title: "Углеводы/100г", description: "3,3")
              ],
              reviews: .mockData()
        )
        
        }
    
}




struct Characteristics {
    let production: String
    let energyValue: [Int]
    let fats: Double
    let proteins: Double
    let carbohydrates: Double
}

struct Reviews {
    let middleGrade: String
    let countsReviews: Int
    let miniReviews: Int
    let review: [Review]
    
    static func mockData() -> Self {
        Reviews(middleGrade: "4.1",
                countsReviews: 152, 
                miniReviews: 19,
                review: [.init(userName: "Александр В.",
                               dateReview: "7 мая 2021",
                               userMessage: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!",
                               rating: 4),
                         .init(userName: "Александр В.",
                               dateReview: "7 мая 2021",
                               userMessage: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!",
                               rating: 4),
                         .init(userName: "Александр В.",
                               dateReview: "7 мая 2021",
                               userMessage: "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!",
                               rating: 4)
                ]
        )
    }
}

struct Review: Identifiable {
    let id = UUID()
    let userName: String
    let dateReview: String
    let userMessage: String
    let rating: Int
}

struct ProductCharacteristic  {
    let title: String
    let description: String
}

extension Double {
var clean: String {
        self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(format: "%.2f", self)
}
}
