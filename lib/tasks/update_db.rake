namespace :db do
  desc "Clears station table."
  task clear: :environment do
    Station.all.destroy_all
    puts "Stations table cleared"
  end

  desc "Populates the station table."
  task populate: :environment do
    StationCollection.update_from_citibike_api
    puts "Stations table re-populated"
  end

  desc "Clears the station table, then repopulates it."
  task update: [:clear, :populate]
end
