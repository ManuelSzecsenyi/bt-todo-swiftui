//
//  TodoList.swift
//  Todo
//
//  Created by Manuel Szecsenyi on 03.04.21.
//

import SwiftUI

struct TodoList: View {
	
	@State private var done: Bool = false;
	@EnvironmentObject var todos: TodoData
	
	var body: some View {
					
		ScrollView {
			LazyVStack {
				ForEach(todos.items) { item in
					TodoItem(item: item)
				}
				
			}
		}	
	}
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
		TodoList()
    }
}

struct TodoItem: View {
	
	@State var item: TodoItemModel
	
	var body: some View {
		HStack {
			if item.done {
				
				Image("item-checked")
					.padding(.trailing, 5)
				Text(item.text)
					.font(.system(size: 17.0))
					.strikethrough()
				
			} else {
				
				Image("item-unchecked")
					.padding(.trailing, 5)
				Text(item.text)
					.font(.system(size: 17.0))
				
			}
			
			Spacer()
		}
		.frame(maxWidth: .infinity)
		.padding()
		.background(Color("greyColor"))
		.cornerRadius(10.0)
		.onTapGesture {
			self.item.done = !self.item.done
			TodoService.updateItem(item: self.item)
		}
		
	}
}
