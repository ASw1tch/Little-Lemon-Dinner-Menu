//
//  MenuItemsView.swift
//  LL(dinnerMenu)
//
//  Created by Anatoliy Petrov on 16.2.24..
//

import SwiftUI

struct MenuItemsView: View {
    
    @StateObject private var viewModel = MenuViewViewModel()
    
    
    var body: some View {
        NavigationStack {
            ScrollView() {
                VStack {
                    ScrollView {
                        if viewModel.isShowFood {
                            VStack(alignment: .leading) {
                                Text("Food").font(.title)
                                MenuItemView(menuItems: viewModel.foods, menuCategory: .food).environmentObject(viewModel)
                            }.padding()
                        }
                        if viewModel.isShowDrinks {
                            VStack(alignment: .leading) {
                                Text("Drinks").font(.title)
                                MenuItemView(menuItems: viewModel.drinks, menuCategory: .drink).environmentObject(viewModel)
                            }.padding()
                        }
                        if viewModel.isShowDesserts {
                            VStack(alignment: .leading) {
                                Text("Desserts").font(.title)
                                MenuItemView(menuItems: viewModel.desserts, menuCategory: .dessert).environmentObject(viewModel)
                            }.padding()
                        }
                        
                    }.onAppear() {
                        viewModel.updateMenuItems()
                    }
                    .navigationTitle("Menu")
                    .toolbar{
                        ToolbarItem(id: "Filter") {
                            Button(action: {
                                viewModel.isShowingOptions.toggle()
                                
                            }) {
                                Image(systemName: "slider.horizontal.3")
                                    .foregroundColor(.blue)
                            }.sheet(isPresented: $viewModel.isShowingOptions) {
                                NavigationStack {
                                    MenuItemsOptionView().environmentObject(viewModel)
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MenuItemsView()
}




