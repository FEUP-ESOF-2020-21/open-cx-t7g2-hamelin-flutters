Feature: Suggest Physical Meeting
    Scenario: Creating a meetup
        Given I have "PostPage"
        When I tap the "MeetupButton" button
        Then I should have "CreateMeetupPage" on screen
        And I fill the "LocationMeetupForm" field with "Cozinha"
        And I fill the "DescriptionMeetupForm" field with "O objetivo deste teste é verificar se a funcionalidade Create Meetup funciona"
        Then I tap the "SubmitCreateMeetup" button
        Then I should have "MeetupPage" on screen
        Then I expect the "MeetupLocation" to be "Cozinha"
        Then I expect the "MeetupDescription" to be "O objetivo deste teste é verificar se a funcionalidade Create Meetup funciona"

