class Recipe < ApplicationRecord
    has_one_attached :image
    has_many :reviews
    belongs_to :user, required: false
    scope :recipe_name, -> (name) { where(recipe_name: name)}  
    scope :cuisine, -> (cuisine){ where(cuisine: cuisine)}
    has_and_belongs_to_many :fans,
        class_name: "User",
        foreign_key: "recipe_id",
        association_foreign_key: "user_id"
end
