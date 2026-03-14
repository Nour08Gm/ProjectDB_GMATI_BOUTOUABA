CREATE TABLE Author (
	AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    PenName VARCHAR(80),
    FirstName VARCHAR(50),
    LastName VARCHAR(60),
    Email VARCHAR(120),
    Phone VARCHAR(20),
    Country VARCHAR(60),
    DateOfBirth DATE
);

CREATE TABLE Editor (
	EditorID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100),
    Role VARCHAR(40),
    SupervisorID INT,
    FOREIGN KEY (SupervisorID) REFERENCES Editor(EditorID)
		ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Manuscript (
	ManuscriptID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(150),
    SubmissionDate DATE,
    Status VARCHAR(30),
    WordCount INT,
    AuthorID INT,
    EditorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
    	ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (EditorID) REFERENCES Editor(EditorID)
    	ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Book (
	BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(180),
    PublicationDate DATE,
    ManuscriptID INT UNIQUE,
    FOREIGN KEY (ManuscriptID) REFERENCES Manuscript(ManuscriptID)
    	ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Chapter (
	ChapterNumber INT,
    Title VARCHAR(150),
    WordCount INT,
    BookID INT,
    PRIMARY KEY (ChapterNumber, BookID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
    	ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Contract (
	ContractID INT AUTO_INCREMENT PRIMARY KEY,
    SignatureDate DATE,
    AdvanceAmount DECIMAL(10,2),
    RoyaltyRate DECIMAL(5,2),
    AuthorID INT,
    BookID INT UNIQUE,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
		ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
		ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Writes (
	AuthorID INT,
    BookID INT,
    PRIMARY KEY (AuthorID, BookID),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
    	ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
    	ON DELETE CASCADE
        ON UPDATE CASCADE
);