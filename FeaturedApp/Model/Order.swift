//
//  Order.swift
//  FeaturedApp
//
//  Created by Reza Harris on 26/10/21.
//

import Foundation

struct Order: Equatable
{
  var firstName: String
  var lastName: String
  var phone: String
  var email: String
  
  var billingAddress: Address
  var paymentMethod: PaymentMethod
  
  var shipmentAddress: Address
  var shipmentMethod: ShipmentMethod
  
  var id: String?
  var date: Date
  var total: NSDecimalNumber
}

func ==(lhs: Order, rhs: Order) -> Bool
{
  return lhs.firstName == rhs.firstName
  && lhs.lastName == rhs.lastName
  && lhs.phone == rhs.phone
  && lhs.email == rhs.email
  && lhs.billingAddress == rhs.billingAddress
  && lhs.paymentMethod == rhs.paymentMethod
  && lhs.shipmentAddress == rhs.shipmentAddress
  && lhs.shipmentMethod == rhs.shipmentMethod
  && lhs.id == rhs.id
  && lhs.date.timeIntervalSince(rhs.date) < 1.0
  && lhs.total == rhs.total
}

struct Address
{
  var street1: String
  var street2: String?
  var city: String
  var state: String
  var zip: String
}

func ==(lhs: Address, rhs: Address) -> Bool
{
  return lhs.street1 == rhs.street1
  && lhs.street2 == rhs.street2
  && lhs.city == rhs.city
  && lhs.state == rhs.state
  && lhs.zip == rhs.zip
}

struct ShipmentMethod
{
  enum ShippingSpeed: Int {
    case Standard = 0
    case OneDay = 1
    case TwoDay = 2
  }
  var speed: ShippingSpeed
  
  func toString() -> String
  {
    switch speed {
    case .Standard:
      return "Standard Shipping"
    case .OneDay:
      return "One-Day Shipping"
    case .TwoDay:
      return "Two-Day Shipping"
    }
  }
}

func ==(lhs: ShipmentMethod, rhs: ShipmentMethod) -> Bool
{
  return lhs.speed == rhs.speed
}

struct PaymentMethod
{
  var creditCardNumber: String
  var expirationDate: Date
  var cvv: String
}

func ==(lhs: PaymentMethod, rhs: PaymentMethod) -> Bool
{
  return lhs.creditCardNumber == rhs.creditCardNumber && lhs.expirationDate.timeIntervalSince(rhs.expirationDate) < 1.0 && lhs.cvv == rhs.cvv
}
