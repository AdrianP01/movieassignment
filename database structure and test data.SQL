-- Create tables
CREATE TABLE Genre (
    GenreID INT PRIMARY KEY,
    GenreName VARCHAR(255) NOT NULL
);

CREATE TABLE Movie (
    MovieID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Year INT,
    GenreID INT,
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID)
);

CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Username VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    YearOfBirth INT
);

CREATE TABLE Review (
    ReviewID INT PRIMARY KEY,
    UserID INT,
    MovieID INT,
    Stars INT CHECK (Stars BETWEEN 1 AND 5),
    ReviewText TEXT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

CREATE TABLE Favourite (
    UserID INT,
    MovieID INT,
    PRIMARY KEY (UserID, MovieID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

-- Insert test data
-- Genres
INSERT INTO Genre (GenreID, GenreName) VALUES (1, 'Action'), (2, 'Comedy'), (3, 'Drama');

-- Movies
INSERT INTO Movie (MovieID, Name, Year, GenreID)
VALUES 
(1, 'Inception', 2010, 1),
(2, 'The Dark Knight', 2008, 1),
(3, 'The Hangover', 2009, 2);

-- Users
INSERT INTO User (UserID, Name, Username, Password, YearOfBirth)
VALUES 
(1, 'John Doe', 'johndoe', 'password123', 1990),
(2, 'Jane Smith', 'janesmith', 'mypassword', 1985);

-- Reviews
INSERT INTO Review (ReviewID, UserID, MovieID, Stars, ReviewText)
VALUES 
(1, 1, 1, 5, 'Amazing movie!'),
(2, 2, 2, 4, 'Great performance by the cast.');

-- Favourites
INSERT INTO Favourite (UserID, MovieID)
VALUES 
(1, 1),
(1, 3),
(2, 2);
