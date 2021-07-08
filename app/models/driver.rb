class Driver < ActiveRecord::Base
  has_many :rides
  has_many :passengers, through: :rides

  def accept_ride_request(passenger, price, pick_up, drop_off)
    Ride.create(passenger_id: passenger.id, price: price, pick_up: pick_up, drop_off: drop_off, driver_id: self.id)
  end

  def total_income
    Ride.where(driver_id: self.id).sum(:price)
  end

  def cancel_ride(passenger)
    cancel = Ride.find_by({passenger_id: passenger.id, driver_id: self.id})
    Ride.destroy(cancel.id)
  end

  def self.most_active_driver
    active = Ride.group(:driver_id).count.sort_by{|k,v| v}.last[0]
    self.find_by(id: active)
  end

  def self.best_performing_driver
    highest_rating = self.maximum('rating')
    self.find_by(rating: highest_rating)
  end

end