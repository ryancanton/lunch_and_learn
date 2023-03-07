class Favorite < ApplicationRecord
  validates_presence_of :api_key, :country, :recipe_title, :recipe_link
end