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
	@State private var openDatePicker = false
	@State private var date = Date()
	@State private var showingDatePicker = false
	let  startDate = Calendar.current.startOfDay(for: Date())
	//se não fizer abaixo como propriedade computada ira reclamar , pois preciso que start date esteja pronto
	//	When should I use a Computed Property?
	//	It’s important to understand when you should use a Computed Property over a stored property. Use it when:
	//
	//	It depends on other properties
	//	You’re defining the property inside an extension
	//	The property is an access point to another object without disclosing it fully
	//https://www.avanderlee.com/swift/computed-property/#:~:text=Computed%20properties%20are%20part%20of,computes%20its%20property%20upon%20request.
	var  endDate: Date  {
		Calendar.current.date(byAdding: DateComponents(year: 1), to: startDate)?.addingTimeInterval(-1) ?? Date()
	}
	
	func handleAddActivy() {
		
	}
	
	func handleOpenDatePicker() {
		showingDatePicker.toggle()
		print(startDate,endDate)
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
							Button(action: handleOpenDatePicker){
								Text("25 Feb")
									.font(.custom("Inter-Medium", size: 17))
									.foregroundColor(ColorsApp.secondaryColor)
								Image(systemName: "calendar")
									.frame(width: 20,height: 20)
									.foregroundColor(ColorsApp.secondaryColor)
							}
							
							
							
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
						.offset(y: -30)
					if(showingDatePicker) {
						DatePicker("", selection: $date, in:  Date()...,displayedComponents: [.date])
							.datePickerStyle(.wheel)
						 
					}
					
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
