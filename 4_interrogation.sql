USE publishing_house;

/* =========================
   STEP 5 – QUERYING THE DATABASE
   Usage scenario:
   An editorial manager uses the database to monitor authors,
   manuscripts, books, editors, contracts and chapters.
   ========================= */


/* =========================
   1. SIMPLE SELECTION / PROJECTION
   ========================= */

-- 1. List all authors
SELECT *
FROM Author;

-- 2. List books published after January 1st, 2023
SELECT Title, PublicationDate
FROM Book
WHERE PublicationDate > '2023-01-01';

-- 3. List accepted manuscripts
SELECT Title, Status
FROM Manuscript
WHERE Status = 'accepted';

-- 4. List editors and their roles
SELECT FullName, Role
FROM Editor;

-- 5. List chapters with more than 4000 words
SELECT Title, WordCount
FROM Chapter
WHERE WordCount > 4000;


/* =========================
   2. JOIN QUERIES
   ========================= */

-- 6. Show each book with its author(s)
SELECT b.Title AS BookTitle, a.PenName AS Author
FROM Book b
JOIN Writes w ON b.BookID = w.BookID
JOIN Author a ON w.AuthorID = a.AuthorID;

-- 7. Show each manuscript with the editor managing it
SELECT m.Title AS ManuscriptTitle, e.FullName AS Editor
FROM Manuscript m
JOIN Editor e ON m.EditorID = e.EditorID;

-- 8. Show each published book and its original manuscript
SELECT b.Title AS BookTitle, m.Title AS ManuscriptTitle
FROM Book b
JOIN Manuscript m ON b.ManuscriptID = m.ManuscriptID;

-- 9. Show each book and its contract information
SELECT b.Title, c.SignatureDate, c.AdvanceAmount, c.RoyaltyRate
FROM Book b
JOIN Contract c ON b.BookID = c.BookID;

-- 10. Show chapters for each book
SELECT b.Title AS BookTitle, c.ChapterNumber, c.Title AS ChapterTitle
FROM Chapter c
JOIN Book b ON c.BookID = b.BookID
ORDER BY b.BookID, c.ChapterNumber;


/* =========================
   3. AGGREGATION QUERIES
   ========================= */

-- 11. Count the number of books written by each author
SELECT a.PenName, COUNT(w.BookID) AS NumberOfBooks
FROM Author a
JOIN Writes w ON a.AuthorID = w.AuthorID
GROUP BY a.AuthorID, a.PenName;

-- 12. Count the number of manuscripts managed by each editor
SELECT e.FullName, COUNT(m.ManuscriptID) AS NumberOfManuscripts
FROM Editor e
LEFT JOIN Manuscript m ON e.EditorID = m.EditorID
GROUP BY e.EditorID, e.FullName;

-- 13. Compute the average chapter word count for each book
SELECT b.Title, AVG(c.WordCount) AS AverageChapterWordCount
FROM Book b
JOIN Chapter c ON b.BookID = c.BookID
GROUP BY b.BookID, b.Title;

-- 14. Find books with more than 3 chapters
SELECT b.Title, COUNT(c.ChapterNumber) AS NumberOfChapters
FROM Book b
JOIN Chapter c ON b.BookID = c.BookID
GROUP BY b.BookID, b.Title
HAVING COUNT(c.ChapterNumber) > 3;

-- 15. Compute total advance amount paid to each author
SELECT a.PenName, SUM(c.AdvanceAmount) AS TotalAdvance
FROM Author a
JOIN Contract c ON a.AuthorID = c.AuthorID
GROUP BY a.AuthorID, a.PenName;


/* =========================
   4. SUBQUERIES
   ========================= */

-- 16. Find authors who have signed at least one contract
SELECT PenName
FROM Author
WHERE AuthorID IN (
    SELECT AuthorID
    FROM Contract
);

-- 17. Find books originating from accepted manuscripts
SELECT Title
FROM Book
WHERE ManuscriptID IN (
    SELECT ManuscriptID
    FROM Manuscript
    WHERE Status = 'accepted'
);

-- 18. Find editors who supervise other editors
SELECT FullName
FROM Editor
WHERE EditorID IN (
    SELECT SupervisorID
    FROM Editor
    WHERE SupervisorID IS NOT NULL
);

-- 19. Find books whose royalty rate is above the average royalty rate
SELECT b.Title
FROM Book b
JOIN Contract c ON b.BookID = c.BookID
WHERE c.RoyaltyRate > (
    SELECT AVG(RoyaltyRate)
    FROM Contract
);

-- 20. Find authors who submitted a manuscript but do not have a contract
SELECT PenName
FROM Author
WHERE AuthorID IN (
    SELECT AuthorID
    FROM Manuscript
)
AND AuthorID NOT IN (
    SELECT AuthorID
    FROM Contract
);