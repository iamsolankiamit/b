Kaminari.configure do |config|
   config.default_per_page = 10
   config.max_per_page = 10
   config.window = 2
   config.outer_window = 0
   config.left = 1
   config.right = 1
   config.page_method_name = :page
   config.param_name = :page
end
