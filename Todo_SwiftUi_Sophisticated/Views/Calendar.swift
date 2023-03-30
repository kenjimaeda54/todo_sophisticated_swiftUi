//
//  DatePicker.swift
//  Todo_SwiftUi_Sophisticated
//
//  Created by kenjimaeda on 28/03/23.
//

import Foundation
import UIKit
import SwiftUI
import FSCalendar

struct CalendarRepresentable: UIViewRepresentable {


	var calendar = FSCalendar()
	
	//quando preciso de usar contexto ou self preciso criar um coordinator
	func makeUIView(context: Context) -> FSCalendar {
		calendar.delegate = context.coordinator
		calendar.dataSource = context.coordinator
		calendar.appearance.todayColor = UIColor(ColorsApp.secondaryColor) // Cannot assign value of type 'Color' to type 'UIColor'
		return calendar
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
	   
	}
		
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
 
	
	//https://www.youtube.com/watch?v=r5X2wFWRah4
	//Se eu precisasse apenas de um objeto poderia usar apenas NSObject,
	//usei   FSCalendarDelegate e FSCalendarDataSource, porque preciso no makeUIView
	class Coordinator: NSObject,FSCalendarDelegate,FSCalendarDataSource {
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
		var parent: CalendarRepresentable
		
		init(_ parent: CalendarRepresentable) {
			self.parent = parent
		}
		
		
		//aqui vou ter o acesso ao metodos disponivel no calendar delegate e data source
		
		func minimumDate(for calendar: FSCalendar) -> Date {
			  return startDate
		}
		
		func maximumDate(for calendar: FSCalendar) -> Date {
			 return endDate
		}
		
	
	
		
	}
		
}


