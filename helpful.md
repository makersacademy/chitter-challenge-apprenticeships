### MVC

| Component  | Respnsibility                                   |
| ---------- | ----------------------------------------------- |
| Model      | Encapsulate logic with relevant data            |                
| View       | Display the result to a user                    |
| Controller | Get data from the model and put iot in the view |


### Database
-Add data into the test data base first
-CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(60));
-Using above as a guide insert into test database table peeps: 
INSERT INTO peeps (message) VALUES ('Message 1');
INSERT INTO peeps (message) VALUES ('Message 2');
INSERT INTO peeps (message) VALUES ('Message 3');
INSERT INTO peeps (message) VALUES ('Message 4');
INSERT INTO peeps (message) VALUES ('Message 5');
-Make sure what is in the brackets (message) matches what has been used in the CREATE
-SERIAL - means that PostgresSQL know how to increment ID