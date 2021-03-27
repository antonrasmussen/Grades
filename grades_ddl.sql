
CREATE TABLE student (
  student_id bigint,
  first_name text,
  last_name text,
  middle_name text,
  class_list text[] --e.g. ['ECON101','ACCT355','MATH593']
);

CREATE TABLE class (
  class_id int, --e.g. 101,355,593
  subject varchar(4), --e.g ECON, ACCT, MATH, BIOL
  instructor_id bigint
);

CREATE TABLE instructor (
  faculty_id bigint,
  first_name text,
  last_name text,
  middle_name text,
  class_list text[] --e.g. ['ECON101','ACCT355','MATH593']
);

CREATE TABLE transcript (
  student_id bigint,
  class_id int, --e.g. 101,355,593
  grade float --e.g. 3.5, 4.0, 2.1, 3.94
);


