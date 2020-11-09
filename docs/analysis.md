# Initial Analysis of Chitter challenge

[README file](/README.md)

### User stories
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

## Assumptions
- mention of 'browser'
  - assumption that this is going to be a 'browser' accessed solution only - no terminal interface needed
  - assumption that this will be accessible from multiple browsers
  - initial assumption for minimum functionality - that 'browser' is fundamentally Safari - no specific browser formatting / function accommodation needed
  - initial assumption is graphical based user interface requested, with keyboard entry for 'message', etc
- no mention of update / delete (for creator or reviewer)
  - minimum functionality will not include these functions
    - focus on create and read functionality
- no explicit mention of roles (other than 'Maker')
  - initial assumption - no accommodation of superuser, admin or user activity differentiation
- no explicit mention of message restrictions, but database setup was done with VARCHAR(60) data type.
  - assumption - implicit limitation of 60 chars to a cheep.
- no explicit mention of time (outside of date)
  - assumption that time will need to be captured as well as date, DS principle of 1 detail level below requirement, for categorisation.
- no explicit identification of creator name / attributes for messages
  - assumption that 'what people are doing' requires the capture of some identifier for 'users' - can't assume that 60 chars will provide identification
  - initial assumption of explicit 'what people are doing' requirement - no 'anonymous' posting
- mention of 'specific keyword'
  - initial assumption is that this is a language thing, no requirement for 'standard' 'tags' or 'keywords' to be allocated to posts
  - initial assumption - entered 'keyword' to be 'filtered for' in message body
