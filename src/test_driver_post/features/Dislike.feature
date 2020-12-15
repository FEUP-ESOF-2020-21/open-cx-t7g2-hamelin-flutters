Feature: PostPage
  Scenario: When we are in the Post page
    Given I have "PostPage"
    Then I expect the "NumberDislikes" to be "0"
    When I tap the "DislikeButton" button
    Then I expect the "NumberDislikes" to be "1"

    




