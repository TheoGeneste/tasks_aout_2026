USE tasks_collaborator;

-- A executer apres bdd.sql, sur une base vide.
-- Mot de passe commun des comptes de test : Test1234!
INSERT INTO users (us_id, us_username, us_password, us_email) VALUES
(1, 'alice', '$2b$10$yikmQ2i9JecKdy7Dc29ms.GC6GdgIzFLd3MLLdN9Q2l9K8pPeU6Au', 'alice@example.test'),
(2, 'bruno', '$2b$10$yikmQ2i9JecKdy7Dc29ms.GC6GdgIzFLd3MLLdN9Q2l9K8pPeU6Au', 'bruno@example.test'),
(3, 'chloe', '$2b$10$yikmQ2i9JecKdy7Dc29ms.GC6GdgIzFLd3MLLdN9Q2l9K8pPeU6Au', 'chloe@example.test'),
(4, 'david', '$2b$10$yikmQ2i9JecKdy7Dc29ms.GC6GdgIzFLd3MLLdN9Q2l9K8pPeU6Au', 'david@example.test');

INSERT INTO tasks (ta_id, ta_title, ta_description, ta_dueDate, ta_owner) VALUES
(1, 'Prepare the book list', 'Collect titles for the next library order.', '2026-10-12', 1),
(2, 'Organize the reading club', 'Choose a date and reserve the meeting room.', '2026-10-20', 2),
(3, 'Update the catalog', 'Check missing authors and publication years.', '2026-11-05', 1),
(4, 'Plan the school visit', 'Prepare activities for the visiting class.', '2026-10-15', 3),
(5, 'Archive old records', 'Review records that can be archived.', NULL, 4);

INSERT INTO comments (co_id, co_comment, co_user, co_task) VALUES
(1, 'I will prepare the first draft today.', 2, 1),
(2, 'Please include the new arrivals.', 3, 1),
(3, 'The meeting room is available on Thursday.', 1, 2),
(4, 'I can bring the activity materials.', 4, 4),
(5, 'I found several records with missing dates.', 2, 3),
(6, 'The archive review can start next week.', 1, 5);

INSERT INTO collaborate (col_user, col_task) VALUES
(2, 1),
(3, 1),
(1, 2),
(3, 2),
(2, 3),
(4, 3),
(1, 4),
(2, 4),
(1, 5);