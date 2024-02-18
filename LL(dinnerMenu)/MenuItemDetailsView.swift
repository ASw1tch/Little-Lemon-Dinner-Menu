//
//  MenuItemDetailsView.swift
//  LL(dinnerMenu)
//
//  Created by Anatoliy Petrov on 16.2.24..
//

import SwiftUI

struct MenuItemDetailsView: View {
    
    var menuItem: MenuItem
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(menuItem.picture)
                    .resizable()
                    .frame(width: 300, height: 250)
                    .scaledToFit()
                VStack(alignment: .center) {
                    Text("Price:").bold()
                    Text(String(menuItem.price))
                    Text("Ordered:").bold()
                    Text(String(menuItem.orders))
                    Text("Ingridients:").bold()
                    ForEach(menuItem.ingredients, id: \.self) {
                        Text($0.rawValue)
                    }
                }.padding()
            }.navigationTitle(menuItem.title)
                .navigationBarBackButtonHidden(false)
        }
    }
}

#Preview {
    MenuItemDetailsView(menuItem: MenuItem(price: 2.3, title: "Food 69", menuCategory: .food, orders: 12, ingredients: [.broccoli, .carrot], picture: "mainCourse"))
}
