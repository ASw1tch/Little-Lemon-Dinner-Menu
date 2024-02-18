//
//  MenuViewViewModel.swift
//  LL(dinnerMenu)
//
//  Created by Anatoliy Petrov on 17.2.24..
//

import Foundation
import SwiftUI

enum Icons: String {
    case food = "mainCourse"
    case drink = "limonades"
    case desserts = "cake"
}

class MenuViewViewModel: ObservableObject {
    
    @Published var isShowingOptions = false
    
    @Published var isShowFood = true
    @Published var isShowDrinks = true
    @Published var isShowDesserts = true
    
    @Published var sortingBy: SortMenuItem = .alphabetically
    
    @Published var foods: [MenuItem] = [
        MenuItem(price: 3.4, title: "Food 1", menuCategory: .food, orders: 43, ingredients: [.broccoli, .carrot], picture: Icons.food.rawValue),
        MenuItem(price: 4.3, title: "Food 2", menuCategory: .food, orders: 22, ingredients: [.broccoli, .pasta], picture: Icons.food.rawValue),
        MenuItem(price: 23.3, title: "Food 3", menuCategory: .food, orders: 12, ingredients: [.broccoli, .spinach, .tomatoSauce, ], picture: Icons.food.rawValue),
        MenuItem(price: 6.8, title: "Food 4", menuCategory: .food, orders: 32, ingredients: [.broccoli, .spinach], picture: Icons.food.rawValue),
        MenuItem(price: 20.4, title: "Food 5", menuCategory: .food, orders: 4, ingredients: [.broccoli, .spinach, .tomatoSauce,], picture: Icons.food.rawValue),
        MenuItem(price: 7.5, title: "Food 10", menuCategory: .food, orders: 32, ingredients: [.broccoli, .pasta], picture: Icons.food.rawValue),
        MenuItem(price: 5.4, title: "Food 9", menuCategory: .food, orders: 12, ingredients: [.broccoli, .tomatoSauce], picture: Icons.food.rawValue),
        MenuItem(price: 10.3, title: "Food 8", menuCategory: .food, orders: 12, ingredients: [.broccoli, .spinach, .tomatoSauce, .carrot], picture: Icons.food.rawValue),
        MenuItem(price: 14.2, title: "Food 7", menuCategory: .food, orders: 32, ingredients: [.broccoli, .carrot], picture: Icons.food.rawValue),
        MenuItem(price: 19.9, title: "Food 6", menuCategory: .food, orders: 2, ingredients: [.tomatoSauce, .carrot], picture: Icons.food.rawValue),
        MenuItem(price: 14.7, title: "Food 12", menuCategory: .food, orders: 34, ingredients: [.pasta, .spinach, .tomatoSauce], picture: Icons.food.rawValue),
        MenuItem(price: 12.6, title: "Food 11", menuCategory: .food, orders: 32, ingredients: [.carrot, .spinach, .tomatoSauce], picture: Icons.food.rawValue)
    ]
    @Published var drinks: [MenuItem] = [
        MenuItem(price: 3.4, title: "Drink 1", menuCategory: .drink, orders: 123, ingredients: [], picture: Icons.drink.rawValue),
        MenuItem(price: 5.2, title: "Drink 2", menuCategory: .drink, orders: 233, ingredients: [], picture: Icons.drink.rawValue),
        MenuItem(price: 2.3, title: "Drink 3", menuCategory: .drink, orders: 54, ingredients: [], picture: Icons.drink.rawValue),
        MenuItem(price: 10.2, title: "Drink 6", menuCategory: .drink, orders: 143, ingredients: [], picture: Icons.drink.rawValue),
        MenuItem(price: 12.3, title: "Drink 5", menuCategory: .drink, orders: 291, ingredients: [], picture: Icons.drink.rawValue),
        MenuItem(price: 7.8, title: "Drink 4", menuCategory: .drink, orders: 21, ingredients: [], picture: Icons.drink.rawValue),
        MenuItem(price: 5.3, title: "Drink 7", menuCategory: .drink, orders: 23, ingredients: [], picture: Icons.drink.rawValue),
        MenuItem(price: 4.9, title: "Drink 8", menuCategory: .drink, orders: 321, ingredients: [], picture: Icons.drink.rawValue)
    ]
    @Published var desserts: [MenuItem] = [
        MenuItem(price: 2.1, title: "Dessert 1", menuCategory: .dessert, orders: 23, ingredients: [], picture: Icons.desserts.rawValue),
        MenuItem(price: 2.1, title: "Dessert 5", menuCategory: .dessert, orders: 34, ingredients: [], picture: Icons.desserts.rawValue),
        MenuItem(price: 2.1, title: "Dessert 3", menuCategory: .dessert, orders: 46, ingredients: [], picture: Icons.desserts.rawValue),
        MenuItem(price: 2.1, title: "Dessert 4", menuCategory: .dessert, orders: 67, ingredients: [], picture: Icons.desserts.rawValue),
        MenuItem(price: 2.1, title: "Dessert 2", menuCategory: .dessert, orders: 2, ingredients: [], picture: Icons.desserts.rawValue),
        
    ]
    
    func updateMenuItems() {
        switch sortingBy {
        case .mostPopular:
            foods.sort() { $0.orders > $1.orders }
            drinks.sort() { $0.orders > $1.orders }
            desserts.sort() { $0.orders > $1.orders }
        case .price:
            foods.sort() { $0.price < $1.price }
            drinks.sort() { $0.price < $1.price }
            desserts.sort() { $0.price < $1.price }
        case .alphabetically:
            foods.sort() {
                sortByTitle(lhs: $0, rhs: $1)
            }
            drinks.sort() {
                sortByTitle(lhs: $0, rhs: $1)
            }
            desserts.sort() {
                sortByTitle(lhs: $0, rhs: $1)
            }
        }
    }
    
    private func sortByTitle(lhs: MenuItem, rhs: MenuItem) -> Bool {
        let lhsTitle = lhs.title.split(separator: " ")
        let rhsTitle = rhs.title.split(separator: " ")
        let lhsNumber = Int(lhsTitle[lhsTitle.count - 1]) ?? 0
        let rhsNumber = Int(rhsTitle[rhsTitle.count - 1]) ?? 0
        if lhsNumber != rhsNumber {
            return lhsNumber < rhsNumber
        } else {
            return lhs.title < rhs.title
        }
    }
}
