Feature: Liking a Post
  Scenario: When we are in the Post page, of a post with 0 likes, and the user clicks the like button
    Given I have "PostPage"
    Then I expect the "NumberLikes" to be "0"
    When I tap the "LikeButton" button
    Then I expect the "NumberLikes" to be "1"

    




