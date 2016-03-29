class Article < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 3, maximum: 50}#check name, is is not null and 3-50 char long
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
end