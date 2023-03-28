//
//  ActivitiesDetails.swift
//  Todo_SwiftUi_Sophisticated
//
//  Created by kenjimaeda on 07/03/23.
//

import SwiftUI

struct ActivitiesDetails: View {
	//MARK: Properties
	@Binding  var categoryActivies: CategoryActivities?
	@State private var  activies: CategoryActivities? = nil
	@State private var textField = ""
	
	func handleAddActivy() {
		
	}
	
	
	var body: some View {
		GeometryReader { geometry in
			NavigationStack{
				VStack{
					HStack{
						Text("Choose a date for the activity")
							.font(.custom("Inter-Medium", size: 19))
							.foregroundColor(ColorsApp.secondaryColor)
						Spacer()
						HStack{
							Text("25 Feb")
								.font(.custom("Inter-Medium", size: 17))
								.foregroundColor(ColorsApp.secondaryColor)
							Image(systemName: "calendar")
								.frame(width: 20,height: 20)
							
						}//HStack
						.padding(.vertical,10)
						.padding(.horizontal,7)
						.background(ColorsApp.whiteColor)
						.clipShape(RoundedRectangle(cornerRadius: 7,style: .continuous))
						
					}// HStack
					Spacer()
					TextField(text: $textField) {
						 Text("Your description,it's optional")
					}
					.font(.custom("Inter-Regular", size: 18))
					.foregroundColor(ColorsApp.black)
					.padding(.horizontal,10)
					.padding(.vertical,7)
					.background(ColorsApp.whiteColor)
					.clipShape(RoundedRectangle(cornerRadius: 7,style: .continuous))
					Spacer()
					
					ButtonDefault(titleButton: "Add Activity", actionButton: handleAddActivy)
						.offset(y: -3w0)
				
				}// VStack
				.padding(.top,10)
				.padding(.horizontal,20)
				.background(ColorsApp.primaryColor)
			}// NavigationStck
	
		} // Geometry
		.toolbar(.hidden,for: .navigationBar)
		.onAppear(){
			activies = categoryActivies
		}
	
	}
	
	
	
}

struct ActivitiesDetails_Previews: PreviewProvider {
	static var previews: some View {
		let categoriesActives = CategoryActivities(id: 11, title: "Loving", image: "read")
		ActivitiesDetails(categoryActivies: .constant(categoriesActives))
	
	}
}
