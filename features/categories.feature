Feature: Categories should work
  As a blog administrator
  I want to the categories feature to work

  Background:
    Given the blog is set up

  Scenario: click on categories link
    When I am logged into the admin panel
    And I am on the all articles page
    And I follow "Categories"
    Then I should not see "Couldn't find Category"

