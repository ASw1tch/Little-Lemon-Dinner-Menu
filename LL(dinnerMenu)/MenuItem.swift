//
//  MenuItem.swift
//  LL(dinnerMenu)
//
//  Created by Anatoliy Petrov on 17.2.24..
//
import SwiftUI
import Foundation

protocol MenuItemProtocol {
    var id: UUID { get }
    var price: Double { get }
    var title: String { get }
    var menuCategory: MenuCategory { get }
    var orders: Int { get }
    var ingredients: [Ingredient] {get set}
    var picture: String {get set}
}


struct MenuItem: Identifiable, MenuItemProtocol, Hashable{
    var id = UUID()
    var price: Double
    var title: String
    var menuCategory: MenuCategory
    var orders: Int
    var ingredients: [Ingredient]
    var picture: String
    
}


