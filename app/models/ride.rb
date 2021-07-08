class Ride < ActiveRecord::Base
  belongs_to :passenger
  belongs_to :driver

  def print_details
    puts "#{self.driver.first_name} #{self.driver.last_name} drove #{self.passenger.first_name} #{self.passenger.last_name} for #{self.price} from #{self.pick_up} to #{self.drop_off}"
  end
end