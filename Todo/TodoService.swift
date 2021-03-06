//
//  TodoItem.swift
//  Todo
//
//  Created by Manuel Szecsenyi on 03.04.21.
//

import Foundation
import Alamofire

class TodoData: ObservableObject {
	@Published var items: [TodoItemModel] = []
}

struct TodoItemModel: Codable, Identifiable {
	var id: String
	var text: String
	var done: Bool
	var createdAt: Date
	
}

enum DateError: String, Error {
	case invalidDate
}

class TodoService {
	
	static let url = "https://radiant-spire-08360.herokuapp.com"
	
	static func getItems(onFinish: @escaping ([TodoItemModel]) -> Void) {
		
		AF.request(TodoService.url).responseData { response in
			switch response.result {
				case .failure(let error):
					print(error)
				case .success(let data):
					do {
						let decoder = self.getDecoder()
						let pageData = try decoder.decode([TodoItemModel].self, from: data)
						onFinish(pageData)
					} catch let error {
						print(error)
					}
			}
		}
	}
	
	static func updateItem(item: TodoItemModel) {
		let encoder = JSONEncoder()
		
		do {
			let json = try encoder.encode(item)
			//print(String(data: json, encoding: .utf8)!)
			
			var request = URLRequest(url: URL(string: self.url)!)
			request.httpMethod = HTTPMethod.put.rawValue
			request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
			request.httpBody = json
			
			AF.request(request)
				.responseJSON { response in
					print(response)
				}

		
		} catch let error {
			print(error)
		}
	}
	
	static func addItem(text: String, success: @escaping (TodoItemModel) -> Void) {
				
		let parameters: [String: Any] = [
			"text" : text,
			"done" : false,
		]

		AF.request(self.url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
			.responseData { response in
				switch response.result {
					case .failure(let error):
						print(error)
					case .success(let data):
						do {
							let decoder = self.getDecoder()
							let pageData = try decoder.decode(TodoItemModel.self, from: data)
							success(pageData)
						} catch let error {
							print(error)
						}
				}
			}
	}
	
	static func getDecoder() -> JSONDecoder {
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
		
		return decoder
	}
	
}
