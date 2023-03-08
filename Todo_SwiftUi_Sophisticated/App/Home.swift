//
//  ContentView.swift
//  Todo_SwiftUi_Sophisticated
//
//  Created by kenjimaeda on 06/03/23.
//

import SwiftUI
import AlertToast


struct Home: View {
	//MARK: - Properties
	@State private var gridLayout: [GridItem] = [GridItem(.flexible())]
	@State private var gridColumn = 3.0
	@State private var  activitiesSelected: ActivitiesModel? = nil
	@State var goWhenTrue: Bool = false
	@State private var heightSafeArea = 10
	@State private var showToast = false
	
	func switchGridLayout()  {
		gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
	}
	
	
	func handleSelectActivity()  {
		if(activitiesSelected != nil) {
			goWhenTrue = true
			return
		}
		showToast = true
		
	}
	
	func handleSelecteItem(activity: ActivitiesModel) {
		activitiesSelected = activity
	}
	
	var body: some View {
		GeometryReader { geometry in
			NavigationStack {
				ZStack {
					
					ScrollView{
						Text("Chosse Acitivy")
							.foregroundColor(ColorsApp.secondaryColor)
							.font(.custom("Inter-Black", size: 23))
						Text("Click here to see your activities")
							.font(.custom("Inter-Light", size: 17))
							.foregroundColor(ColorsApp.blue50)
						Divider()
							.frame(height:1)
							.overlay(ColorsApp.blue50)
							.padding(.horizontal,30)
							.padding(.top,10)
						Spacer(minLength: 30)
						LazyVGrid(columns:gridLayout,spacing: 20) {
							ForEach(gridActivities) { it in
								// precisa implementar o navigation view em volta
								Button(action:  { handleSelecteItem(activity: it) }) {
									ActivitiesView(imageString:  it.image, title:  it.title, itemSelected: activitiesSelected?.id == it.id)
										.navigationDestination(isPresented: $goWhenTrue) {
											ActivitiesDetails(activies: it)
										}
									
								}
								
							}
							
						}
					} // ScroolView
					
					
					Button(action: handleSelectActivity) {
						Text("Get Started")
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
					.offset(y: 300)
					
				}// Stack
				.padding(.top, geometry.safeAreaInsets.top + 20)
				.ignoresSafeArea()
				.background(
					ColorsApp.primaryColor
				)
				
				.toast(isPresenting: $showToast) {
					
					AlertToast(type: .error(Color.red), title: "You need to choose at one task")
					
				}
				
			} // NavigationStack
			
		} // Geometric
		.onAppear {
			switchGridLayout()
		}
		.toolbar(.hidden,for: .navigationBar)
		
	}
	
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		Home()
	}
}
