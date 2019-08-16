import UIKit

public class Event {
    let title: String
    let date: String?
    let location: String?
    let eventType: EventType
    
    enum EventType: String {
        case social = "Social Event"
        case community = "Community Event"
        case workshop = "Workshop"
        case panel = "Panel"
    }
    
    init(title: String, date: String? = "TBA", location: String? = "TBA", eventType: EventType) {
        self.title = title
        self.date = date
        self.location = location
        self.eventType = eventType
    }
}

public class Schedule {
    let semester: String
    let schedule: [Event]
    let isInterested: Bool = true
    
    init() {
        semester = "Fall 2019"
        schedule = [
            
            Event(title: "CSAIT IRL: A Social Event.",
                  date: "Thursday September 19, 2019, 7pm - 11pm",
                  location: "Fennell Campus, The Cellar (back of The Arnie)",
                  eventType: .social),
            
            Event(title: "The New Developers s01e02: Building Your Portfolio",
                  date: "Wednesday, September 25, 2019, 5:30pm - 7:30pm",
            //      location: "TBA",
                  eventType: .workshop),
            
            Event(title: "The New Developers s01e03: Speed Interviewing",
                  date: "Wednesday, October 30, 2019, 5:30pm - 7:30pm",
            //      location: "TBA",
                  eventType: .workshop),
            
            Event(title: "The New Developers s01e04: Making the Most of Your First Job",
            //      date: "TBA",
            //      location: "TBA",
                  eventType: .panel)
        ]
        
        for event in schedule {
            // if event details are unknown or you're interested to learn more...
            if event.date == "TBA" || event.location == "TBA" || self.isInterested {
                self.goToWebsite()
                // TODO: Visit us at
                // https://thenewdevelopers.com
                // Sign up for curated content straight to your inbox,
                // register for upcoming events,
                // meet cool people, build cool stuff.
            }
        }
        
    }
    
    func goToWebsite() {
        if let url = URL(string: "https://www.thenewdevelopers.com") {
            UIApplication.shared.open(url)
        }
    }
    
}


var schedule = Schedule()

for event in schedule.schedule {
    print(event.title)
    print(event.date?.description)
    print(event.location?.description)
    print(event.eventType.rawValue)
}
