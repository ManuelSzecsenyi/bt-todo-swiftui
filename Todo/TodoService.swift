//
//  TodoItem.swift
//  Todo
//
//  Created by Manuel Szecsenyi on 03.04.21.
//

import Foundation

struct Response: Codable {
	var items: [TodoItemModel]
}

struct TodoItemModel: Codable {
	var id: String
	var text: String
	var done: Bool
	var createdAt: Date
}

class TodoService {
	
	let url = URL(string: "http://localhost:3000")
	
	static func getItems() {
		let request = URLRequest(url: URL(string: "http://localhost:3000")!)
		
		print("load")
		
		URLSession.shared.dataTask(with: request) { data, response, error in
		
			if let data = data {
				if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
					// we have good data – go back to the main thread
					DispatchQueue.main.async {
						// update our UI
						print(decodedResponse)
						print("load finished")
					}

					// everything is good, so we can exit
					return
				}
			}
		
		}.resume()
	}
	
}
