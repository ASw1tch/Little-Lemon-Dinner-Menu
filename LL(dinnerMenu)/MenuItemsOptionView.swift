//
//  MenuItemsOptionView.swift
//  LL(dinnerMenu)
//
//  Created by Anatoliy Petrov on 16.2.24..
//

import SwiftUI

enum SelectedCategory: String, CaseIterable  {
    case food = "Food"
    case drink = "Drink"
    case dessert = "Desserts"
}

enum SortMenuItem: String, CaseIterable {
    case mostPopular = "Most Popular"
    case price = "Price $-$$$"
    case alphabetically = "A-z"
}

struct MenuItemsOptionView: View {
    
    @EnvironmentObject var viewModel: MenuViewViewModel

    var body: some View {
        NavigationStack {
            List {
                Section("Selected categories") {
                    Toggle(MenuCategory.food.rawValue, isOn: $viewModel.isShowFood)
                    Toggle(MenuCategory.drink.rawValue, isOn: $viewModel.isShowDrinks)
                    Toggle(MenuCategory.dessert.rawValue, isOn: $viewModel.isShowDesserts)
                }.toggleStyle(CheckboxStyle())
    
                Picker("Sort by", selection: $viewModel.sortingBy) {
                    ForEach(SortMenuItem.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                .pickerStyle(.inline)
                .listStyle(.grouped)
                
            }.navigationTitle("Filter")
             .toolbar{
                ToolbarItem(id: "") {
                    Button {
                        viewModel.updateMenuItems()
                        viewModel.isShowingOptions = false
                    } label: {
                        Text("Done")
                    }
                }
            }
        }
    }
}

///  I don't like the size of regular toggles so I found solution to make them a bit smaller and native.

struct CheckboxStyle: ToggleStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        
        return HStack {
            
            configuration.label
            
            Spacer()
            
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(configuration.isOn ? .green : .gray)
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
        
    }
}

#Preview {
    MenuItemsOptionView().environmentObject(MenuViewViewModel())
}
