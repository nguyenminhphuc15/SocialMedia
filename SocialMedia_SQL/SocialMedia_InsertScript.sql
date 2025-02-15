USE `SocialMedia`;
-- Thêm dữ liệu vào bảng `User` (mở rộng)
INSERT INTO `User` (Username, Email, Password, FullName, Bio, Website, PhoneNumber, Gender, Birthday, ProfilePicture, PrivateAccount, Status, Verified) VALUES
('john_doe', 'john.doe@example.com', '$2a$10$abcdefghijklmnopqrstuvwx0123456789', 'John Doe', 'Photographer and traveler.', 'johndoe.com', '123-456-7890', 'MALE', '1990-05-15', 'john_doe.jpg', FALSE, 'ACTIVE', TRUE),
('jane_smith', 'jane.smith@example.com', '$2a$10$abcdefghijklmnopqrstuvwx0123456789', 'Jane Smith', 'Fitness enthusiast and blogger.', 'janesmithfitness.com', '987-654-3210', 'FEMALE', '1992-10-20', 'jane_smith.jpg', TRUE, 'ACTIVE', FALSE),
('peter_jones', 'peter.jones@example.com', '$2a$10$abcdefghijklmnopqrstuvwx0123456789', 'Peter Jones', 'Software developer and gamer.', 'peterjones.dev', '555-123-4567', 'MALE', '1988-03-01', 'peter_jones.jpg', FALSE, 'ACTIVE', TRUE),
('linda_brown', 'linda.brown@example.com', '$2a$10$abcdefghijklmnopqrstuvwx0123456789', 'Linda Brown', 'Bookworm and nature lover.', 'lindabrownreads.com', '111-222-3333', 'FEMALE', '1995-07-08', 'linda_brown.jpg', FALSE, 'BANNED', FALSE),
('david_wilson', 'david.wilson@example.com', '$2a$10$abcdefghijklmnopqrstuvwx0123456789', 'David Wilson', 'Marketing professional and food lover.', 'davidwilsonmarketing.com', '444-555-6666', 'MALE', '1993-12-25', 'david_wilson.jpg', FALSE, 'INACTIVE', FALSE),
('sarah_miller', 'sarah.miller@example.com', '$2a$10$abcdefghijklmnopqrstuvwx0123456789', 'Sarah Miller', 'Artist and designer.', 'sarahmillerart.com', '777-888-9999', 'FEMALE', '1991-09-03', 'sarah_miller.jpg', FALSE, 'ACTIVE', TRUE),
('michael_davis', 'michael.davis@example.com', '$2a$10$abcdefghijklmnopqrstuvwx0123456789', 'Michael Davis', 'Musician and composer.', 'michaeldavismusic.com', '666-777-8888', 'MALE', '1987-02-14', 'michael_davis.jpg', TRUE, 'ACTIVE', FALSE),
('emily_white', 'emily.white@example.com', '$2a$10$abcdefghijklmnopqrstuvwx0123456789', 'Emily White', 'Travel blogger and writer.', 'emilywhitetravels.com', '333-444-5555', 'FEMALE', '1994-06-22', 'emily_white.jpg', FALSE, 'ACTIVE', TRUE),
('kevin_anderson', 'kevin.anderson@example.com', '$2a$10$abcdefghijklmnopqrstuvwx0123456789', 'Kevin Anderson', 'Financial analyst and investor.', 'kevinandersonfinance.com', '222-333-4444', 'MALE', '1989-11-10', 'kevin_anderson.jpg', FALSE, 'ACTIVE', FALSE),
('jessica_taylor', 'jessica.taylor@example.com', '$2a$10$abcdefghijklmnopqrstuvwx0123456789', 'Jessica Taylor', 'Teacher and volunteer.', 'jessicatayloreducation.com', '888-999-0000', 'FEMALE', '1996-04-28', 'jessica_taylor.jpg', TRUE, 'ACTIVE', TRUE);

-- Thêm dữ liệu vào bảng `Post` (mở rộng)
INSERT INTO `Post` (UserId, Content, Status) VALUES
(1, 'Golden hour at the Eiffel Tower. #paris #travel #photography', 'PUBLIC'),
(2, 'Just crushed my workout! Feeling strong. #fitness #workout #gym', 'PUBLIC'),
(3, 'Working on a new game. Stay tuned! #gamedev #indiedev #coding', 'PUBLIC'),
(4, 'Lost in a good book. #reading #booklover #cozy', 'PUBLIC'),
(5, 'Delicious brunch with friends. #foodie #brunch #friends', 'PUBLIC'),
(6, 'Creating a new painting. #art #artist #painting', 'PUBLIC'),
(7, 'Practicing my guitar. #music #guitar #musician', 'PUBLIC'),
(8, 'Exploring the streets of Rome. #rome #travel #italy', 'PUBLIC'),
(9, 'Analyzing the market. #finance #investing #stocks', 'PUBLIC'),
(10, 'Teaching my students about history. #education #teacher #history', 'PUBLIC'),
(1, 'Morning coffee vibes. #coffee #morning #goodvibes', 'PUBLIC'),
(2, 'Leg day is the best day! #gymlife #fitnessmotivation #legday', 'PUBLIC'),
(3, 'Debugging is my superpower. #codinglife #developer #debugging', 'PUBLIC'),
(4, 'Rainy day reads. #rainyday #books #readingtime', 'PUBLIC'),
(5, 'Homemade pizza night. #pizza #homemade #foodporn', 'PUBLIC');

-- Thêm dữ liệu vào bảng `PostMedia` (mở rộng)
INSERT INTO `PostMedia` (PostId, MediaUrl, MediaType) VALUES
(1, 'eiffel_tower.jpg', 'IMAGE'),
(2, 'workout_selfie.jpg', 'IMAGE'),
(3, 'game_screenshot.png', 'IMAGE'),
(4, 'book_on_table.jpg', 'IMAGE'),
(5, 'brunch_table.jpg', 'IMAGE'),
(6, 'painting_in_progress.jpg', 'IMAGE'),
(7, 'guitar_practice.mp4', 'VIDEO'),
(8, 'rome_street.jpg', 'IMAGE'),
(9, 'market_analysis.png', 'IMAGE'),
(10, 'history_lesson.jpg', 'IMAGE'),
(11, 'coffee_cup.jpg', 'IMAGE'),
(12, 'leg_day_weights.jpg', 'IMAGE'),
(13, 'debugging_code.png', 'IMAGE'),
(14, 'rainy_day_book.jpg', 'IMAGE'),
(15, 'homemade_pizza.jpg', 'IMAGE');

-- Thêm dữ liệu vào bảng `PostReport` (mở rộng)
INSERT INTO `PostReport` (UserId, PostId, ReportType, Reason) VALUES
(5, 1, 1, 'Misleading information.'),
(3, 4, 2, 'Spam account.'),
(2, 7, 3, 'Hate speech.'),
(8, 10, 1, 'Copyright infringement.'),
(9, 12, 2, 'Harassment.');

-- Thêm dữ liệu vào bảng `Like` (mở rộng)
INSERT INTO `Like` (UserId, PostId) VALUES
(2, 1), (3, 1), (1, 2), (4, 3), (5, 4), (6, 5), (7, 6), (8, 7), (9, 8), (10, 9),
(1, 10), (2, 11), (3, 12), (4, 13), (5, 14), (6, 15), (7, 1), (8, 2), (9, 3), (10, 4);

-- Thêm dữ liệu vào bảng `Comment` (mở rộng)
INSERT INTO `Comment` (PostId, UserId, Content) VALUES
(1, 2, 'Stunning view!'),
(1, 3, 'Paris is always a good idea.'),
(2, 1, 'Looking strong! Keep it up.'),
(3, 4, 'Can wait to play it!'),
(4, 5, 'What book are you reading?'),
(5, 6, 'Looks delicious!'),
(6, 7, 'Beautiful artwork!'),
(7, 8, 'Awesome guitar skills!'),
(8, 9, 'Rome is amazing!'),
(9, 10, 'Interesting analysis.'),
(10, 1, 'History is fascinating.'),
(11, 2, 'Love my morning coffee.'),
(12, 3, 'Feeling the burn!'),
(13, 4, 'Debugging is an art.'),
(14, 5, 'Perfect for a rainy day.'),
(15, 6, 'Homemade is always better.');

-- Thêm dữ liệu vào bảng `Bookmark` (mở rộng)
INSERT INTO `Bookmark` (UserId, PostId) VALUES
(1, 3), (2, 4), (3, 5), (4, 6), (5, 7), (6, 8), (7, 9), (8, 10), (9, 11), (10, 12),
(1, 13), (2, 14), (3, 15), (4, 1), (5, 2);

-- Thêm dữ liệu vào bảng `Tag` (mở rộng)
INSERT INTO `Tag` (PostId, UserId) VALUES
(1, 2), (2, 3), (3, 1), (4, 5), (5, 6), (6, 7), (7, 8), (8, 9), (9, 10), (10, 1),
(11, 2), (12, 3), (13, 4), (14, 5), (15, 6);

-- Thêm dữ liệu vào bảng `Relationships` (mở rộng)
INSERT INTO `Relationships` (UserId, RelatedId, RelationshipType, IsFavorite) VALUES
(1, 2, 'following', TRUE), (1, 3, 'following', FALSE), (2, 1, 'following', TRUE), (3, 1, 'following', FALSE), (4, 5, 'blocked', FALSE),
(5, 6, 'following', TRUE), (6, 7, 'following', FALSE), (7, 8, 'following', TRUE), (8, 9, 'following', FALSE), (9, 10, 'following', TRUE),
(10, 1, 'following', FALSE), (2, 3, 'close_friend', TRUE), (3, 4, 'close_friend', FALSE), (4, 5, 'following', TRUE), (5, 1, 'following', FALSE);

-- Thêm dữ liệu vào bảng `Mute` (mở rộng)
INSERT INTO `Mute` (UserId, MutedId, MuteType) VALUES
(1, 4, 'post'), (2, 5, 'story'), (3, 6, 'both'), (4, 7, 'post'), (5, 8, 'story'),
(6, 9, 'both'), (7, 10, 'post'), (8, 1, 'story'), (9, 2, 'both'), (10, 3, 'post');

-- Thêm dữ liệu vào bảng `conversations` (mở rộng)
INSERT INTO `conversations` (is_group, group_name, group_avatar) VALUES
(FALSE, NULL, NULL), (TRUE, 'Coding Group', 'coding_group.jpg'), (FALSE, NULL, NULL), (TRUE, 'Fitness Friends', 'fitness_friends.jpg');

-- Thêm dữ liệu vào bảng `conversation_members` (mở rộng)
INSERT INTO `conversation_members` (conversation_id, user_id, is_admin) VALUES
(1, 1, FALSE), (1, 2, FALSE), (2, 3, TRUE), (2, 4, FALSE), (2, 5, FALSE),
(3, 6, FALSE), (3, 7, FALSE), (4, 8, TRUE), (4, 9, FALSE), (4, 10, FALSE);

-- Thêm dữ liệu vào bảng `messages` (mở rộng)
INSERT INTO `messages` (conversation_id, sender_id, content, message_type) VALUES
(1, 1, 'Hey Jane, how are you?', 'text'), (1, 2, 'Hi John, I\'m doing well!', 'text'), (2, 3, 'Anyone working on the project tonight?', 'text'),
(3, 6, 'Hey Michael, what\'s up?', 'text'), (3, 7, 'Hi Sarah, not much!', 'text'), (4, 8, 'Ready for a workout tomorrow?', 'text');

-- Thêm dữ liệu vào bảng `message_reactions` (mở rộng)
INSERT INTO `message_reactions` (message_id, user_id, emoji) VALUES
(1, 2, '👍'), (2, 1, '😊'), (3, 4, '🤔'), (4, 7, '👋'), (5, 6, '😄');

-- Thêm dữ liệu vào bảng `message_status` (mở rộng)
INSERT INTO `message_status` (message_id, user_id, is_read, is_pinned) VALUES
(1, 2, TRUE, FALSE), (2, 1, TRUE, TRUE), (3, 4, FALSE, FALSE), (4, 7, TRUE, FALSE), (5, 6, FALSE, TRUE);