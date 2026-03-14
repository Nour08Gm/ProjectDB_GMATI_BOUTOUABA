/* =========================
   AUTHOR CONSTRAINTS
   ========================= */

ALTER TABLE Author
	ADD CONSTRAINT chk_author_email CHECK (Email LIKE '%@%.%'),
    ADD CONSTRAINT chk_author_birthdate CHECK (DateOfBirth >= '1900-01-01');


/* =========================
   MANUSCRIPT CONSTRAINTS
   ========================= */

ALTER TABLE Manuscript
	ADD CONSTRAINT chk_manuscript_status CHECK (Status IN ('submitted', 'accepted', 'rejected')),
    ADD CONSTRAINT chk_manuscript_wordcount CHECK (WordCount > 0);


/* =========================
   BOOK CONSTRAINTS
   ========================= */

ALTER TABLE Book
	ADD CONSTRAINT chk_publication_date CHECK (PublicationDate >= '1900-01-01');


/* =========================
   CHAPTER CONSTRAINTS
   ========================= */

ALTER TABLE Chapter
	ADD CONSTRAINT chk_chapter_number CHECK (ChapterNumber > 0),
    ADD CONSTRAINT chk_chapter_wordcount CHECK (WordCount > 0);


/* =========================
   CONTRACT CONSTRAINTS
   ========================= */

ALTER TABLE Contract
	ADD CONSTRAINT chk_advance_amount CHECK (AdvanceAmount >= 0),
    ADD CONSTRAINT chk_royalty_rate CHECK (RoyaltyRate BETWEEN 0 AND 100),
    ADD CONSTRAINT chk_signature_date CHECK (SignatureDate >= '1900-01-01');