//
//  ButtonDefault.swift
//  Todo_SwiftUi_Sophisticated
//
//  Created by kenjimaeda on 28/03/23.
//

import SwiftUI

struct ButtonDefault: View {
	//MARK: - Properties
	var titleButton: String
	var actionButton: () -> Void
	
	var body: some View {
		Button(action: actionButton) {
			Text(titleButton)
				.font(.custom("Inter-Regular", size: 19))
				.foregroundColor(ColorsApp.whiteColor)
			
		}
		.frame(width: 220,height: 50)
		.background(
			ColorsApp.secondaryColor
				.cornerRadius(10)
		).background(
			ColorsApp.secondaryColor
				.cornerRadius(10)
		)
		
	}
}

struct ButtonDefault_Previews: PreviewProvider {
	static var previews: some View {
		ButtonDefault(titleButton: "Get Started",actionButton:  {print("item")} )
	}
}
