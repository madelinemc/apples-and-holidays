require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].map do |winter_holiday_keys, winter_holiday_values|
    winter_holiday_values << "#{supply}"
  end
end

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << "#{supply}"
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_supplies = []
  holiday_hash.each do |season, holiday|
    if season == :winter
   holiday.each do |winter_holiday, supplies|
      supplies.each do |supply|
        holiday_supplies << supply
        end
      end
    end
  end
  holiday_supplies
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, season_hash|
    puts "#{season}:".capitalize!
    season_hash.each do |holiday, supplies_array|
      split_holiday_words = holiday.to_s.split("_")
      capitalized_split_holiday_words = split_holiday_words.map {|word| word.capitalize!}
      rejoined_split_holiday_words = capitalized_split_holiday_words.join(" ")
      puts "  #{rejoined_split_holiday_words}: #{supplies_array.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_supplies = []
  holiday_hash.each do |season, holiday|
   holiday.each do |nested_holiday, supplies_array|
      if supplies_array.include?("BBQ") 
        holiday_supplies << nested_holiday
      end
    end
  end
  holiday_supplies
end