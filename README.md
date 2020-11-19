# Hamelin Flutters

## Confnect

- João Rocha
- João Romão
- Rafael Cristino
- Tiago Alves
- Xavier Pisco

<!--* TODO Adicionar o Why vision is important-->
## Product Vision

Connecting people through ideas, beyond the conference.

## Elevator Pitch

Our goal is to connect conference goers, helping them discuss and talk beyond the conference. By using our app, Confnect, the users will be added to different forums, depending on their interests and on the attended talks, encouraging them to ask questions, discuss and meet people with similar interests. The app includes many types of forums, including a sub-forum for each talk, in which the speaker can answer all the questions the attendees may have after the talk, and some main forums, separated by theme, where users can create their own discussions. Our product features an innovative functionality which will motivate attendees with similar interests to physically meet up, creating a more united conference.


<!--* Recomendar discussões baseadas nas palestras a que pessoa vai/foi, associando as discussões a interesses (tópicos genéricos) e depois recomendando as discussões sobre esses interesses. Podem ser também recomendados à pessoa outros participantes, que participem nas mesmas discussões ou tenham os mesmos interesses (vão à mesma palestra).
* Threads de dúvidas com o palestrante apenas com pessoas que foram à palestra
* O objetivo é causar uma conexão física, logo ao fim de algum tempo de discussão é sugerido um 'meet up'. E a discussão teria lá um botão de 'meet up' que quando fosse clicado criava tipo uma prompt para as pessoas que estão interessadas.
* Poderia fazer-se os dois, criar uma thread para cada palestra, de modo ao palestrante reponder, mas essa palestra tambem ser associada a um tema/interesse, onde as pessoas poderiam crias as suas proprias duvidas.

> Não podia estar organizado assim? (+rep)
    > |-aplicação
        > Sugestões
        > |- Tema da thread (AI, data science...)
            > |- Thread global
            > |- Diferentes palestras-->


## Requirements

### Use case diagram 

![Use Case Diagram](./docs/UseCaseDiagram.jpg)

#### Post in questions

- **Actor**: Conference Atendee
- **Description**: This use case exists so that the atendees can upload their questions into the database to later be answered by the host of the talk
- Preconditions and Postconditions: In order to post a question the user must be enlisted in the respective talk and be logged in. The questions will be uploaded on the respective forum.
- **Normal Flow**:
    - The ateendee goes to the talk forum
    - The atendee presses the button to add a question to a forum
    - The atendee types his question
    - If it's within the allowed length, the system saves the question to the database, and displays it on the forum.
- **Alternative Flows and Exceptions**
    - The ateendee goes to the talk forum
    - The atendee presses the button to add a question to a forum
    - The atendee types his question
    - If the question is too long, the system does not allow to post the question


#### Post in discussion

- **Actor**: Conference Atendee
- **Description**: This use case exists so that the atendees can post discussions in different forums, so people are able to talk and discuss different themes.
- Preconditions and Postconditions: In order to like and dislike, the user must be a member of the current forum and be logged in. The vote cout will be updated 
- **Normal Flow**:
    - The ateendee goes to the talk forum
    - The atendee presses the button to add a new post to the forum
    - The atendee types his post
    - If it's within the allowed length, the system saves the post to the database, and displays it on the forum.
- **Alternative Flows and Exceptions**
    - The ateendee goes to the talk forum
    - The atendee presses the button to add a new post to the forum
    - The atendee types his post
    - If the post is too long, the system does not allow to post the question



#### Up/Downvote Questions

- **Actor**: Conference Atendee
- **Description**: This use case exists so that the questions are ordered by number of likes and to show the most relevant questions
- Preconditions and Postconditions: In order to post a question the user must be enlisted in the respective talk. The questions will be uploaded on the respective forum.
- **Normal Flow**:
- 
    - The atendee finds the post
    - The atendee presses the up/downvote question
    - The vote count is updated

#### Set up a meeting in real life
- **Actor**: Conference Atendee
- **Description**: This use case exists so that the atendees can meet other ateendes with similiar interests, if a discussion is particulary interesting the user can propose to meet up in real life, and the other users can either accept or deny the request.
- Preconditions and Postconditions: An ateendee must have participated in the discussion to propose a meeting. All the other member will recieve a notfication to meet up.
- **Normal Flow**:
    - The ateendee goes to the post
    - The atendee presses the button to add meetup in real life
    - The atendee answers the form on where and when the meeting will occur
    - The other members of the discussion will recieve a notification to go to the meetup
    - If the user participated in the discussion the other members will be notified of the meetup.
- **Alternative Flows and Exceptions**
    - The ateendee goes to the post
    - The atendee presses the button to add meetup in real life
    - If the atendee did not participate in the discussion, an error message appears.


#### Add, Edit and Delete a talk
- **Actor**: Administrator
- **Description**: This use case exists so that the Administrator is able to add the talks that the conference will have, and edit and deleted them if there is some alteration.
- Preconditions and Postconditions: The host has to be logged in and have admin privileges. The talk will be added, eddited or deleted from the database.
- **Normal Flow**:
    - The Admin chooses a talk
    - If the admin is logged in and has admin status, they can signall the system to add/remove/edit.
    - The system updates the database.
    
- **Alternative Flows and Exceptions**
    - The Admin chooses a talk
    - If they do not have the admin status, they wont be presented with the option to add/edit/delete the talk.

#### Pin answered questions
- **Actor**: Talk Host
- **Description**: This use case exists so talk hosts can flag questions as having received a satisfactory answer.
- Preconditions and Postconditions: The host has to be logged in, and if he pins the question, the question will be marked as answered. (E movida para outra pagina?)
- **Normal Flow**:
    - The host chooses a question
    - The host answers the question
    - He can press the button to pin the response
    - The response will be the first to appear and highlited
    

#### Delete a Question
- **Actor**: Host
- **Description**: This use case exists so that the Host of the talk is able to delete questions that are not relevant or inaproprite from their talk
- Preconditions and Postconditions: The user has to be the host of the respective talk. The question will then be removed from the database.
- **Normal Flow**:
    - If the Host is logged in and is the host of the talk, they can signall the system to delete it.
    - The system updates the database.
    
- **Alternative Flows and Exceptions**
    - The Host goes to the talk forum
    - If they do not have the host status in the talk, they wont be presented with the option to elete the question.


### User stories

#### Login Screen

As someone who is envolved in the conference, I want to be able to register in the app, so that I can use it.

    
##### Value and Effort
    - Value: Must have.
    - Effort: S

##### Acceptance Tests

```gherkin
Scenario: Registering in app
  Given There are 2 Users registered
  When I tap the "Register" button
  Then A form appears
  When the user fills the form correctly with a new username
  Then the user becomes registered and is redirected to the home page
  
Scenario: Registering in app
  Given There are 2 Users registered
  When I tap the "Register" button
  Then A form appears
  When the user fills the form correctly with an existin username
  Then an error message appears
  
Scenario: Registering in app
  Given There are 2 Users registered
  When I tap the "Register" button
  Then A form appears
  When the user fills the form incorrectly
  Then an error message appears
```

#### Register Screen

As someone who is registered in the app, I want to be able to login, so that I can use the app with my permissions.

##### Value and Effort
    -  Value: Must have.
    -  Effort: XS
##### Acceptance Tests

```gherkin
Scenario: Login
  Given There are 2 Users registered
  When I tap the "Login" button
  Then A form appears
  When the user fills the form correctly
  Then the user becomes Logged in and is redirected to the home page
  
  
Scenario: Login
  Given There are 2 Users registered
  When I tap the "Login" button
  Then A form appears
  When the user fills the form incorrectly
  Then a Error message appears
```

#### List Forums

As a conference atendee, I want to be able to see a list of interest/talk defined forums so that I can read the other attendees' interventions.
##### Value and Effort
    - Value: Must have
    - Effort: M
##### Acceptance Tests

```gherkin
Scenario: Seeing list of forums
  Given the user is in the home page
  When I tap the "Forums" button
  Then a List of forums appears
```

#### List Forums Posts

As a conference atendee, I want to be able to see a list of posts in a forum so that I know what is being discussed.
##### Value and Effort
    - Value: Must have
    - Effort: M
    
##### Acceptance Tests

```gherkin
Scenario: Seeing list of discussions
  Given the user is in the Forums page
  When I tap a specific forum
  Then a List of Discussions related to the forum appears
```

#### Profile Page

As an app user, I want to be able to see and edit my profile so that I know what info the app has about me, and change it if it's wrong.

##### Value and Effort
    - Value: Must have
    - Effort: M
##### Acceptance Tests
```gherkin
Scenario: Seeing my profile
  Given the user is in the home page
  When I tap the "Profile" button
  Then my profile appears
  
Scenario: Seeing my profile
  Given the user is his profile page
  When I tap the "Edit" button
  Then the user can change his personal info
  When the user updates his personal info correctly
  Then his profile is updated and he is redirected to his profile
  
Scenario: Seeing my profile
  Given the user is his profile page
  When I tap the "Edit" button
  Then the user can change his personal info
  When the user updates his personal info incorrectly
  Then an error appears and he is redirected to his profile
```


#### Create Posts in Forums

As a conference atendee, I want to be able to post in a forum, so that I can participate in the discussion and make new acquaintances.
##### Value and Effort
    - Value: Must have
    - Effort: S
##### Acceptance Tests

```gherkin
Scenario: Posting a discussion
  Given There are 3 posts in a forum
  When I tap the "add post" button
  And I submit the post with title and text
  Then There are 4 posts in the forum asked
  
Scenario: Posting a discussion
  Given There are 3 posts in a forum
  When I tap the "add post" button
  And I submit the post without title and/or text
  Then An error message appears
```

#### List Talks 

As an administrator, I want to be able to see the list of talks that we have, so that I have a global view of our app.
##### Value and Effort
    - Value: Must have
    - Effort: M
##### Acceptance Tests
```gherkin
Scenario: Seeing all talks
  Given the user is in the Talks page
  Then I can see all the talks and related buttons
```

#### Add Talks

As an administrator, I want to be able to add talks to the conference so that the app can have more talks.
##### Value and Effort
    - Value: Must have
    - Effort: M
##### Acceptance Tests
```gherkin
Scenario: Adding a talk
    Given There is 1 talk
    When An administrator clicks on "add talk" button
    And Submits a talk with title, tags, description, sepaker and image
    Then There are 2 talks
    
Scenario: Adding a talk
    Given There is 1 talk
    When An administrator clicks on "add talk" button
    And Submits a talk with an error
    Then An error message appears
```

#### Set Talk's Topics / Themes

As an administrator, I want to be able define a given talk's topics/themes, so that we can have a clear separation of interests.
##### Value and Effort
    - Value: Must have
    - Effort: M
##### Acceptance Tests
```gherkin
Scenario: The add talk page is opened
    Given There exists the tag "AI" in the database
    When An administrator clicks on "tags" field
    And Selects the tag "AI"
    Then That tag is added to the talk
    
Scenario: The add talk page is opened
    Given There are no tags in the database
    When An administrator clicks on the "tags" field
    And Starts typing a new tag name
    Then a "Add new tag" button appears
    
Scenario: The administrator starts typing on the "tags" and an "add new tag" button shows up on the screen
    Given There are not tags in the database
    When An administrator clicks on the "add new tag button"
    Then A new tag with the name that the administrator typed exists in the database
```

#### See Complete Posts and it's Answers

As a conference attendee, I want to be able to see a complete post, so that I can see its answers and better participate in the discussion.
##### Value and Effort
    - Value: Must have
    - Effort: M
##### Acceptance Tests
```gherkin
Scenario: Viewing a post
    Given There are 3 posts on a talk
    When I click on 1 post
    Then I am redirected to the post page which has its answers
```


#### Edit Talks

As an administrator, I want to be able to edit a talk so that I can fix any mistake or update it.
##### Value and Effort
    - Value: Must have
    - Effort: M
##### Acceptance Tests
```gherkin
Scenario: Editing a talk
    Given There is 1 talk
    When An administrator clicks on "edit talk" button from 1 talk
    And Changes one or more parts 
    Then The talk is changed
```

#### Remove Talks

As an administrator, I want to be able to remove talks to the conference so that I can delete a talk that will not happen.
##### Value and Effort
    - Value: Must have
    - Effort: S
##### Acceptance Tests
```gherkin
Scenario: Removing a talk
    Given There are 2 talk
    When An administrator clicks on "remove talk" button from 1 talk
    And Confirms the deletion
    Then There is 1 talk

Scenario: Removing a talk
    Given There are 2 talk
    When An administrator clicks on "remove talk" button from 1 talk
    And Doesn't confirms the deletion
    Then There are 2 talk
```


#### Answer Posts / Questions

As a talk host, I want to be able to answer the posts/questions in the forums/talks so that i can clear up doubts the attendees still have.
##### Value and Effort
    - Value: Must have
    - Effort: M
##### Acceptance Tests
```gherkin
Scenario: Adding a comment
  Given Post A has 2 comments
  When I tap the "add comment" button
  And I submit a comment "Great Post!"
  Then Post A has 3 comments
  And Post A contains a comment "Great Post!"
```


#### Suggets Physical Meeting

As a conference attendee, when a discussion is gettting interesting, I want to be able to suggest a physical meeting with other attendees, so that meet them and expand my network.
    - Value: Must have
    - Effort: M
##### Acceptance Tests
```gherkin
    TODO
```

#### Search Forums And Posts

As an app user, I want to search for a specific forum or post, so that I can easily find what I'm looking for

##### Value and Effort
    - Value: Must have
    - Effort: S 
##### Acceptance Tests
```gherkin
    TODO
```


#### Interest-based Post / Forum Suggestions
    
As a conference attendee, I want to easily find topics that interest me, so that I don't waste my time searching for them.
##### Value and Effort
    - Value: Could have
    - Effort: M
##### Acceptance Tests
```gherkin
    TODO
```

#### Pin Answered Questions

As a talk host, I want to be able to pin answered questions so that the question forum is organized and it is easy to find the answers to answered questions.
##### Value and Effort
    - Value: Could have
    - Effort: S
##### Acceptance Tests
```gherkin
    TODO
```

#### Remove Questions / Answers

As a talk host, I want to be able to remove inappropriate questions / wrong answers so that we can have an healthy forum.
##### Value and Effort
    - Value: Must have.
    - Effort: S
##### Acceptance Tests
```gherkin
    TODO
```

#### Generate Forums From Talks

As an administrator, I want the forums to be generated based on the talks and the talks' themes so that we can have organized forums, one for each theme/interest and one for each talk (for questions).
##### Value and Effort
    - Value: Must have
    - Effort: S
##### Acceptance Tests
```gherkin
    TODO
```

#### Generate Register Codes

As an administrator, I want to be able to generate codes for hosts and attendees to insert when they register, so that we can control who we let in (only people who participate in the conference) and what permissions they have (attendee or host).
##### Value and Effort
    - Value: Could have
    - Effort: M
##### Acceptance Tests
```gherkin
    TODO
```



### Domain model


---

## Architecture and Design


### Logical architecture

![Logical Architecture](./docs/LogicalArchitecture.jpg)

### Physical architecture

![Physical Architecture](./docs/PhysicalArchitecture.jpg)


### Prototype


![Mockups 1](./docs/mockups/Mockups1.png)


![Mockups 2](./docs/mockups/Mockups2.png)


![Mockups 3](./docs/mockups/Mockups3.png)



---

## Implementation

### Product increment #1

For this iteration we implemented the [login](#Story-2), [register](#Story-1) and [forum list](#Story-3) pages. Release [v0.1](https://github.com/FEUP-ESOF-2020-21/open-cx-t7g2-hamelin-flutters/releases/tag/v0.1).


---
## Test

 


---
## Configuration and change management

[GitHub flow](https://guides.github.com/introduction/flow/).


---

## Project management



---

## Evolution - contributions to open-cx

