//
//  ActivityListViewModel.swift
//  Flanner
//
//  Created by Kevin Bryan on 19/04/23.
//

import CoreData
import Foundation

class ActivityListViewModel: ObservableObject {
  var name: String = ""
  @Published var activites: [ActivityViewModel] = []

  func getAllActivity() {
    activites = CoreDataManager.shared.getAllActivity().map(ActivityViewModel.init)
  }

  func delete(_ activity: ActivityViewModel) {
    let currActivity = CoreDataManager.shared.getActivitybyId(id: activity.id)

    if let currActivity = currActivity {
      CoreDataManager.shared.deleteActivity(activity: currActivity)
    }
  }

  func save() {
    let activity = Activity(context: CoreDataManager.shared.viewContext)
    activity.name = name
    CoreDataManager.shared.save()
  }
}

struct ActivityViewModel {
  let activity: Activity

  var id: NSManagedObjectID {
    return activity.objectID
  }

  var name: String {
    return activity.name ?? ""
  }
}
