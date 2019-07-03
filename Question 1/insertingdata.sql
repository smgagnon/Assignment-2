INSERT INTO book VALUES 
(1, 'The Adventures of Huckleberry Finn', 'Chatto & Windus'),
(2, 'The Great Gatsby', 'Scribner'),
(3, 'Hamlet', 'Simon & Schuster');

INSERT INTO book_authors VALUES
(1, 'Mark Twain'),
(2, 'F. Scott Fitzgerald'),
(3, 'William Shakespeare');

INSERT INTO publisher VALUES
('Chatto & Windus', '320 Front Street West Suite 1400 Toronto ON', 18885239292),
('Scribner', '153–157 Fifth Avenue New York City', 3473836878),
('Simon & Schuster', '166 King St E Toronto ON', 6474278882);

INSERT INTO library_branch VALUES
(1, 'Toronto Public Library', '495 Sherbourne St Toronto ON'),
(2, 'Midland Public Library', '320 King St Midland ON'),
(3, 'London Public Library', '301 Oxford St W London ON');

INSERT INTO borrower VALUES
(1, 'Stephanie Gagnon', '54 Hastings Ave, Toronto ON', 4164342333),
(2, 'Madeline Black', '2345 Yonge St, Toronto ON', 4164506877),
(3, 'John Reid', '98 Cambridge St, Midland ON', 7055495544);

INSERT INTO book_loans VALUES
(1, 1, 1, '2019-06-11', '2019-06-26'),
(2, 3, 3, '2019-06-02', '2019-06-17'),
(3, 2, 2, '2019-05-27', '2019-06-11');

INSERT INTO book_copies VALUES
(1, 1, 6),
(1, 2, 12),
(2, 1, 8),
(2, 3, 4),
(3, 2, 0),
(3, 1, 15);