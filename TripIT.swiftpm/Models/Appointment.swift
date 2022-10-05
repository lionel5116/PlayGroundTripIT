import Foundation

struct Appointment: Codable {
    var _id: String
    var AppType: String
    var AppDate: String
    var ContactPerson: String
    var ContactPhone: String
    var Status: String
    var Location: String
    var Cost: Double?
    var Notes: String
    
    init (
    _id: String,
    AppType: String,
    AppDate: String,
    ContactPerson: String,
    ContactPhone: String,
    Status: String,
    Location: String,
    Cost: Double?,
    Notes: String
    )
    {
        self._id = _id
        self.AppType = AppType
        self.AppDate = AppDate
        self.ContactPerson = ContactPerson
        self.ContactPhone = ContactPhone
        self.Status = Status
        self.Location = Location
        self.Cost = Cost
        self.Notes = Notes
    }
}



