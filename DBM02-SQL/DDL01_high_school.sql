/*/*
    File: DDL-01-high-school.sql                                      
    Purpose: DBM SQL DDL Exercice 02- Create a database for a high school 
    Written: 27/10/2021 
    Author: Ana Polo  Arozamena                                      
*/


 DROP DATABASE IF EXISTS high_school;


CREATE DATABASE IF NOT EXISTS high_school CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci; 
USE high_school;


CREATE TABLE IF NOT EXISTS teachers (
	id_teacher CHAR( 7 ) NOT NULL,  /* 4 letters and 3 digits*/
	teacher_name VARCHAR( 15 ) NOT NULL,
	surname VARCHAR( 30 ) NOT NULL,
	address VARCHAR( 30 ),
    phone CHAR( 9 ),
	teacher_status ENUM ( 'interim', 'not interim' ) DEFAULT 'interim',
	max_courses TINYINT UNSIGNED NOT NULL,
    
	CONSTRAINT pk PRIMARY KEY ( id_teacher ),
	CONSTRAINT ck_max_courses CHECK ( max_courses <= 3 )
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS courses (
	id_course CHAR( 4 ), 
	course_description VARCHAR( 150 ) NOT NULL,
	duration SMALLINT UNSIGNED NOT NULL, 
	price DECIMAL( 5, 2 ) NOT NULL, /* Should be UNSIGNED but this is deprecated for DECIMAL typedata */

	CONSTRAINT pk PRIMARY KEY ( id_course ), 
	CONSTRAINT ck_duration CHECK ( duration < 2000 ),
    CONSTRAINT ck_price CHECK ( price < 500.00 ) 
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS class_groups (
	id_class_group CHAR( 8 ),
	class_group_description VARCHAR( 150 ) NOT NULL,
	fk_id_course CHAR( 4 ) NOT NULL, 
	fk_id_teacher CHAR( 7 ) NOT NULL, 
	shift ENUM ( 'morning', 'afternoon' ) NOT NULL,
	start_date DATE NOT NULL, /* There is a check about this field, so it can not be NULL */
	end_date DATE NOT NULL, /* There is a check about this field, so it can not be NULL */
	start_time TIME,
	end_time TIME,
	
    CONSTRAINT pk PRIMARY KEY ( id_class_group ),
    CONSTRAINT ck_days CHECK ( ( start_date <= end_date ) ), /* There can be single day courses */
    CONSTRAINT unq_course_shift UNIQUE ( fk_id_course, shift ), /* Two group of the same course can not coincide in the same shift */

	CONSTRAINT fk_teachers_class_groups FOREIGN KEY ( fk_id_teacher ) 
        REFERENCES teachers ( id_teacher ),
	CONSTRAINT fk_courses_class_groups FOREIGN KEY ( fk_id_course ) 
        REFERENCES courses ( id_course ) 
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS students (
	id_record CHAR( 7 ), /* 4 letters and 3 digits */
	fk_id_class_group CHAR( 8 ) NOT NULL,
	nif CHAR( 9 ) UNIQUE NOT NULL, /* Each student has a different nif */
	student_name VARCHAR( 15 ) NOT NULL, 
	surname VARCHAR( 30 ) NOT NULL,
	birth DATE NOT NULL, /* There is a limit with the age of the student, so it can not be NULL */ 
	address VARCHAR( 30 ),
	phone CHAR( 9 ),
	gender CHAR( 1 ) NOT NULL,
    
	CONSTRAINT pk PRIMARY KEY ( id_record ),
	CONSTRAINT ck_birth CHECK ( birth >= '2005-11-26' ), /* Students must be at least 16 years old */
	CONSTRAINT ck_gender CHECK ( gender = 'F' or gender = 'M' ), /* Gender must be 'F' or 'M' */

	CONSTRAINT fk_class_groups_students FOREIGN KEY ( fk_id_class_group ) 
        REFERENCES class_groups ( id_class_group ) 
) ENGINE = InnoDB;
