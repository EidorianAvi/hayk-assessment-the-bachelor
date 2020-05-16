require 'pry'

def get_winner seasons, season_label
  seasons[season_label].each do |contestant|
    if contestant["status"] == "Winner"
      return contestant["name"]
    end
  end
end 

def get_contestants seasons
  seasons.reduce([]) do |all_contestants, (season_label, contestants)|
    contestants_with_season = contestants.map do |contestant|
      contestant["season"] = season_label
      contestant
    end
  all_contestants.concat(contestants_with_season)
  end
end

def get_first_name_of_season_winner seasons, season_label
  full_name = get_winner(seasons, season_label).split(" ")
  full_name[0]
end

def get_contestant_name seasons, occupation
  get_contestants(seasons).each do |contestant|
    if contestant["occupation"] == occupation
      return contestant["name"]
    end
  end
end

def count_contestants_by_hometown seasons, hometown
  count = 0 
  get_contestants(seasons).each do |contestant|
    if contestant["hometown"] == hometown
      count += 1 
    end
  end
  count
end

def get_occupation seasons, hometown
  get_contestants(seasons).find do |contestant|
    if contestant["hometown"] == hometown
      return contestant["occupation"]
    end
  end
end

def get_average_age_for_season seasons, season_label
  total_age = 0
  number_of_contestants = 0 
  seasons[season_label].each do |contestant|
    total_age += contestant["age"].to_f
    number_of_contestants += 1
  end
  average_age = (total_age / number_of_contestants).round
end
