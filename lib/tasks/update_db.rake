namespace :db do
  desc "Clears station table."
  task clear: :environment do
    Station.all.destroy_all
  end

  desc "Populates the station table."
  task populate: :environment do
    StationCollection.all
  end

  desc "Clears the station table, then repopulates it."
  task update: [:clear, :populate]
end
