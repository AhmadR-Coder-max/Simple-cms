class Page < ApplicationRecord
  belongs_to :subject
  has_many :sections
  # In case you don't follow the rails convention, you name your join table with a different name
  # Then you can specify your table_name here
  # has_and_belongs_to_many :admin_users, join_table: "admin_users_pages"

  # has_and_belongs_to_many :admin_users

  has_and_belongs_to_many :editors, class_name: "AdminUser"

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  validates_uniqueness_of :permalink

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("pages.position ASC") }
  scope :newest_first, lambda { order("pages.created_at DESC") }
  scope :search, lambda {|query|
    where(["name LIKE ?", "%#{query}%"])
  }
end
