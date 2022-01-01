/*/*
    File: DDL-02-high-school.sql                                      
    Purpose: DBM SQL DDL Exercice 02- Create a database for a high school 
    Written: 27/10/2021 
    Author: Ana Polo  Arozamena                                      
*/


USE high_school;

/*  1. Clear the primary key from the teacher's table. What do you have to do before? */

    /*--- First step: Delete the FK constraint that references the TEACHERS table and it is named fk_teachers_class_groups */

ALTER TABLE class_groups 
    DROP CONSTRAINT fk_teachers_class_groups; 

    /*--- Second step: Delete the PK constraint in TEACHERS table */

ALTER TABLE teachers
    DROP PRIMARY KEY; 


/*    2. Create a primary key in teachers that is the first and last name. */

ALTER TABLE teachers
    ADD PRIMARY KEY ( teacher_name, surname ); 


/*    3. Add a field behind the price in the courses' table, indicating the last year in which the course was taught. It does not have to be informed. */

ALTER TABLE courses
    ADD last_year SMALLINT UNSIGNED
        AFTER price; 


/*    4. Change the data type of the student's name by adding 5 characters. */

ALTER TABLE students
    MODIFY student_name VARCHAR( 20 );


/*    5. Delete a foreign key from one of the tables and recreate it. */

ALTER TABLE class_groups
    DROP CONSTRAINT fk_courses_class_groups;

ALTER TABLE class_groups
    ADD CONSTRAINT fk_courses_class_groups_new FOREIGN KEY ( fk_id_course) 
        REFERENCES courses ( id_course );


/*    6. Delete a CHECK from a table and recreate it. */

ALTER TABLE courses
    DROP CHECK ck_price;

ALTER TABLE courses
    ADD CONSTRAINT ck_price_new CHECK ( price <= 500.00 );


/*    7. Rename the group's table by class. */

RENAME TABLE class_groups TO class;


/*    8. Deletes the teacher's table. */

DROP TABLE IF EXISTS teachers; 



/*    It is possible to verify that the changes have been made by executing the following commands: */

    /*--- List all the tables in the database */
    
SHOW TABLES; 

    /*--- show the DDL that it is needed for creating each table */

SHOW CREATE TABLE students; 
SHOW CREATE TABLE courses;
SHOW CREATE TABLE class;
