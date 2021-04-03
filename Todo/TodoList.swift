//
//  TodoList.swift
//  Todo
//
//  Created by Manuel Szecsenyi on 03.04.21.
//

import SwiftUI

struct TodoList: View {
	
	@State private var done: Bool = false;
	
	var body: some View {
		
		ScrollView {
			LazyVStack {
				TodoItem()
				TodoItem()
				TodoItem()
				TodoItem()
				TodoItem()
				TodoItem()
				TodoItem()
				TodoItem()
				TodoItem()
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
	
	@State private var done: Bool = false;
	
	var body: some View {
		HStack {
			if self.done {
				
				Image("item-checked")
					.padding(.trailing, 5)
				Text("Item #1")
					.font(.system(size: 17.0))
					.strikethrough()
				
			} else {
				
				Image("item-unchecked")
					.padding(.trailing, 5)
				Text("Item #1")
					.font(.system(size: 17.0))
				
			}
			
			Spacer()
		}
		.frame(maxWidth: .infinity)
		.padding()
		.background(Color("greyColor"))
		.cornerRadius(10.0)
		
	}
}
