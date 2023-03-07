class User < ApplicationRecord
  validates_presence_of :email, :name, :api_key
  validates_uniqueness_of :email, :api_key

  def self.generate_api_key
    o = [('a'..'z'), ('0'..'9')].map(&:to_a).flatten
    string = (0...27).map { o[rand(o.length)] }.join
    while User.where('api_key = ?', string) != []
      string = (0...27).map { o[rand(o.length)] }.join
    end
    string
  end
end