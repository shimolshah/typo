Feature: Merge Articles
  As a blog administrator
  In order to share my thoughts with the world
  I want to be able to add articles to my blog

  Background:
    Given the blog is set up
    And the following Users exist
    | login  | password | email                 | profile_id | name   | state  |
    | shimol | shah12   | shimol_shah@yahoo.com | 2          | shimol | active |
    And the following Articles exist
    | title       | body        | published | author | id |
    | Some title1 | some text1 | true       | admin  | 10 |
    | Some title2 | some text2 | true       | shimol | 11 |
    
  Scenario: non admin cannot merge articles
    When I am logged in as shimol with password shah12
    And I am on the all articles page
    And I follow "Some title1"
    Then I should not see "Merge Articles"
    
  Scenario: merge articles
    When I am logged into the admin panel
    And I am on the all articles page
    And I follow "Some title1"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with "11"
    And I press "Merge"
    Then I should see "some text1"
    And I should see "some text2"