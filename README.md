# DBM02-High school solution

![Logo de Team](https://github.com/ana-polo/DBM02-high-school-sol/blob/main/DBM.gif "Team logo")

## Table of Contents

1. General Info.
2. Technologies.
3. Collaboration.
4. Problem definition.

    1. DDL01: Creation of the tables of the DB.
    2. DDL02: Updating the tables to create the foreign key constrains.

&nbsp;

### 1. General Info

***

Training exercise of design and management of databases carried out in the field of Database Management in the Higher Vocational training Degree in Management of Computer Network Systems.

&nbsp;

### 2. Technologies

***

*MySQL* Version 8.0

- **SQL-DDL**: Data Definition Language.

&nbsp;

### 3. Collaboration

***

- *Haplo35.*
- *ErnestoPGH.*
- *IrvingVqz.*

&nbsp;

### 4. Problem definition

***

#### i. DDL

***

📝 **TO DO:**

    1. Create a new database called high-school with the following tables in the new database.

        1. Decide the appropriate name for each field, the most appropriate data type.
        2. Decide whether it is mandatory that the field be informed or not. 
    
    2. Think about the order in which you will create the tables, keep in mind the restrictions. 
    3. Define ALL possible constraints primary keys, foreign keys, etc.
    4. Save all the orders that you need in a file named DDL01_high_school.sql in the DBM02-SQL directory.

&nbsp;

⚠️ **WARNING:**

- All these operations must be done in the creation of the tables.

&nbsp;

👀 **Remember to not forget!**

- Properly format and document the code.

&nbsp;

<details>
    <summary>CLICK ME TO SEE THE TABLES DEFINITION</summary>

&nbsp;

##### STUDENT

    -  The student's academic record number, which in addition to being unique and identifying the student, is composed of 4 letters and 3 digits.    
    -  The group to which the student belongs.    
    -  The student's NIF.    
    -  Name.
    -  Surname.
    -  Date of birth. Please note that no student under the age of 16 can be enrolled.
    -  Address.
    -  The student's phone number (assume it only has one number) Will not be prefixed +34.
    -  Gender, which will be F for women and M for men. Use a constraint to define the set of values that this field can take.

##### TEACHER

    -  The official number: Uniquely identifies each one and is formed with 4 digits and 3 letters.
    -  The teacher's name.
    -  The teacher's last name.
    -  The teacher's address.
    -  The teacher's phone (assume you only have one number). Does not have the prefix +34.
    -  Field that specifies whether the teacher is interim or not. The vast majority are interim.
    -  Maximum number of courses that a teacher can teach.

##### COURSE

    -  Field that identifies the course, consists of 4 letters.
    -  Course description.
    -  Hours of duration.
    -  Course price.

##### GROUP

    -  Field that identifies the group, consists of 4 uppercase letters, a number and a low-ercase letter.
    -  Description of the group
    -  Course
    -  Teacher
    -  Shift, it can be morning or afternoon. Do not use a constraint to define the set of val-ues that this field can take.
    -  Start date.
    -  End date.
    -  Start time.
    -  End time

&nbsp;

###### REMARKS

- Two groups of the same course cannot coincide in the same shift.
- No course has a higher price of more than € 500 or more than 2000 hours.
- Each student can only be enrolled in one group.
- There may be single-day courses.
- No teacher can teach more than 3 courses.

</details>

&nbsp;
&nbsp;

#### ii. DDL02

***

📝 **TO DO:**

    1. Modifying the tables.
    2. Save all the orders that you need in a file named DDL02_high_-_school.sql in the DBM02-SQL directory.

&nbsp;

⚠️ **WARNING:**

- Neither of these operations can be done in the creation of the tables.

&nbsp;

👀 **Remember to not forget!**

- Properly format and document the code.

&nbsp;

<details>
    <summary>CLICK ME TO SEE THE REQUESTED MODIFICATIONS</summary>

&nbsp;

    1. Delete the primary key from the teacher's table. What do you have to do?
    2. Create a primary key in teachers that is formed by the first name and the surname.
    3. Add a field behind the price column in the courses' table, indicating the last year in which it was taught. It does not have to be informed.
    4. Change the data type of the student's name by adding 5 characters.
    5. Delete a foreign key from one of the tables and recreate it.
    6. Delete a CHECK from a table and recreate it.
    7. Rename the group's table by class.
    8. Deletes the teacher's table.

    - (0.5 point each)- 
</details>
