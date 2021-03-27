DROP TABLE student;
CREATE TABLE student (
  student_id bigint CONSTRAINT student_id_key PRIMARY KEY, --PK
  first_name text,
  last_name text,
  middle_name text,
  class_list text[] --e.g. ['ECON101','ACCT355','MATH593']
);

INSERT INTO student VALUES(431254254,'Arij','Haugen','Flint',ARRAY['ACCT155','BIOL113','ECON101','MATH102']);
INSERT INTO student VALUES(854224557,'Stanislova','Bain','Navin',ARRAY['ASIA337','ENGL220','MATH340','MUSC323']);
INSERT INTO student VALUES(654124155,'Elfrieda','Kuijpers','Muirgheal',ARRAY['ENGR452','STAT344','STAT350']);
INSERT INTO student VALUES(543421542,'Vasu','Belluomo','Edina',ARRAY['BIOL155','CHEM105','ECON101','ENGL112','MATH102']);
INSERT INTO student VALUES(323215421,'Shenandoah','Head','Gabriel',ARRAY['ACCT155','BIOL155','COMM100','ECON201','ENGL110','MATH102']);

DROP TABLE instructor;
CREATE TABLE instructor (
  instructor_id bigint CONSTRAINT instructor_id_key PRIMARY KEY, --PK
  first_name text,
  last_name text,
  middle_name text,
  class_list text[] --e.g. ['ECON101','ACCT355','MATH593']
);

INSERT INTO instructor VALUES(8999361,'Francisca','Beirne','Pankaja',ARRAY['BIOL105','BIOL106','BIOL137','BIOL425']);
INSERT INTO instructor VALUES(6437196,'Milan','Planque','Themis',ARRAY['ECON301','STAT220','STAT595']);
INSERT INTO instructor VALUES(9067006,'Dilip','Harman','Simone',ARRAY['CRJS222','CRJS319','CRJS320']);
INSERT INTO instructor VALUES(2433613,'Zuberi','Seabrooke','Zdravko',ARRAY['ANTR395','ANTR698']);
INSERT INTO instructor VALUES(6115737,'Neferkare','Yu','Catriona',ARRAY['ACCT155','ECON301','ECON226','ECON369']);

--Derive this table from the test data
DROP TABLE class;
CREATE TABLE class (
  subject varchar(4) NOT NULL, --1/2 of composite PK; e.g ECON, ACCT, MATH, BIOL
  class_id int NOT NULL, --1/2 of composite PK; e.g. 101,355,593
  class_instructor_id bigint REFERENCES instructor (instructor_id), --FK
  PRIMARY KEY (subject,class_id)
);

--Derive this table with a random floating point
--grade for each student from the test data
DROP TABLE transcript;
CREATE TABLE transcript (
  student_id bigint NOT NULL, --PK
  subject varchar(4) NOT NULL, --1/2 of composite FK; e.g ECON, ACCT, MATH, BIOL
  class_id int NOT NULL, --1/2 of composite FK; e.g. 101,355,593
  grade float, --e.g. 3.5, 4.0, 2.1, 3.94
  CONSTRAINT pk_student_id PRIMARY KEY (student_id),
  CONSTRAINT fk_student_id FOREIGN KEY (student_id)
  REFERENCES student (student_id),
  CONSTRAINT fk_course FOREIGN KEY (subject,class_id)
  REFERENCES class (subject,class_id)
);
