# User stories

```
As a Maker
So that I can see what people are doing
I want to see all the messages (peeps) in a browser
```

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

```
As a Maker
So that I can see when people are doing things
I want to see the date the message was posted
```

```
As a Maker
So that I can easily see the latest peeps
I want to see a list of peeps in reverse chronological order
```

```
As a Maker
So that I can find relevant peeps
I want to filter on a specific keyword
```

# Proposed Model

| class | methods                                                                        |
|-------|--------------------------------------------------------------------------------|
| Peep  | Peep.create(text)<br>Peep.all<br>Peep.find(id)<br>#date (attr_reader)<br>Peep.filter(string) |

## Ideas?

- `Peep.create(text, date=Date.now)` will run a SQL command to insert a new `peep` into the database e.g. `INSERT INTO peeps(text,date) VALUES('this is the text');`
- `Peep.all` will run a SQL command to get all of the `peeps` and wrap them into an array of Peep objects
- `#initialize` will need to be passed `id, message, date`
- `Peep.find(id)` will be passed the `id` of a peep (from the db) and return a `Peep` object
- `#date` will be performed on an instance of the peep object, returning the date in a **nicely formatted way**
- Format the date (private method, maybe a separate class)
- `Peep.filter` will run a SQL command, e.g. `SELECT * FROM peeps WHERE message LIKE 'value'` - wrap result in an array of Peep objects and display

## Plan

1. Write `Peep.all` method (along with `#initialize`)
2. Write `Peep.create` method
3. Write method to format the date nicely
4. Write `Peep.filter` method (this will probably be the most challenging aspect)
5. Use CSS to make everything look a bit like Twitter, for fun