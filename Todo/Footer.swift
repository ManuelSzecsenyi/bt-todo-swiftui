//
//  Footer.swift
//  Todo
//
//  Created by Manuel Szecsenyi on 03.04.21.
//

import SwiftUI

struct Footer: View {
	
	@State private var input: String = ""
	
    var body: some View {
		ZStack {
			
			HStack {
				
				ZStack(alignment: .leading) {
					if input.isEmpty { Text("Eine Aufgabe hinzufügen").foregroundColor(Color("placeholderBlue")) }
					TextField("", text: $input)
				}
				
				Image("save-btn")
			}
			.padding(.horizontal)
			.padding(.vertical, 25)
			.background(Color("todoBlue"))
		}
		
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        Footer()
    }
}
