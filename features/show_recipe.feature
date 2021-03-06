Feature: Show Recipe Details
  As a foodie
  So that I can see the details of the recipe I want to make
  I want to see all the recipe's attributes

  Background: The user is already logged in and the website already has some existing recipe to make
    Given I am a new, authenticated user with email "user1@colgate.edu"
    Given there is an authenticated user with email "user2@colgate.edu"
    Given these Recipes:
      | recipe_name     | meal_type | vegan  | vegetarian | nut_free | dairy_free | cuisine | appliance | instructions         | ingredients      | time_to_create | level | user_email      |
      | brownies        | Dessert   | false  | true       |   false  | false      | American| oven      | make them good       | chocolate        | 30             | Easy  | user1@colgate.edu |
      | cookies         | Dessert   | true   | true       |   true   | true       | French  |  oven     | cook for ten minutes | butter and flour | 20             | Hard  | user2@colgate.edu |

  Scenario: View the details of a recipe the current user created
    Given I am on the recipes page
    When I follow "BROWNIES"
    Then I should see "brownies"
    And I should see "Edit recipe"
    And I should see "Delete recipe"
    And I should see "Back to recipe listing"
    And I should see "make them good"

  Scenario: View the details of a recipe another user created
    Given I am on the recipes page
    When I follow "COOKIES"
    Then I should see "cookies"
    And I should see "Write a review"
    And I should see "Back to recipe listing"
    And I should see "cook for ten minutes"