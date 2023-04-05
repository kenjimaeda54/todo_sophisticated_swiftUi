//
//  ShowTasks.swift
//  Todo_SwiftUi_Sophisticated
//
//  Created by kenjimaeda on 01/04/23.
//

import SwiftUI
import RealmSwift
import JZCalendarWeekView
import SwiftDate


struct ShowTasks: View {
	//MARK: - Properties
	@Environment(\.dismiss) var dimiss
	@State private var selectedDate = Date()
	@ObservedResults (ActivitiesModel.self) var activitiesModel
	
	// com propriedade computada consigo quando atualizar o selectedDate
	// aatualizar tambem  o activies
	var actives: [ActivitiesModel] {
		return activitiesModel.filter { activy in
			selectedDate.compare(toDate: activy.date, granularity: .day)  == .orderedSame
		}
	}
	
	
	//MARK: - Func
	func handleBack()  {
		dimiss()
	}
	
	
	
	var body: some View {
		NavigationStack {
			ScheduleRepresentable(selectedDate: $selectedDate)
				.frame(maxHeight: 200)
			List(actives) { activy in
				let gridActivies = gridActivities.first(where: { category in
					category.id == activy.idCategoryActivy
				})
				HStack(spacing: 10) {

					if let image = gridActivies?.image {
						Image(image)
							.resizable()
							.frame(width: 27, height: 27)
							.padding()
							.background(
								Circle()
									.stroke(ColorsApp.whiteColor,lineWidth: 1)
							)
	
					}
					Text(activy.descriptionActivy)
						.font(.custom("Inter-Medium", size: 19))
						.foregroundColor(ColorsApp.whiteColor)
					Spacer()
					
				}// HStack
				.frame(maxWidth: .infinity)
				.padding(.horizontal,10)
				.padding(.vertical,15)
				.listRowSeparator(.hidden)
				.background(
					RoundedRectangle(cornerRadius: 10)
						.foregroundColor(Color(activy.color))
				)
				
				
			}//LIST
			.padding(.horizontal,10)
			.padding(.top,10)
			.scrollIndicators(.hidden)
			.listStyle(.plain)
			
			
			
		}// NavigationStack
		.navigationBarBackButtonHidden(true)
		.toolbar {
			ToolbarItem(placement: .navigationBarLeading) {
				Button(action: handleBack) {
					Image(systemName: "chevron.left")
						.foregroundColor(ColorsApp.secondaryColor)
				}
			}
		}
		
	}
	
}

struct ShowTasks_Previews: PreviewProvider {
	static var previews: some View {
		ShowTasks()
		
	}
}
