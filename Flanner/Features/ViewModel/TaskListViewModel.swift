//
//  TaskListViewModel.swift
//  Flanner
//
//  Created by Kevin Bryan on 19/04/23.
//

import CoreData
import Foundation

class TaskListViewModel: ObservableObject {
  let taskModel = TaskModel()

  @Published var tasks: [TaskViewModel] = []

  var recommendations: [TaskViewModel] = [] // MARK: Hanya sampe 6

  init() {
    getAllTask()
    if !UserManager().users.isEmpty {
      getRecommendations()
    }
  }

  func getAllTask() {
    tasks = taskModel.getAllTasks().map(TaskViewModel.init)
  }

  func getRecommendations() {
    //    recommendations = CoreDataManager.shared.getRecommendations().map(TaskViewModel.init)
    if tasks.isEmpty {
      print("TASKS is empty!")
      getAllTask()
    }

    // MARK: filter tags, ambil tags yang disuka (weight == 3)

    print("Trying to get your recommendations")
    let likedTags = TagListViewModel().tags.filter {
      $0.weight == 3
    }.shuffled()

    print("\nLIKED TAGS:\n \(likedTags)")

    // MARK: penampung calon task yang akan ada di rekomendasi

    struct CalonRecommendation {
      let task: TaskViewModel
      let tagCount: Int
    }

    var calonRecs: [CalonRecommendation] = []

    // MARK: jika tasknya punya at least 1 tag yang cocok append ke calon rekomendasi

    for task in tasks {
      var corrTag = 0
      for taskTag in task.tags {
        for likedTag in likedTags {
          if likedTag.name == taskTag.name {
            corrTag += 1
          }
        }
      }
      if corrTag >= 1 {
        calonRecs.append(CalonRecommendation(task: task, tagCount: corrTag))
      }
    }

    print("\nCALON RECS:\n \(calonRecs)")

    // MARK: sort calon rekomendasi berdasarkan tagCount, yang paling banyak paling pertama

    calonRecs = calonRecs.shuffled()
    calonRecs.sort { $0.tagCount > $1.tagCount }

    // MARK: kita kosongin dlu recommendation biar dia fresh

    recommendations = []

    // MARK: ambil 6 task yang paling pertama masukin ke recommendation

    for (idx, cr) in calonRecs.enumerated() {
      recommendations.append(cr.task)

      if idx == 5 {
        break
      }
    }

    print("\nFINAL RECS:\n \(recommendations)")
  }
}

struct TaskViewModel {
  let task: Task

  var id: NSManagedObjectID {
    return task.objectID
  }

  var name: String {
    return task.name ?? ""
  }

  var image: String {
    return task.image ?? "defaultTaskImage"
  }

  var detail: String {
    return task.detail ?? "There ar currently no details"
  }

  var location: String {
    return task.location ?? ""
  }

  var tags: [Tag] {
    return task.tags?.allObjects as! [Tag]
  }
}
