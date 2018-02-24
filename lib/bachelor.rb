require 'pry'

def get_first_name_of_season_winner(data, season)
  first_name = nil

  data[season].each do |line|
    #returns line of key and value pairs
    line.each do |key, value|
      if value == "Winner"
        #reassigns first name to eq the value of line hash w/ key "name" and splits it 
        #it returns and array and then returns the first index
        first_name = line["name"].split(" ")[0]
      end
    end
  end
  first_name
end

def get_contestant_name(data, occupation)
  girl = nil

  data.each do |season, values|
    values.each do |attributes|
    if attributes["occupation"] == occupation
      #reassigns value of girl to the value of attributes hash w/ key "name"
      girl = attributes["name"]
    end
   end
  end
  girl
end

def count_contestants_by_hometown(data, hometown)

  @counter = 0

  data.each do |season, attributes|
    attributes.each do |line|
      if line["hometown"] == hometown
        @counter += 1
      end
    end
  end
  @counter
end

def get_occupation(data, hometown)
  @occupation = nil

  data.each do |season, attributes|
    attributes.each do |line|
      if line["hometown"] == hometown && @occupation == nil
        @occupation = line["occupation"]
    end  
  end
end
  @occupation
end

def get_average_age_for_season(data, season)
  ave_age = []

  data[season].each do |line|
    #shovels value converted into an integer into array
    ave_age << line["age"].to_i
  end
  #injects an inital value at 0.0, the block is passed an accumulator(sum) value and an element, the element gets successively added to the accumultor
  age = ave_age.inject(0.0) { |sum, el| sum + el } / ave_age.size 
  age.round
end
