namespace :todo do
  desc "Deletes items older than seven days!!"
  task delete_items: :environment do
    destroyed = Item.where("created_at <= ?", Time.now - 7.days).destroy_all
    puts "Destroyed #{destroyed.count} items"
  end

  # desc "Prints a greeting"
  # task print_bonjour: :environment do
  #   puts "BONJOUR, ANDREA!"
  # end
end