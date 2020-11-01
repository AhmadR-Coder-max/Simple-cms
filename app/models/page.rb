class Page < ApplicationRecord
  belongs_to :subject
  # In case you don't follow the rails convention, you name your join table with a different name
  # Then you can specify your table_name here
  # has_and_belongs_to_many :admin_users, join_table: "admin_users_pages"

  # has_and_belongs_to_many :admin_users

  has_and_belongs_to_many :editors, class_name: "AdminUser"

end
