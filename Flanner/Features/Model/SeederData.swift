//
//  SeederData.swift
//  Flanner
//
//  Created by Kevin Bryan on 29/04/23.
//

import CoreData
import Foundation

let cdm = CoreDataManager.shared

public struct tagSeed {
  var name: String
  var color: String
  var emoji: String
}

public struct taskSeed {
  var name: String
  var detail: String
  var img: String
  var loc: String
  var tagNames: [String]
}

public let tagSeeds = [tagSeed(name: "Indoor", color: "EA996A", emoji: "🚪"),
                       tagSeed(name: "Outdoor", color: "1F7C88", emoji: "🏕️"),
                       tagSeed(name: "Music", color: "1F7C88", emoji: "🎶"),
                       tagSeed(name: "Art", color: "D38800", emoji: "🎨"),
                       tagSeed(name: "Sport", color: "D66828", emoji: "🏎️"),
                       tagSeed(name: "Game", color: "015560", emoji: "🎮"),
                       tagSeed(name: "Food", color: "EA996A", emoji: "🍽️"),
                       tagSeed(name: "Movie", color: "D66828", emoji: "🍿"),
                       tagSeed(name: "Adrenaline", color: "D66828", emoji: "🎢"),
                       tagSeed(name: "Nature", color: "4AAAB6", emoji: "🍃"),
                       tagSeed(name: "Travel", color: "8BD1D8", emoji: "✈️"),
                       tagSeed(name: "Crowded", color: "F3A923", emoji: "👫"),
                       tagSeed(name: "Relaxing", color: "4AAAB6", emoji: "🧘"),
                       tagSeed(name: "Private", color: "4AAAB6", emoji: "🔒")]

public let taskSeeds = [
  taskSeed(name: "Live Music",
           detail: "Looking for a fun and exciting activity to add to your activity? We consider attending a live music event! Live music performances offer a unique experience that your whole family can enjoy. You can sing and dance along with the music, feel the energy of the crowd, and make lasting memories with your loved ones.\nYour family can choose from a variety of genres, such as rock, pop, jazz, or classical, and attend a concert or festival featuring your favorite artists. You can sing and dance along with the music, feel the energy of the crowd, and make lasting memories with your loved ones.",
           img: "liveMusic", loc: "", tagNames: ["Music", "Indoor"]),
  taskSeed(name: "Music Cafe Chilling",
           detail: "Looking for a cozy and relaxing activity to add to your activity? Consider visiting a cafe with live music! A cozy cafe with music is the perfect place to unwind, enjoy a warm drink and delicious food, and listen to live music in a comfortable and cozy atmosphere.\nYour family can choose from a variety of cafes, each with their own unique ambiance and music style. You can sip on coffee or tea, indulge in sweet treats, and chat or read while listening to live music. It's the perfect way to spend a relaxing afternoon or evening with your loved ones.",
           img: "", loc: "", tagNames: ["Indoor", "Music"]),
  taskSeed(name: "Karaoke",
           detail: "Looking for a fun and entertaining activity to add to your activity? Consider karaoke! Karaoke is a great way to let loose and have fun with your family and friends. You can choose from a variety of songs, sing your heart out, and enjoy a night filled with laughter and music.\nYour family can visit a karaoke bar or rent a karaoke machine to use at home. You can also make it a themed night and dress up in costumes, or have a friendly competition to see who can sing the best. It's a great way to bond with your loved ones and create lasting memories.",
           img: "", loc: "", tagNames: ["Indoor", "Music"]),
  taskSeed(name: "Binge Watch at Home",
           detail: "Looking for a cozy and relaxing activity to add to your activity? Consider having a movie night in! Movie nights at home are a great way to spend quality time with your family, while also enjoying your favorite films.\nYour family can choose from a variety of movies, from classics to new releases, and set up a cozy movie-watching space in your living room. You can make some popcorn, bring out the blankets and pillows, and settle in for a fun and relaxing evening together.",
           img: "", loc: "", tagNames: ["Indoor", "Movie"]),
  taskSeed(name: "Museum",
           detail: "If you're looking for a fascinating and educational activity. consider visiting a museum! Museums offer a wealth of knowledge and inspiration, allowing you and your family to discover art, history, and culture in an engaging way.\nYour family can explore different exhibits and galleries, learn about the history of various cultures and civilizations, and marvel at the beauty and creativity of art. You can also attend educational programs and workshops, participate in interactive activities, and discover new interests and hobbies",
           img: "", loc: "", tagNames: ["Indoor", "Art"]),
  taskSeed(name: "Poetry Class",
           detail: "Looking for a unique and enriching activity? Consider taking a poetry class together! Poetry is a beautiful form of expression, and taking a class with your family can be a great way to explore new ideas, build vocabulary, and improve communication skills.\nYour family can choose from a variety of poetry classes, from beginner to advanced, and explore different styles and techniques. You can learn about the history of poetry, analyze famous poems, and even write and share your own poems with each other.",
           img: "", loc: "", tagNames: ["Indoor", "Art"]),
  taskSeed(name: "Indoor Gardening",
           detail: "Looking for a fun and chill activity? Consider starting an indoor garden together! Indoor gardening is a great way to bring nature into your home, while also teaching your family about the importance of sustainability and healthy living.\nYour family can choose from a variety of plants, from herbs to flowers to small vegetables, and set up a designated indoor garden space in your home. You can learn about the different plant species, proper care and maintenance, and even use the herbs and vegetables you grow in your cooking.",
           img: "", loc: "", tagNames: ["Nature", "Indoor"]),
  taskSeed(name: "Pet Cafe",
           detail: "Looking for a unique and fun activity? Consider visiting a dog or cat cafe together! These cafes are a great way to spend time with your family and furry friends, while also supporting local animal shelters and adoption centers.\nYour family can choose from a variety of dog or cat cafes in your area, and spend time interacting with the animals. You can play with the cats, cuddle with the dogs, and even adopt a new furry friend if you're ready to make that commitment.",
           img: "", loc: "", tagNames: ["Nature", "Indoor", "Food"]),

  taskSeed(name: "Jet Ski",
           detail: "Looking for a fun and exciting way to enjoy the water with your family? Jetskiing is a thrilling water activity that offers a unique opportunity to experience the water in a new way.\nIt is a perfect way to bond with your family, enjoy the sun, and explore the beauty of the water. From racing across the waves to taking a leisurely tour of the coastline, jetskiing offers an unforgettable adventure for all ages.",
           img: "", loc: "", tagNames: ["Outdoor", "Nature", "Adrenaline"]),
  taskSeed(name: "ATV Riding",
           detail: "Looking for an adrenaline-pumping activity? Consider an ATV adventure! Riding an ATV is a great way to explore new terrain, challenge yourself, and have fun with your family.\nATV adventure offers a unique opportunity to bond with your family, test your driving skills, and enjoy the beauty of nature. From riding through mud and dirt to tackling steep hills and obstacles, ATV adventure allows you to experience a thrilling adventure with your loved ones.",
           img: "", loc: "", tagNames: ["Outdoor", "Adrenaline", "Nature"]),
  taskSeed(name: "Outbond",
           detail: "Are you looking for a way to explore the great outdoors and experience thrilling adventures with your family? Outbond adventures offer a unique opportunity to connect with nature, challenge yourself, and create unforgettable memories with your loved ones.\nThese activities offer a chance to explore new environments, push your limits, and bond with your family in a way that's hard to replicate in any other setting.",
           img: "", loc: "", tagNames: ["Outdoor", "Adrenaline", "Nature"]),
  taskSeed(name: "Backpacking",
           detail: "Looking for a thrilling and adventurous activity? Consider backpacking! Backpacking is a great way to explore nature, challenge yourself, and spend quality time with your family.\nIt offers a unique opportunity to disconnect from the hustle and bustle of everyday life and connect with nature. From sleeping under the stars to cooking meals over a campfire, backpacking allows you to experience the great outdoors in a whole new way.",
           img: "", loc: "", tagNames: ["Outdoor", "Nature", "Travel"]),
  taskSeed(name: "Camping",
           detail: "Looking for a relaxing and peaceful activity? Consider camping! Camping is a great way to disconnect from technology, unwind in nature, and spend quality time with your family.\nYou can easily discover new camping spots, reserve your campsite, and plan your activities. It offers a unique opportunity to slow down, enjoy the simple pleasures of life, and reconnect with your family. ",
           img: "", loc: "", tagNames: ["Outdoor", "Nature", "Travel"]),
  taskSeed(name: "Hiking",
           detail: "Looking for a fun and exciting way to enjoy the water with your family? Jetskiing is a thrilling water activity that offers a unique opportunity to experience the water in a new way.\nIt is a perfect way to bond with your family, enjoy the sun, and explore the beauty of the water. From racing across the waves to taking a leisurely tour of the coastline, jetskiing offers an unforgettable adventure for all ages.",
           img: "", loc: "", tagNames: ["Outdoor", "Nature", "Sport"]),
  taskSeed(name: "Barbeque",
           detail: "Looking for a fun and delicious outdoor activity? Look no further than a family BBQ day! BBQs are a great way to enjoy the outdoors, spend quality time with your loved ones, and indulge in delicious food.\nYour family can fire up the grill, cook up some burgers, hot dogs, and veggies, and enjoy a variety of sides and drinks. You can play outdoor games, listen to music, or simply relax and enjoy the sunshine. BBQs are also a great opportunity to connect with family members and catch up on each other's lives.",
           img: "", loc: "", tagNames: ["Outdoor", "Nature", "Food"]),
  taskSeed(name: "Picnic",
           detail: "Looking for a peaceful and enjoyable activity? Consider having a picnic with music! A picnic is a great way to enjoy the outdoors and spend quality time with your family, while music can provide the perfect backdrop to your relaxing afternoon.\nYour family can choose a scenic location in a park or nature, and bring along a picnic blanket and basket filled with your favorite foods and drinks. ",
           img: "", loc: "", tagNames: ["Outdoor", "Nature", "Food"]),
  taskSeed(name: "Villa Staycation",
           detail: "Looking for a luxurious and relaxing activity with your family? A staycation is a perfect opportunity to take a break from your routine, unwind, and spend quality time with your family.\nA villa staycation provides all the comfort and amenities of a luxury hotel but in a more private and exclusive setting. You and your family can enjoy a spacious villa with multiple bedrooms, a private pool, and other amenities such as a spa, gym, and outdoor activities.",
           img: "", loc: "", tagNames: ["Outdoor", "Nature", "Private"]),
  taskSeed(name: "Gardening",
           detail: "Looking for a fun and educational activity? Consider gardening! It is a great way to teach your family about plants and the environment while also adding some greenery to your home.\nWith outdoor gardening, you can grow a variety of plants, including herbs, vegetables, and flowers, regardless of the weather outside. You can also use the opportunity to teach your family about plant care, nutrition, and sustainability.",
           img: "", loc: "", tagNames: ["Outdoor", "Nature"]),
  taskSeed(name: "Photo Hunting",
           detail: "Looking for a creative and engaging activity with your family? Taking pictures of nature and the outdoors is a great way to explore your surroundings, learn about the environment, and develop new skills in photography.\nYour family can choose from a variety of outdoor locations to explore, including parks, nature reserves, and hiking trails. Bring along your camera or smartphone to capture pictures of the scenery, wildlife, and natural features. ",
           img: "", loc: "", tagNames: ["Outdoor", "Art"]),
  taskSeed(name: "Pho",
           detail: "",
           img: "", loc: "", tagNames: ["Outdoor", "Art"]),
]
