//
//  TaskListViewModel.swift
//  Flanner
//
//  Created by Kevin Bryan on 19/04/23.
//

import CoreData
import Foundation
import SwiftUI

class TaskListViewModel: ObservableObject {
  let taskModel = TaskModel()

  @Published var tasks: [TaskViewModel] = []

  var recommendations: [TaskViewModel] = [] // MARK: Hanya sampe 6

  var carouselRecs: [TaskViewModel] = []
  var cardRecs: [TaskViewModel] = []

  var doneTasks: [TaskViewModel] = []
  var plannedTasks: [TaskViewModel] = []

  init() {
    getAllTask()
    if !UserManager().users.isEmpty {
      getRecommendations()
    }
  }

  func refreshAllTask() {
    getAllTask()
    getRecommendations()
  }

  func getAllTask() {
    tasks = taskModel.getAllTasks().map(TaskViewModel.init)

    plannedTasks = tasks.filter {
      $0.planned == true
    }

    doneTasks = tasks.filter {
      $0.done == true
    }
  }

  func rateTask(task: TaskViewModel, rating: Int = 2) {
    for taskTag in task.tags {
      if rating == 1 {
        taskTag.weight = 1
      }
      if rating == 2 {
        taskTag.weight = 2
      }
      if rating == 3 {
        taskTag.weight = 3
      }
      print("RATED \(taskTag.name ?? "ERR") : \(taskTag.weight)")
      task.task.reviewed = true
    }
  }

  func getPlanResult(selectedTags: [TagViewModel]) -> [TaskViewModel] {
    // MARK: penampung calon task yang akan ada di rekomendasi

    struct CalonPlan {
      let task: TaskViewModel
      let tagCount: Int
    }

    var calonPlans: [CalonPlan] = []

    // MARK: jika tasknya punya at least 1 tag yang cocok append ke calon rekomendasi

    for task in tasks {
      var corrTag = 0
      for taskTag in task.tags {
        for selectedTag in selectedTags {
          if selectedTag.name == taskTag.name {
            corrTag += 1
          }
        }
      }
      if corrTag >= 2 {
        calonPlans.append(CalonPlan(task: task, tagCount: corrTag))
      }
      corrTag = 0
    }

    print("\nCALON PLANS:\n \(calonPlans)")

    // MARK: sort calon rekomendasi berdasarkan tagCount, yang paling banyak paling pertama

    calonPlans.sort { $0.tagCount > $1.tagCount }

    // MARK: kita kosongin dlu recommendation biar dia fresh

    var plans: [TaskViewModel] = []

    // MARK: ambil 6 task yang paling pertama masukin ke recommendation

    for (idx, cp) in calonPlans.enumerated() {
      plans.append(cp.task)
      if idx == 3 {
        break
      }
    }
    return plans
  }

  func planTask(task: TaskViewModel, plan: Bool = true) {
    if plan == true {
      task.task.planned = true
    } else {
      task.task.planned = false
    }
  }

  func doneTask(task: TaskViewModel, done: Bool = true) {
    if done == true {
      task.task.done = true
    } else {
      task.task.done = false
    }
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
      corrTag = 0
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

      if idx < 3 {
        carouselRecs.append(cr.task)
      } else {
        cardRecs.append(cr.task)
      }

      if idx == 5 {
        break
      }
    }

    print("\nFINAL RECS:\n \(recommendations.count)")
  }
}

struct TaskViewModel: Identifiable {
  let task: Task

  var id: NSManagedObjectID {
    return task.objectID
  }

  var name: String {
    return task.name ?? ""
  }

  var image: String {
    if task.image == "" || task.image == " " || (task.image == nil) {
      return "dummyImage"
    }

    let imageExists: Bool = UIImage(named: task.image ?? "") != nil
    if !imageExists { return "dummyImage" }

    return task.image ?? "dummyImage"
  }

  var detail: String {
    if task.detail == "" || task.detail == " " || (task.detail == nil) {
      return "There ar currently no details..."
    }
    return task.detail ?? "There ar currently no details..."
  }

  var location: String {
    if task.location == "" || task.location == " " || (task.location == nil) {
      return ""
    }
    return task.image ?? ""
  }

  var reviewed: Bool {
    if task.reviewed == nil || task.reviewed == false {
      return false
    }
    return true
  }

  var done: Bool {
    if task.done == nil || task.done == false {
      return false
    }
    return true
  }

  var planned: Bool {
    if task.planned == nil || task.planned == false {
      return false
    }
    return true
  }

  var tags: [Tag] {
    return task.tags?.allObjects as! [Tag]
  }
}
