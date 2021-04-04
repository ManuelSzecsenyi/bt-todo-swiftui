//
//  TodoItem.swift
//  Todo
//
//  Created by Manuel Szecsenyi on 03.04.21.
//

import Foundation
import Alamofire

struct Response: Codable {
	var items: [TodoItemModel]
}

struct TodoItemModel: Codable {
	var id: String
	var text: String
	var done: Bool
	var createdAt: Date
}

enum DateError: String, Error {
	case invalidDate
}

class TodoService {
	
	static let url = "http://localhost:3000"
	
	static func getItems() {
		
		AF.request(TodoService.url).responseData { response in
			switch response.result {
				case .failure(let error):
					print(error)
				case .success(let data):
					// custom decoder needed https://stackoverflow.com/questions/46537790/iso8601-date-json-decoding-using-swift4
					let decoder = JSONDecoder()
					let formatter = DateFormatter()
					decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
						let container = try decoder.singleValueContainer()
						let dateStr = try container.decode(String.self)

						formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
						if let date = formatter.date(from: dateStr) {
							return date
						}
						formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
						if let date = formatter.date(from: dateStr) {
							return date
						}
						throw DateError.invalidDate
					})
					do {
						let pageData = try decoder.decode([TodoItemModel].self, from: data)
						print(pageData)
					} catch let error {
						print(error)
					}
			}
		}
	}
	
}
