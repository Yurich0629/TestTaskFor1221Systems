//
//  ContentView.swift
//  TestTaskFor1221Systems
//
//  Created by Илья Десятов on 02.02.2024.
//

import SwiftUI


struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView(productModel: .mockData())
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Главная")
                }
            Text("Second Tab")
                .tabItem {
                    Image(systemName: "menucard.fill")
                    Text("Каталог")
                }
            Text("Third Tab")
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Корзина")
                }
            Text("Fourth Tab")
                .tabItem {
                    Image(systemName: "person.fill" )
                    Text("Профиль")
                }
        }
        .font(.headline)
        .accentColor(.green)
    }
    
}

struct HomeView: View {
    @State var segmentIndex = 0
    
    var productModel: ProductDetailCard
    
    let divisions = ["Шт", "Кг"]
    
    @State private var counter = 0
    @State private var sum = 0
    
    var body: some View {
        
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 20) {
                    Group {
                        HStack {
                            Text("Цена по карте")
                                .frame(width: 120, height: 10)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.green)
                                .font(.system(size: 12))
                                .cornerRadius(10)
                            
                            Spacer()
                        }
                        
                        Image("Product")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 320, height: 360 )
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            
                            Text(productModel.reviews.middleGrade)
                                .font(.title2)
                            
                            Text("|" + "\(productModel.reviews.miniReviews)" + " отзывов")
                                .foregroundColor(.gray)
                                .font(.custom("AboutSize", size: 20))
                            
                            Spacer()
                            Image("Sale")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 44)
                        }
                        
                        
                        Text(productModel.name)
                            .font(.largeTitle)
                            .bold()
                        
                        HStack(spacing: 16) {
                            Image("Flag")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 36, height: 36)
                                .cornerRadius(18)
                            Text(productModel.country)
                            
                            Spacer()
                        }
                        
                        VStack(spacing: 12) {
                            HStack{
                                Text("Описание")
                                    .bold()
                                    .font(.title3)
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text(productModel.description)
                                
                                Spacer()
                            }
                        }
                        
                        DottedKeyValueView(products: [
                            Product(title: "Производство", property: "Россия, Краснодарский край"),
                            Product(title: "Энергетическая ценность, ккал/100г", property: "25 ккал, 105 кДж"),
                            Product(title: "Жиры/100г", property: "0,1г"),
                            Product(title: "Белки/100г", property: "1,3г"),
                            Product(title: "Углеводы/100г", property: "3,3")
                        ])
                        
                    }
                    
                    HStack {
                        Button {
                            print("Show all characteristics")
                        } label: {
                            Text("Все характеристики")
                                .bold()
                                .foregroundColor(.green)
                                .font(.title3)
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("Отзывы")
                            .font(.title)
                            .bold()
                        
                        Spacer()
                        
                        Button{
                            print("Open all messages")
                        } label: {
                            Text("Все " + "\(productModel.reviews.countsReviews)")
                                .font(.title3)
                                .foregroundColor(.green)
                                .bold()
                        }
                    }
                    
                }.padding(.horizontal, 16)
                
                ProductReviewCollectionView(model: productModel.reviews)
                    .padding(.horizontal, 16)
                
                Button {
                    print("Left some message")
                } label: {
                    Text("Оставить отзыв")
                        .frame(width: 270, height: 12)
                        .font(.custom("AvenirNext-Bold", size: 20))
                        .foregroundColor(.green)
                        .padding()
                        .padding(.horizontal, 20)
                        .background(Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.green, lineWidth: 3)
                        )
                }
                
                
                
                Divider()
                
                Spacer(minLength: 4)
                
            }
            
            
            Picker(selection: $segmentIndex, label: Text("")) {
                ForEach(0..<divisions.count) {
                    Text(self.divisions[$0]).tag($0)
                    
                }
            } .pickerStyle(SegmentedPickerStyle())
                .padding(8)
            
            Spacer()
            
            HStack {
                
                VStack(alignment: .leading) {
                    let isDiscount = productModel.priceWithDiscount != nil
                    
                    Text("\((productModel.priceWithDiscount ?? productModel.price))" + " ₽/кг ")
                        .bold()
                        .font(.system(size: 28))
                    if isDiscount {
                        Text("\(productModel.price.clean)")
                            .foregroundColor(.gray)
                            .strikethrough()
                    }
                }
                .padding()
                
                Spacer()
                
                HStack(spacing: 12) {
                    Button(action: {
                        if counter != 0 {
                            counter -= 1
                            sum -= 120
                        }
                    }, label: {
                        Image(systemName: "minus")
                    })
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Text("\(counter)")
                                .fontWeight(.bold)
                            Text("шт")
                        }
                        
                        Text("\(sum),0Р")
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        counter += 1
                        sum += 120
                    }, label: {
                        Image(systemName: "plus")
                    })
                    
                }
                .frame(width: 150, height: 16)
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .font(.system(size: 16))
                .cornerRadius(120)
                
                Spacer()
            }
        }
    }
    
}

#Preview {
    MainTabView()
}

