Feature: PostPage
  Scenario: When we are in the Post page
    Given I have "PostPage"
    Then I expect the "NumberLikes" to be "0"
    When I tap the "LikeButton" button
    Then I expect the "NumberLikes" to be "1"

    




