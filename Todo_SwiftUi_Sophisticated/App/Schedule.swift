//
//  SwiftUIView.swift
//  Todo_SwiftUi_Sophisticated
//
//  Created by kenjimaeda on 01/04/23.
//



import Foundation
import UIKit
import SwiftUI
import FSCalendar
import RealmSwift


struct ScheduleRepresentable: UIViewRepresentable {
	
	@Binding var selectedDate: Date
  var calendar = FSCalendar()

	
	func makeUIView(context: Context) -> FSCalendar {
		calendar.delegate = context.coordinator
		calendar.dataSource = context.coordinator
		calendar.appearance.todayColor = UIColor(ColorsApp.secondaryColor) // Cannot assign value of type 'Color' to type 'UIColor'
		calendar.appearance.titleFont = UIFont(name: "Inter-Regular", size: 17)
		calendar.appearance.headerTitleFont = UIFont(name: "Inter-Bold", size: 19)
		calendar.appearance.headerTitleColor = UIColor(ColorsApp.secondaryColor)
		calendar.appearance.weekdayFont = UIFont(name: "Inter-Regular", size: 17)
		calendar.appearance.weekdayTextColor = UIColor(ColorsApp.secondaryColor)
		calendar.appearance.caseOptions = [.headerUsesCapitalized]
		calendar.needsAdjustingViewFrame = true
		calendar.locale = Locale(identifier: "en-us")
		calendar.scope = .week
		return calendar
	}
	
	
	func updateUIView(_ uiView: FSCalendar, context: Context) {
		uiView.scope = .week
 
	
	}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
		
	}
	
	class Coordinator: NSObject,FSCalendarDelegate,FSCalendarDataSource {
		
		
		var parent: ScheduleRepresentable
		
		init(_ parent: ScheduleRepresentable) {
			self.parent = parent
		 
		}
		
		func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
			parent.selectedDate = date
		}
		
		 
	
	}
	
}



