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
    return task.image ?? "defaultTaskImage"
  }

  var detail: String {
    return task.detail ?? "There ar currently no details"
  }

  var location: String {
    return task.location ?? ""
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
