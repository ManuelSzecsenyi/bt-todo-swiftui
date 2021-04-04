//
//  Footer.swift
//  Todo
//
//  Created by Manuel Szecsenyi on 03.04.21.
//

import SwiftUI

struct Footer: View {
	
	@State private var input: String = ""
	@EnvironmentObject var todos: TodoData
	
    var body: some View {
		ZStack {
			
			HStack {
				
				ZStack(alignment: .leading) {
					if input.isEmpty { Text("Eine Aufgabe hinzufügen").foregroundColor(Color("placeholderBlue")) }
					TextField("", text: $input)
						.foregroundColor(.white)
				}
				
				Image("save-btn")
					.onTapGesture {
						TodoService.addItem(text: self.input, success: self.addTodo)
						self.input = ""
					}
			}
			.padding(.horizontal)
			.padding(.vertical, 25)
			.background(Color("todoBlue"))
		}
    }
	
	func addTodo(todo: TodoItemModel) {
		self.todos.items.append(
			TodoItemModel(
				id: todo.id,
				text: todo.text,
				done: todo.done,
				createdAt: todo.createdAt
			)
		)
	}
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        Footer()
    }
}
