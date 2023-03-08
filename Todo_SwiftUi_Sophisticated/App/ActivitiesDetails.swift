//
//  ActivitiesDetails.swift
//  Todo_SwiftUi_Sophisticated
//
//  Created by kenjimaeda on 07/03/23.
//

import SwiftUI

struct ActivitiesDetails: View {
	  //MARK: Properties
	var activies: ActivitiesModel;
 
    var body: some View {
			Text(activies.title)
    }
}

struct ActivitiesDetails_Previews: PreviewProvider {
    static var previews: some View {
			ActivitiesDetails(activies: gridActivities[0])
    }
}
