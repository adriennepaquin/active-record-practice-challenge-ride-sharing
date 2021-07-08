class Passenger < ActiveRecord::Base
  has_many :rides
  has_many :drivers, through: :rides

  def car_list
    cars = self.drivers.map{|driver| driver.car}
    cars.join(';')
  end

  def self.average_rating
    self.average(:rating).to_i
  end

  def self.worst_rated
    worst = self.minimum(:rating).to_i
    self.find_by(rating: worst)
  end

  def self.worst_rating_in_existence
    self.minimum(:rating).to_i
  end
end