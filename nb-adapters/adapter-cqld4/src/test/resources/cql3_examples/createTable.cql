CREATE TABLE cycling.race_winners (
   race_name text,
   race_position int,
   flag int STATIC,
   cyclist_name FROZEN<fullname>,
   PRIMARY KEY (race_name, race_position));
