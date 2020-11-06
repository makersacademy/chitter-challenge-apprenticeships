# Domain Model of Chitter challenge

[README file](/README.md)

## User stories
```
As a Maker
So that I can see what people are doing
I want to see all the messages (cheeps) in a browser

As a Maker
So that I can let people know what I am doing  
I want to post a message (cheep) to chitter

As a Maker
So that I can see when people are doing things
I want to see the date the message was posted

As a Maker
So that I can easily see the latest cheeps
I want to see a list of cheeps in reverse chronological order

As a Maker
So that I can find relevant cheeps
I want to filter on a specific keyword
```

## Minimum Functional Solution
- interface to read all cheeps
  - listing to be in reverse chronological order
- interface to add a cheep
  - mention only of 'message'
  - date/time to be auto added
  - creator identifier to be auto added
- interface to filter all cheeps by keyword
  - capture 'keyword' to filter cheeps
  - present filtered list
  - minimum functionality - present as part of default cheep listing view (not a separate view)


## User Story 1
```
As a Maker
So that I can see what people are doing
I want to see all the messages (cheeps) in a browser
```
### Objects:
- Cheep (message)
- User (people)
- interface (browser)

### Methods:
- list  (cheeps)

### Views:
- list view (cheeps)

## User Story 2
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (cheep) to chitter
```
### Methods:
- add message (cheep)

### Views:
- Add message (cheep)

## User Story 3
```
As a Maker
So that I can see when people are doing things
I want to see the date the message was posted
```
### Properties:
- Date (cheep)

## User Story 4
```
As a Maker
So that I can easily see the latest cheeps
I want to see a list of cheeps in reverse chronological order
```

### Methods:
- list (in reverse chronological order)

### Properties:
- date/time (cheep)

## User Story 5
```
As a Maker
So that I can find relevant cheeps
I want to filter on a specific keyword
```
### Methods:
- Filter (cheeps.message)
- list (filtered list)

### Views:
- Filtered list (extension of list view?)
