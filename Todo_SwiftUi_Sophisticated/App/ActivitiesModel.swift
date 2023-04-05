//
//  ActivitiesModel.swift
//  Todo_SwiftUi_Sophisticated
//
//  Created by kenjimaeda on 07/03/23.
//

import Foundation
import RealmSwift

class ActivitiesModel: Object,ObjectKeyIdentifiable  {
	
	@Persisted(primaryKey: true) var _id: ObjectId
	@Persisted var idCategoryActivy = 0
	@Persisted var date =  Date()
	@Persisted var descriptionActivy = ""
	@Persisted var color = ""
	
}
