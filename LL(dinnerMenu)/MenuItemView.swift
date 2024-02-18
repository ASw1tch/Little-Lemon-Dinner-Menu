//
//  MenuItemView.swift
//  LL(dinnerMenu)
//
//  Created by Anatoliy Petrov on 17.2.24..
//

import SwiftUI

struct MenuItemView: View {
    
    @EnvironmentObject var viewModel: MenuViewViewModel
    
    init(menuItems: [MenuItem], menuCategory: MenuCategory) {
        self.menuItems = menuItems
        self.menuCategory = menuCategory
    }
    
    var menuItems: [MenuItem]
    
    var menuCategory: MenuCategory
    
    var layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: layout) {
            ForEach((menuItems), id: \.self) { menuItem in
                NavigationLink(destination: MenuItemDetailsView(menuItem: menuItem)) {
                    VStack {
                        Image(menuItem.picture)
                            .resizable()
                            .frame(width: 115, height: 75)
                        Text(menuItem.title)
                    }
                    .frame(height: 120)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    MenuItemView(menuItems: MenuViewViewModel().desserts, menuCategory: .dessert)
}
