set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}

# every 1.minute do
#   rake "todo:print_bonjour", :environment => :development,
#     :output => "log/cron_hello_log.log"
# end

every :hour do
   rake "todo:delete_items", :environment => :development
   rake "todo:delete_items", :environment => :production
end