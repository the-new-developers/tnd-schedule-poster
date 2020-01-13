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
        case presentation = "Presentation"
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
        semester = "Winter 2020"
        schedule = [
            
            Event(title: "CSAIT IRL: A Social Event.",
                  date: "Wednesday February 5, 6pm - 10pm",
                  location: "Fennell Campus, The Cellar (back of The Arnie)",
                  eventType: .social),
            
            Event(title: "The New Developers s02e01: Freelancing",
                  date: "February TBA",
            //      location: "Fennell Campus, TBA",
                  eventType: .presentation),
            
            Event(title: "The New Developers s02e02: The Code Review",
                  date: "March TBA",
            //      location: "Fennell Campus, TBA",
                  eventType: .workshop)
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
