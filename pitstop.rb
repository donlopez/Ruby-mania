def get_race_data
    puts "Enter your current fuel level percentage: "
    fuel_level = gets.chomp.to_i
    puts "Enter the number of people you have passed: "
    people_passed = gets.chomp.to_i
    puts "Enter the number of laps you have maintained the same position: "
    laps_in_same_place = gets.chomp.to_i
    return fuel_level, people_passed, laps_in_same_place
  end
  
  def should_pitstop(fuel_level, people_passed, laps_in_same_place)
    conditions = {
      low_fuel_and_people_passed: fuel_level < 50 && people_passed >= 2,
      low_fuel_and_laps_in_same_place: fuel_level < 50 && laps_in_same_place >= 5
    }
  
    if conditions[:low_fuel_and_people_passed] || conditions[:low_fuel_and_laps_in_same_place]
      return "Pull in for a pitstop."
    else
      return "Keep racing!"
    end
  end
  
  def race_advice
    puts "Welcome to the Racing Strategy Advisor!"
    puts "Let's determine if you need a pitstop."
    fuel_level, people_passed, laps_in_same_place = get_race_data
  
    decision = should_pitstop(fuel_level, people_passed, laps_in_same_place)
    puts "\nDecision: #{decision}"
  
    if decision == "Pull in for a pitstop."
      puts "Looks like your car needs a break! Time to refuel and re-energize."
    else
      puts "You're doing great! Keep pushing those limits on the track!"
    end
  end
  
  # Start the race advice
  race_advice