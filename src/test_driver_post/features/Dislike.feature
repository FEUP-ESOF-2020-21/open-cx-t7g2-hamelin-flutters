Feature: Downvoting a Post
  Scenario: When we have zero downvotes, and user clicks downvote button
    Given I have "PostPage"
    Then I expect the "NumberDislikes" to be "0"
    When I tap the "DislikeButton" button
    Then I expect the "NumberDislikes" to be "1"

    




