//
//  AcitivityView.swift
//  Todo_SwiftUi_Sophisticated
//
//  Created by kenjimaeda on 06/03/23.
//

import SwiftUI

struct ActivitiesView: View {
	//MARK: -Properties
	let  imageString: String;
	let title: String;
	let itemSelected: Bool;
	
    var body: some View {
			VStack{
				 Image(imageString)
					.resizable()
					.frame(width: 40,height: 40)
					.scaledToFit()
				 Text(title)
					.foregroundColor(ColorsApp.secondaryColor)
					.font(.custom("Inter-Light", size: 12))
				  
			}
			.padding()
			.frame(width: 95,height: 95)
			.background(
				Circle()
					.strokeBorder(itemSelected ? ColorsApp.blue100 : ColorsApp.whiteColor,lineWidth: 1)
					.background(Circle().fill(ColorsApp.whiteColor))
			)
			
    }
}

struct AcitivityView_Previews: PreviewProvider {
    static var previews: some View {
			ActivitiesView(imageString: "read", title: "reading",itemSelected: false)
				.previewLayout(.sizeThatFits)
			 
			
				
    }
}
