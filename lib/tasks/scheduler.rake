desc "Deletes items older than 7 days, man!"
task delete_items: :environment do
  puts "It's #{Time.now}... deleting those items..."
  destroyed = Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  puts "Destroyed #{destroyed.count} items, man!"
end