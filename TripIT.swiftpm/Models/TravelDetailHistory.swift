
import Foundation
struct TravelDetailHistory: Codable{
    var _id: String
    var Destination:String
    var Year:String
    var TravelDate:String
    var Airline:String
    var Hotel:String
    var BookingCode:String
    var APCode:String
    var ItineraryFlght:String
    var ItineraryHotel:String
    var Status:String
    var FlightCost:Double?
    var HotelCost:Double?
    var GirlCost:Double?
    var TotalCost:Double?
    var Rating:String
    var Notes:String
    
    init(
        _id: String,
        Destination:String,
        Year:String,
        TravelDate:String,
        Airline:String,
        Hotel:String,
        BookingCode:String,
        APCode:String,
        ItineraryFlght:String,
        ItineraryHotel:String,
        Status:String,
        FlightCost:Double?,
        HotelCost:Double?,
        GirlCost:Double?,
        TotalCost:Double?,
        Rating:String,
        Notes:String
    ) {
        
        self._id = _id
        self.Destination = Destination
        self.Year = Year
        self.TravelDate = TravelDate
        self.Airline = Airline
        self.Hotel = Hotel
        self.BookingCode = BookingCode
        self.APCode = APCode
        self.ItineraryFlght = ItineraryFlght
        self.ItineraryHotel = ItineraryHotel
        self.Status = Status
        self.FlightCost = FlightCost
        self.HotelCost = HotelCost
        self.GirlCost = GirlCost
        self.TotalCost = TotalCost
        self.Rating = Rating
        self.Notes = Notes
    }
}


