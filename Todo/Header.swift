//
//  Header.swift
//  Todo
//
//  Created by Manuel Szecsenyi on 01.04.21.
//

import SwiftUI
import URLImage

struct Header: View {
	
	private var url = URL(string:  "https://images.pexels.com/photos/5325834/pexels-photo-5325834.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940")
	
    var body: some View {
		HStack {
			Image(systemName: "circle.grid.2x2.fill")
				.font(.system(size: 26))
			Spacer()
			Text("ToDo")
				.bold()
				.font(.system(size: 26))
			Spacer()
			URLImage(url: self.url!,
			 content: { image in
				 image
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 40.0, height: 40.0)
					.clipShape(Circle())
			 })
			
		}
        
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
