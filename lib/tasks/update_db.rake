namespace :db do
  desc "Clears station table."
  task clear: :environment do
    Station.all.destroy_all
    puts "Station's table cleared"
  end

  desc "Populates the station table."
  task populate: :environment do
    StationCollection.all
    puts "Station's table re-populated"
  end

  desc "Clears the station table, then repopulates it."
  task update: [:clear, :populate]
end
