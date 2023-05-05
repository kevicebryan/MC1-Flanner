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
  taskSeed(name: "Cafe Chilling",
           detail: "Looking for a cozy and relaxing activity to add to your activity? Consider visiting a cafe with live music! A cozy cafe with music is the perfect place to unwind, enjoy a warm drink and delicious food, and listen to live music in a comfortable and cozy atmosphere.\nYour family can choose from a variety of cafes, each with their own unique ambiance and music style. You can sip on coffee or tea, indulge in sweet treats, and chat or read while listening to live music. It's the perfect way to spend a relaxing afternoon or evening with your loved ones.",
           img: "cafeChilling", loc: "", tagNames: ["Indoor", "Music"]),
  taskSeed(name: "Trampoline Park",
           detail: "Looking for a high-energy and fun activity? Consider visiting a trampoline park! A trampoline park is a fun-filled indoor playground where you and your family can bounce, flip, and jump around to your heart's content.\nYour family can explore different areas of the trampoline park, such as a foam pit, dodgeball court, or basketball hoop. You can also choose to participate in different activities, such as a trampoline fitness class or a glow-in-the-dark jump session.",
           img: "trampolinePArk", loc: "", tagNames: ["Indoor", "Games"]),
  taskSeed(name: "Karaoke",
           detail: "Looking for a fun and entertaining activity to add to your activity? Consider karaoke! Karaoke is a great way to let loose and have fun with your family and friends. You can choose from a variety of songs, sing your heart out, and enjoy a night filled with laughter and music.\nYour family can visit a karaoke bar or rent a karaoke machine to use at home. You can also make it a themed night and dress up in costumes, or have a friendly competition to see who can sing the best. It's a great way to bond with your loved ones and create lasting memories.",
           img: "karaoke", loc: "", tagNames: ["Indoor", "Music"]),
  taskSeed(name: "Binge Watch at Home",
           detail: "Looking for a cozy and relaxing activity to add to your activity? Consider having a movie night in! Movie nights at home are a great way to spend quality time with your family, while also enjoying your favorite films.\nYour family can choose from a variety of movies, from classics to new releases, and set up a cozy movie-watching space in your living room. You can make some popcorn, bring out the blankets and pillows, and settle in for a fun and relaxing evening together.",
           img: "bingeWatching", loc: "", tagNames: ["Indoor", "Movie"]),
  taskSeed(name: "Museum",
           detail: "If you're looking for a fascinating and educational activity. consider visiting a museum! Museums offer a wealth of knowledge and inspiration, allowing you and your family to discover art, history, and culture in an engaging way.\nYour family can explore different exhibits and galleries, learn about the history of various cultures and civilizations, and marvel at the beauty and creativity of art. You can also attend educational programs and workshops, participate in interactive activities, and discover new interests and hobbies",
           img: "museum", loc: "", tagNames: ["Indoor", "Art"]),
  taskSeed(name: "Indoor Gardening",
           detail: "Looking for a fun and chill activity? Consider starting an indoor garden together! Indoor gardening is a great way to bring nature into your home, while also teaching your family about the importance of sustainability and healthy living.\nYour family can choose from a variety of plants, from herbs to flowers to small vegetables, and set up a designated indoor garden space in your home. You can learn about the different plant species, proper care and maintenance, and even use the herbs and vegetables you grow in your cooking.",
           img: "indoorGardening", loc: "", tagNames: ["Nature", "Indoor"]),
  taskSeed(name: "Window Shopping",
           detail: "Looking for a fun and easy activity? Consider taking a leisurely walk around the mall together! Walking around the mall is a great way to get some exercise and spend quality time with your family.\nYour family can explore the different stores and window shop, trying on clothes and testing out gadgets. You can also stop for a snack or a meal at one of the many food courts or restaurants in the mall.",
           img: "mall", loc: "", tagNames: ["Indoor", "Travel"]),
  taskSeed(name: "Pet Cafe",
           detail: "Looking for a unique and fun activity? Consider visiting a dog or cat cafe together! These cafes are a great way to spend time with your family and furry friends, while also supporting local animal shelters and adoption centers.\nYour family can choose from a variety of dog or cat cafes in your area, and spend time interacting with the animals. You can play with the cats, cuddle with the dogs, and even adopt a new furry friend if you're ready to make that commitment.",
           img: "petCafe", loc: "", tagNames: ["Nature", "Indoor", "Food"]),
  taskSeed(name: "Jet Ski",
           detail: "Looking for a fun and exciting way to enjoy the water with your family? Jetskiing is a thrilling water activity that offers a unique opportunity to experience the water in a new way.\nIt is a perfect way to bond with your family, enjoy the sun, and explore the beauty of the water. From racing across the waves to taking a leisurely tour of the coastline, jetskiing offers an unforgettable adventure for all ages.",
           img: "jetski", loc: "", tagNames: ["Outdoor", "Nature", "Adrenaline"]),
  taskSeed(name: "ATV Riding",
           detail: "Looking for an adrenaline-pumping activity? Consider an ATV adventure! Riding an ATV is a great way to explore new terrain, challenge yourself, and have fun with your family.\nATV adventure offers a unique opportunity to bond with your family, test your driving skills, and enjoy the beauty of nature. From riding through mud and dirt to tackling steep hills and obstacles, ATV adventure allows you to experience a thrilling adventure with your loved ones.",
           img: "atv", loc: "", tagNames: ["Outdoor", "Adrenaline", "Nature"]),
  taskSeed(name: "Outbond",
           detail: "Are you looking for a way to explore the great outdoors and experience thrilling adventures with your family? Outbond adventures offer a unique opportunity to connect with nature, challenge yourself, and create unforgettable memories with your loved ones.\nThese activities offer a chance to explore new environments, push your limits, and bond with your family in a way that's hard to replicate in any other setting.",
           img: "outbond", loc: "", tagNames: ["Outdoor", "Adrenaline", "Nature"]),
  taskSeed(name: "Backpacking",
           detail: "Looking for a thrilling and adventurous activity? Consider backpacking! Backpacking is a great way to explore nature, challenge yourself, and spend quality time with your family.\nIt offers a unique opportunity to disconnect from the hustle and bustle of everyday life and connect with nature. From sleeping under the stars to cooking meals over a campfire, backpacking allows you to experience the great outdoors in a whole new way.",
           img: "backpacking", loc: "", tagNames: ["Outdoor", "Nature", "Travel"]),
  taskSeed(name: "Camping",
           detail: "Looking for a relaxing and peaceful activity? Consider camping! Camping is a great way to disconnect from technology, unwind in nature, and spend quality time with your family.\nYou can easily discover new camping spots, reserve your campsite, and plan your activities. It offers a unique opportunity to slow down, enjoy the simple pleasures of life, and reconnect with your family. ",
           img: "camping", loc: "", tagNames: ["Outdoor", "Nature", "Travel"]),
  taskSeed(name: "Hiking",
           detail: "Looking for a fun and exciting way to enjoy the water with your family? Jetskiing is a thrilling water activity that offers a unique opportunity to experience the water in a new way.\nIt is a perfect way to bond with your family, enjoy the sun, and explore the beauty of the water. From racing across the waves to taking a leisurely tour of the coastline, jetskiing offers an unforgettable adventure for all ages.",
           img: "hiking", loc: "", tagNames: ["Outdoor", "Nature", "Sport"]),
  taskSeed(name: "Barbeque",
           detail: "Looking for a fun and delicious outdoor activity? Look no further than a family BBQ day! BBQs are a great way to enjoy the outdoors, spend quality time with your loved ones, and indulge in delicious food.\nYour family can fire up the grill, cook up some burgers, hot dogs, and veggies, and enjoy a variety of sides and drinks. You can play outdoor games, listen to music, or simply relax and enjoy the sunshine. BBQs are also a great opportunity to connect with family members and catch up on each other's lives.",
           img: "barbeque", loc: "", tagNames: ["Outdoor", "Nature", "Food"]),
  taskSeed(name: "Picnic",
           detail: "Looking for a peaceful and enjoyable activity? Consider having a picnic with music! A picnic is a great way to enjoy the outdoors and spend quality time with your family, while music can provide the perfect backdrop to your relaxing afternoon.\nYour family can choose a scenic location in a park or nature, and bring along a picnic blanket and basket filled with your favorite foods and drinks. ",
           img: "picnic", loc: "", tagNames: ["Outdoor", "Nature", "Food"]),
  taskSeed(name: "Villa Staycation",
           detail: "Looking for a luxurious and relaxing activity with your family? A staycation is a perfect opportunity to take a break from your routine, unwind, and spend quality time with your family.\nA villa staycation provides all the comfort and amenities of a luxury hotel but in a more private and exclusive setting. You and your family can enjoy a spacious villa with multiple bedrooms, a private pool, and other amenities such as a spa, gym, and outdoor activities.",
           img: "villaStaycation", loc: "", tagNames: ["Outdoor", "Nature", "Private"]),
  taskSeed(name: "Gardening",
           detail: "Looking for a fun and educational activity? Consider gardening! It is a great way to teach your family about plants and the environment while also adding some greenery to your home.\nWith outdoor gardening, you can grow a variety of plants, including herbs, vegetables, and flowers, regardless of the weather outside. You can also use the opportunity to teach your family about plant care, nutrition, and sustainability.",
           img: "gardening", loc: "", tagNames: ["Outdoor", "Nature"]),
  taskSeed(name: "Photo Hunting",
           detail: "Looking for a creative and engaging activity with your family? Taking pictures of nature and the outdoors is a great way to explore your surroundings, learn about the environment, and develop new skills in photography.\nYour family can choose from a variety of outdoor locations to explore, including parks, nature reserves, and hiking trails. Bring along your camera or smartphone to capture pictures of the scenery, wildlife, and natural features. ",
           img: "photoHunting", loc: "", tagNames: ["Outdoor", "Art"]),
  taskSeed(name: "Car Theater",
           detail: "Looking for a fun and unique activity? Consider watching a movie under the stars is a great way to enjoy a classic film or new release with your family while enjoying the great outdoors.\nYour family can choose from a variety of outdoor movie events, including screenings at parks, drive-in theaters, or even in your own backyard. Bring along blankets, pillows, and snacks for a cozy and comfortable experience. ",
           img: "carTheater", loc: "", tagNames: ["Outdoor", "Movie", "Private"]),
  taskSeed(name: "Picnic with Music",
           detail: "Looking for a peaceful and enjoyable activity? Consider having a picnic with music! A picnic is a great way to enjoy the outdoors and spend quality time with your family, while music can provide the perfect backdrop to your relaxing afternoon.\nYour family can choose a scenic location in a park or nature, and bring along a picnic blanket and basket filled with your favorite foods and drinks.",
           img: "picnicWithMusic", loc: "", tagNames: ["Outdoor", "Music", "Nature"]),
  taskSeed(name: "Bowling",
           detail: "If you're looking for a fun and competitive family activity, Bowling is a classic pastime that has been enjoyed by families for generations, and it's a great way to spend quality time with your loved ones. Whether you're a seasoned bowler or a first-timer, bowling night is a fun way to challenge yourself and your family members.\nYou can compete against each other or form teams and see who comes out on top. Bowling alleys often offer special features like glow-in-the-dark lanes and arcade games, making it a fun and immersive experience for everyone.",
           img: "bowling", loc: "", tagNames: ["Indoor", "Sport"]),
  taskSeed(name: "VR/AR Games",
           detail: "Looking for an exciting and innovative activity? Consider playing VR/AR sports games together! VR/AR technology allows you to experience sports in a whole new way, immersing you in a virtual environment and providing a realistic and interactive experience.\nYour family can choose from a variety of VR/AR sports games, from basketball and football to boxing and skiing. You can compete against each other or work together as a team, depending on the game and your family's preferences.",
           img: "vr", loc: "", tagNames: ["Indoor", "Sport"]),
  taskSeed(name: "Rock Climbing",
           detail: "Consider indoor rock climbing! Indoor rock climbing is a fun and exciting way to get some exercise and enjoy some adventure with your family.\nYour family can choose from a variety of rock climbing routes, ranging from easy and beginner-friendly to more challenging and advanced. You can work together as a team, cheering each other on and offering support and encouragement, as you scale new heights and conquer new challenges.",
           img: "rockClimbing", loc: "", tagNames: ["Indoor", "Sport"]),

  taskSeed(name: "Baking Studio",
           detail: "Looking for a fun and delicious activity? Consider taking a baking class at a studio together! Baking classes are a great way to learn new skills and techniques, while also enjoying some sweet treats with your family.\nYour family can choose from a variety of baking studios and classes, from beginner-level classes to more advanced courses. You can learn how to make a variety of baked goods, from cakes and cupcakes to bread and pastries.",
           img: "baking", loc: "", tagNames: ["Indoor", "Food"]),

  taskSeed(name: "Cooking Class",
           detail: "Looking for a fun and educational activity? Consider taking a cooking class together! Cooking classes are a great way to learn new culinary skills and techniques, while also enjoying some delicious food with your family.\nYour family can choose from a variety of cooking classes, ranging from basic knife skills to advanced gourmet cooking. You can learn how to cook a variety of cuisines, from Indonesian, or Western to Asian and Middle Eastern.",
           img: "cooking", loc: "", tagNames: ["Indoor", "Food"]),

  taskSeed(name: "Pottery",
           detail: "Looking for a unique and enriching activity? Consider taking a poetry class together! Poetry is a beautiful form of expression, and taking a class with your family can be a great way to explore new ideas, build vocabulary, and improve communication skills.\nYour family can choose from a variety of poetry classes, from beginner to advanced, and explore different styles and techniques. You can learn about the history of poetry, analyze famous poems, and even write and share your own poems with each other.",
           img: "pottery", loc: "", tagNames: ["Indoor", "Art"]),

  taskSeed(name: "Biking",
           detail: "Looking for an exciting and healthy activity? Consider biking! Biking is a great way to get outside, explore your surroundings, and spend quality time with your family.\nYou can easily discover new biking trails, plan your route, and schedule your biking adventure. You can also use the app to track your progress, monitor the weather, and even get tips and advice from other bikers.",
           img: "biking", loc: "", tagNames: ["Outdoor", "Nature", "Art"]),

  taskSeed(name: "Paintball",
           detail: "Looking for an action-packed and adrenaline-fueled activity with your family? Paintball is an exciting game that combines strategy, teamwork, and friendly competition, making it a perfect choice for a thrilling family outing.\nYour family can gear up with paintball masks, markers, and protective gear before venturing into an outdoor paintball field. You'll have the chance to test your skills, work together as a team, and enjoy an exhilarating experience together.",
           img: "paintball", loc: "", tagNames: ["Outdoor", "Sport", "Adrenaline"]),

//  taskSeed(name: "Pho",
//           detail: "",
//           img: "", loc: "", tagNames: ["", ""]),
//  taskSeed(name: "Pho",
//           detail: "",
//           img: "", loc: "", tagNames: ["", ""]),
//  taskSeed(name: "Pho",
//           detail: "",
//           img: "", loc: "", tagNames: ["", ""]),
]
