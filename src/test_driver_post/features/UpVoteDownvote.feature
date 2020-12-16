Feature: Up Voting and Downvoting posts
  Scenario: When we are in the Post page and the user likes a post and then downvotes the same post
    Given I have "PostPage"
    Then I expect the "NumberLikes" to be "0"
    Then I expect the "NumberDislikes" to be "0"
    When I tap the "LikeButton" button
    Then I expect the "NumberLikes" to be "1"
    Then I expect the "NumberDislikes" to be "0"
    When I tap the "DislikeButton" button
    Then I expect the "NumberLikes" to be "0"
    Then I expect the "NumberDislikes" to be "1"
    

    




