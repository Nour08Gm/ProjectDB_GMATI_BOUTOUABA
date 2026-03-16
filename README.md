# Mini-Project – Databases 1  
## Publishing House Information System  

---

# Step 1 – Requirements Analysis  

## Prompt Used  

(See file: prompt_requirements.txt)

---

## Business Rules  

- Authors submit manuscripts to the publishing house.
- Each manuscript is managed by one editor.
- A manuscript may be accepted or rejected.
- If accepted, a manuscript becomes a published book.
- An author can write several books, and a book must have at least one author.
- Each book is associated with exactly one contract.
- A book is composed of chapters.
- Editors are organized hierarchically: an editor may supervise several editors, but has at most one direct supervisor.
- The publishing house signs contracts with authors to publish books.
- Each manuscript is submitted by exactly one author.
- An editor can manage several manuscripts.
- A book originates from exactly one manuscript.
- Each published book has a title and a publication date.
- A contract includes a signature date, an advance payment amount, and a royalty rate.
- A contract is signed by one author and concerns one book.
- A chapter is identified only within a specific book by its chapter number.
- A book must contain at least one chapter.

---

## Data Dictionary  

| Meaning of the data | Type | Size |
|----------------------|------|------|
| Author unique identifier | INT | 10 |
| Author pen name | VARCHAR | 80 |
| Author first name | VARCHAR | 50 |
| Author last name | VARCHAR | 60 |
| Author email | VARCHAR | 120 |
| Author phone number | VARCHAR | 20 |
| Author country | VARCHAR | 60 |
| Author date of birth | DATE | 10 |
| Manuscript unique identifier | INT | 10 |
| Manuscript title | VARCHAR | 150 |
| Manuscript submission date | DATE | 10 |
| Manuscript status | VARCHAR | 30 |
| Manuscript word count | INT | 7 |
| Editor unique identifier | INT | 10 |
| Editor full name | VARCHAR | 100 |
| Editor role | VARCHAR | 40 |
| Contract unique identifier | INT | 10 |
| Contract signature date | DATE | 10 |
| Advance amount | DECIMAL | 10,2 |
| Royalty rate | DECIMAL | 5,2 |
| Book unique identifier | INT | 10 |
| Book title | VARCHAR | 180 |
| Book publication date | DATE | 10 |
| ISBN | VARCHAR | 13 |
| Chapter number | INT | 3 |
| Chapter title | VARCHAR | 150 |
| Chapter word count | INT | 7 |

---

# Step 2 – Conceptual Data Model (MCD)

## Modeling Choices  

- The CHAPTER entity is modeled as a weak entity because it depends entirely on the BOOK entity. Its identifier is composed of (BookID, ChapterNumber).
- The SUPERVISES relationship is recursive on the EDITOR entity, representing the editorial hierarchy.
- The CONTRACT entity links AUTHORS and BOOKS and contains contract-specific attributes such as advance amount and royalty rate.
- The model respects 3NF since all attributes depend entirely on their respective primary keys and no transitive dependencies are present.

![MCD Conceptual Data Model for Publishing House](MCD_PublishingHouse%20(looping).png)

(see files: MCD_PublishingHouse.drawio and MCD_PublishingHouse.png. For looping version : MCD_PublishingHouse (looping).png and MCD_PublishingHouse.loo)

---

# Step 3 – LDM & PDM

## LDM

From the CDM we obtain the next LDM :
- CONTRACT = ( <ins> **ContractID(PK)** </ins>, SignatureDate(date), AdvanceAmount(decimal(10,2)), RoyaltyRate(decimal(5,2)), <ins> **#AuthorID(FK)** </ins>, <ins> **#BookID(FK)** </ins> );
- AUTHOR = ( <ins> **AuthorID(PK)** </ins>, PenName(varchar(80)), FirstName(varchar(50)), LastName(varchar(60)), Email(varchar(120)), Phone(varchar(20)), Country(varchar(60)), DateOfBirth(date) );
- BOOK = ( <ins> **BookID(PK)** </ins>, Title(varchar(180)), PunlicationDate(date), <ins> **#ManuscriptID(FK)** </ins> );
- CHAPTER = ( <ins> **ChapterNumber(PK)** </ins>, Title(varchar(150)), WordCount(int), <ins> **#BookID(PK, FK)** </ins> );
- MANUSCRIPT = ( <ins> **ManuscriptID(PK)** </ins>, Title(varchar(150)), SubmissionDate(date), Status(varchar(30)), WordCount(int), <ins> **#AuthorID(FK)** </ins>, <ins> **#EditorID(FK)** </ins> );
- EDITOR = ( <ins> **EditorID(PK)** </ins>, FullName(varchar(100)), Role(varchar(40)), <ins> **#Supervisor(FK)** </ins> );
- WRITES = ( <ins> **#AuthorID(FK)** </ins>, <ins> **#BookID(FK)** </ins> );

## PDM

See the two SQL files for creating the tables (1_creation.sql) and adding constraints (2_contraintes.sql).

Here is a table listing the constraints :
| Table | Constraint | Purpose |
|--------|------------|---------|
| Author | Email format | Prevent invalid emails |
| Author | Birthdate | Prevent unrealistic birth dates |
| Manuscript | Statut | Restricts to only allowed values |
| Manuscript | WordCount | Must be positive |
| Book | PublicationDate | Avoid unrealistic dates |
| Chapter | ChapterNumber | Chapter numbering starts at 1 |
| Chapter | WordCount | Must be positive |
| Contract | AdvanceAmount | Cannot be negative |
| Contract | RoyaltyRate | Between 0 and 100 |
| Contract | SignatureDate | prevents unrealistic contract dates |

---

# Step 4 – Inserting Data

## Prompt used
Find it in the file prompt_script.txt

## SQL script obtained
Find it in the file 3_insertion.sql

---

# Step 5 – Querying the Database

## Usage Scenario

An editorial manager uses the database to monitor the activity of the publishing house.

They need to retrieve information about authors, manuscripts, books, editors, contracts and chapters in order to analyze the publishing workflow.

## SQL Queries

The file `4_interrogation.sql` contains several SQL queries used to analyze the database.

These queries include:

- simple selections
- join queries between related tables
- aggregation queries using `GROUP BY` and `HAVING`
- subqueries

These queries demonstrate how the database can support decision-making within the publishing house, such as tracking manuscripts, identifying responsible editors, analyzing contracts, and examining book structure through chapters.

---

# Step 6 – Video Presentation

## Project Overview

This project presents a relational database system designed for a publishing house.

The database manages authors, manuscripts, editors, books, contracts and chapters.

## Demonstration

During the video presentation we demonstrate:

- the conceptual data model (MCD)
- the logical and physical database structure
- the data insertion process
- several SQL queries used to analyze the database

The demonstration shows how the system allows the publishing house to manage manuscripts, track authors and editors, and analyze published books and contracts.

## Conclusion

This database provides a structured way to manage the publishing process while ensuring data integrity through constraints and relational links between entities.
