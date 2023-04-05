//
//  ActivitiesDetails.swift
//  Todo_SwiftUi_Sophisticated
//
//  Created by kenjimaeda on 07/03/23.
//

import SwiftUI
import RealmSwift
import AlertToast

struct ActivitiesDetails: View {
	//MARK: Properties
	@Environment(\.realm) var realm
	@Binding  var categoryActivies: CategoryActivities?
	@State private var  activies: CategoryActivities? = nil
	@State private var textField = ""
	@State private var date = Date()
	@State private var showToast = false
	@State private var showingDatePicker = false
	@State private var showError = false
	@State private var selectedDate  = Date()
	@State var goWhenTrue: Bool = false
	let formatedDate = DateFormatter()
	
	
	//MRK: - Functions
	func handleAddActivy() {
		if(textField.isEmpty) {
			showError.toggle()
			return
		}
		
		let listColorsActivy = [
			"cyan",
			"lightGreenAccent",
			"limeAccent",
			"pinkAccent",
			"indigoAccent",
			"amberAccent",
			"purpleShade",
			"greenShade"
		]
		let randomColors = Int.random(in: 1..<8)
		
		try? realm.write {
			let realmActivies = ActivitiesModel()
			realmActivies.date = selectedDate
			realmActivies.descriptionActivy = textField
			realmActivies.idCategoryActivy = activies?.id ?? 0
			realmActivies.color = listColorsActivy[randomColors]
			realm.add(realmActivies)
		}
		
		goWhenTrue.toggle()
	}
	
	func handleOpenDatePicker() {
		showingDatePicker.toggle()
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
								Text("\(selectedDate.formatted(.dateTime.day(.twoDigits).month(.abbreviated).locale(Locale(identifier: "en-us"))))")
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
					
					
				}// VStack
				.padding(.top,10)
				.padding(.horizontal,20)
				.background(ColorsApp.primaryColor)
				.sheet(isPresented: $showingDatePicker) {
					CalendarRepresentable(selectedDate: $selectedDate)
						.padding()
						.background(
							RoundedRectangle(cornerRadius: 25.0)
								.foregroundColor(.white)
								.shadow(color: Color.black.opacity(0.2), radius: 10,x: 0.0,y: 0.0)
						)
						.frame(height: 350)
						.padding()
				}
				.navigationDestination(isPresented: $goWhenTrue) {
					ShowTasks()
				}
				.toast(isPresenting: $showError) {
					
					AlertToast(type: .error(Color.red), title: "Activities without description are not allowed")
				}
				
				
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
