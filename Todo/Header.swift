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
		VStack(alignment: .leading ) {
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
			
			Text(DateFormats.heeadingFormat.string(for: Date())!)
				.font(.system(size: 34.0))
				.bold()
			Text("Meine Aufgaben")
				.font(.system(size: 19))
				.bold()
		}
		
        
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}



struct DateFormats {

	static var heeadingFormat: DateFormatter = {
		let df = DateFormatter()
		df.dateFormat = "EEE MM.dd.YY"
		df.locale = Locale(identifier: "de")
		return df
	}()

}
