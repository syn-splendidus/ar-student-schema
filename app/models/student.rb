require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates :email, :format => { :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/ }
  validates :email, :uniqueness => true
  validates_inclusion_of :age, :in => 5..130
  validates :phone, :format => { :with =>  /\(?[0-9]{3}\)?\s?-?[0-9]{3}\s?-?[0-9]{4}/}


  def name
   first_name + " " + last_name
  end

 def age
    year_diff = Date.today.year - birthday.year 
    if Date.today.month == birthday.month && Date.today.day < birthday.day
      year_diff - 1
    elsif Date.today.month < birthday.month 
      year_diff - 1
    else
      year_diff
    end
  end
end
