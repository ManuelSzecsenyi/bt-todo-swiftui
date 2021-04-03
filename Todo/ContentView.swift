//
//  ContentView.swift
//  Todo
//
//  Created by Manuel Szecsenyi on 01.04.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		VStack{
			Header()
			Footer()
				.cornerRadius(20, corners: [.topLeft, .topRight])

		}
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// https://stackoverflow.com/a/58606176

extension View {
	func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
		clipShape( RoundedCorner(radius: radius, corners: corners) )
	}
}

struct RoundedCorner: Shape {

	var radius: CGFloat = .infinity
	var corners: UIRectCorner = .allCorners

	func path(in rect: CGRect) -> Path {
		let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		return Path(path.cgPath)
	}
}
