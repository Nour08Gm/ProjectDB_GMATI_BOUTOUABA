# Mini-Project – Databases 1  
## Publishing House Information System  

---

# Step 1 – Requirements Analysis  

## Prompt Used  

(See file: prompt_requirements.txt)

---

## Business Rules  

- The publishing house signs contracts with authors to publish books.
- An author can write several books, and a book must have at least one author.
- Authors submit manuscripts to the publishing house.
- Each manuscript is submitted by exactly one author.
- Each manuscript is managed by one editor.
- An editor can manage several manuscripts.
- Editors are organized hierarchically: an editor may supervise several editors, but has at most one direct supervisor.
- A manuscript may be accepted or rejected.
- If accepted, a manuscript becomes a published book.
- A book originates from exactly one manuscript.
- Each published book has a title and a publication date.
- Each book is associated with exactly one contract.
- A contract includes a signature date, an advance payment amount, and a royalty rate.
- A contract is signed by one author and concerns one book.
- A book is composed of chapters.
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
