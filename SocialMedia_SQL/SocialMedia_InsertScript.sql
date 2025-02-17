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

-- Dữ liệu cho bảng Story
INSERT INTO Story (UserId, MediaType, MediaUrl, ExpiresAt) VALUES
(1, 'IMAGE', 'story_1_1.jpg', '2024-01-02 10:00:00'),
(2, 'VIDEO', 'story_2_1.mp4', '2024-01-02 11:00:00'),
(3, 'IMAGE', 'story_3_1.jpg', '2024-01-02 12:00:00'),
(4, 'VIDEO', 'story_4_1.mp4', '2024-01-02 13:00:00'),
(5, 'IMAGE', 'story_5_1.jpg', '2024-01-02 14:00:00'),
(6, 'VIDEO', 'story_6_1.mp4', '2024-01-02 15:00:00'),
(7, 'IMAGE', 'story_7_1.jpg', '2024-01-02 16:00:00'),
(8, 'VIDEO', 'story_8_1.mp4', '2024-01-02 17:00:00'),
(9, 'IMAGE', 'story_9_1.jpg', '2024-01-02 18:00:00'),
(10, 'VIDEO', 'story_10_1.mp4', '2024-01-02 19:00:00'),
(1, 'IMAGE', 'story_1_2.jpg', '2024-01-02 20:00:00'),
(2, 'VIDEO', 'story_2_2.mp4', '2024-01-02 21:00:00'),
(3, 'IMAGE', 'story_3_2.jpg', '2024-01-02 22:00:00'),
(4, 'VIDEO', 'story_4_2.mp4', '2024-01-02 23:00:00'),
(5, 'IMAGE', 'story_5_2.jpg', '2024-01-03 00:00:00'),
(6, 'VIDEO', 'story_6_2.mp4', '2024-01-03 01:00:00'),
(7, 'IMAGE', 'story_7_2.jpg', '2024-01-03 02:00:00'),
(8, 'VIDEO', 'story_8_2.mp4', '2024-01-03 03:00:00'),
(9, 'IMAGE', 'story_9_2.jpg', '2024-01-03 04:00:00'),
(10, 'VIDEO', 'story_10_2.mp4', '2024-01-03 05:00:00');

-- Dữ liệu cho bảng StoryView (mỗi story có nhiều view)
INSERT INTO StoryView (StoryId, UserId) VALUES
(1, 2), (1, 3), (1, 4), (1, 5), (1, 6),
(2, 1), (2, 3), (2, 5), (2, 7), (2, 9),
(3, 1), (3, 2), (3, 4), (3, 6), (3, 8),
(4, 2), (4, 4), (4, 6), (4, 8), (4, 10),
(5, 1), (5, 3), (5, 5), (5, 7), (5, 9),
(6, 2), (6, 4), (6, 6), (6, 8), (6, 10),
(7, 1), (7, 3), (7, 5), (7, 7), (7, 9),
(8, 2), (8, 4), (8, 6), (8, 8), (8, 10),
(9, 1), (9, 3), (9, 5), (9, 7), (9, 9),
(10, 2), (10, 4), (10, 6), (10, 8), (10, 10),
(11, 2), (11, 3), (11, 4), (11, 5), (11, 6),
(12, 1), (12, 3), (12, 5), (12, 7), (12, 9),
(13, 1), (13, 2), (13, 4), (13, 6), (13, 8),
(14, 2), (14, 4), (14, 6), (14, 8), (14, 10),
(15, 1), (15, 3), (15, 5), (15, 7), (15, 9),
(16, 2), (16, 4), (16, 6), (16, 8), (16, 10),
(17, 1), (17, 3), (17, 5), (17, 7), (17, 9),
(18, 2), (18, 4), (18, 6), (18, 8), (18, 10),
(19, 1), (19, 3), (19, 5), (19, 7), (19, 9),
(20, 2), (20, 4), (20, 6), (20, 8), (20, 10);

-- Dữ liệu cho bảng StoryHighlight
INSERT INTO StoryHighlight (UserId, Title, CoverImage) VALUES
(1, 'Paris Trip', 'paris_cover.jpg'),
(2, 'Workout Routine', 'workout_cover.jpg'),
(3, 'Coding Projects', 'coding_cover.jpg'),
(4, 'Favorite Books', 'books_cover.jpg'),
(5, 'Brunch Spots', 'brunch_cover.jpg'),
(6, 'Art Collection', 'art_cover.jpg'),
(7, 'Guitar Practice', 'guitar_cover.jpg'),
(8, 'Rome Adventure', 'rome_cover.jpg'),
(9, 'Investing Tips', 'investing_cover.jpg'),
(10, 'History Lessons', 'history_cover.jpg'),
(1, 'Travel Memories', 'travel_cover.jpg'),
(2, 'Fitness Goals', 'fitness_cover.jpg'),
(3, 'Web Development', 'webdev_cover.jpg'),
(4, 'Book Recommendations', 'bookrecs_cover.jpg'),
(5, 'Food Adventures', 'food_cover.jpg'),
(6, 'Digital Art', 'digitalart_cover.jpg'),
(7, 'Acoustic Covers', 'acoustic_cover.jpg'),
(8, 'European Travels', 'europe_cover.jpg'),
(9, 'Financial Growth', 'financialgrowth_cover.jpg'),
(10, 'Ancient Civilizations', 'ancientciv_cover.jpg');

-- Dữ liệu cho bảng StoryHighlightItem
INSERT INTO StoryHighlightItem (StoryHighlightId, StoryId, OrderIndex) VALUES
(1, 1, 1), (1, 11, 2), (2, 2, 1), (2, 12, 2), (3, 3, 1), (3, 13, 2),
(4, 4, 1), (4, 14, 2), (5, 5, 1), (5, 15, 2), (6, 6, 1), (6, 16, 2),
(7, 7, 1), (7, 17, 2), (8, 8, 1), (8, 18, 2), (9, 9, 1), (9, 19, 2),
(10, 10, 1), (10, 20, 2),
(11, 1, 1), (11, 2, 2), (12, 3, 1), (12, 4, 2), (13, 5, 1), (13, 6, 2),
(14, 7, 1), (14, 8, 2), (15, 9, 1), (15, 10, 2), (16, 11, 1), (16, 12, 2),
(17, 13, 1), (17, 14, 2), (18, 15, 1), (18, 16, 2), (19, 17, 1), (19, 18, 2),
(20, 19, 1), (20, 20, 2);