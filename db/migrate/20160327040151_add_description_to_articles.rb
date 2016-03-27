class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :description, :text #articles table, name of attribute, type of attribute
    add_column :articles, :created_at, :datetime #first timestamp...must be created_at
    add_column :articles, :updated_at, :datetime
  end
end
