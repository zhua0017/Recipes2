Feature: Delete existing rental property
  As a foodie
  So that I can get rid of a recipe I don't like anymore
  I want to delete a recipe I previously created

  Background: The user is already logged in and the website already has some existing recipes
  Given I am a new, authenticated user with email "testing@colgate.edu"
  Given these Recipes:
  | recipe_name     | meal_type | vegan  | vegetarian | nut_free | dairy_free | cuisine | appliance | instructions         | ingredients      | time_to_create | level | user_email           |
  | brownies        | Dessert   | false  | true       |   false  | false      | American| oven      | make them good       | chocolate        | 30             | Easy  | testing@colgate.edu  |  

  Scenario: Delete an existing recipe

  Given I am on the recipes page
  When I follow "BROWNIES"
  Then I should see "Delete recipe"
  When I follow "Delete recipe"
  Then I should be on the recipes page
  And I should see "brownies was deleted"

