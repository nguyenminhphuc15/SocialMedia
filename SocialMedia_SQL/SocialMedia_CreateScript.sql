-- Use the `mysql` database if necessary for administrative tasks
-- USE mysql;

-- Drop the database if it exists and recreate the `SocialMedia` database
DROP DATABASE IF EXISTS `SocialMedia`;
CREATE DATABASE IF NOT EXISTS `SocialMedia`;
USE `SocialMedia`;

CREATE TABLE IF NOT EXISTS `User` (
    Id                BIGINT AUTO_INCREMENT PRIMARY KEY,  
    Username         VARCHAR(50) UNIQUE NOT NULL,      -- Tên người dùng duy nhất (username)
    Email            VARCHAR(255) UNIQUE NOT NULL,     -- Email duy nhất
    Password         VARCHAR(255) NOT NULL,            -- Mật khẩu đã hash
    FullName         VARCHAR(255),                     -- Họ và tên đầy đủ
    Bio              TEXT,                             -- Tiểu sử người dùng (Bio)
    Website         VARCHAR(255),                      -- Link website cá nhân
    PhoneNumber     VARCHAR(20) UNIQUE,               -- Số điện thoại (có thể NULL)
    Gender          ENUM('MALE', 'FEMALE', 'OTHER'),   -- Giới tính
    Birthday        DATE,                              -- Ngày sinh
    ProfilePicture  VARCHAR(255),                      -- Ảnh đại diện
    PrivateAccount  BOOLEAN DEFAULT FALSE,            -- Tài khoản riêng tư hay công khai
    Status          ENUM('ACTIVE', 'INACTIVE', 'BANNED') DEFAULT 'ACTIVE',  -- Trạng thái tài khoản
    Verified        BOOLEAN DEFAULT FALSE,            -- Tài khoản đã xác minh (dấu tick xanh)
    CreateTime      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Ngày tạo tài khoản
    UpdateTime      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Ngày cập nhật cuối cùng
);
CREATE TABLE IF NOT EXISTS `Post` (
    Id         BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    UserId     BIGINT UNSIGNED NOT NULL,
    Content    TEXT NOT NULL, 
    CreateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status     ENUM('PUBLIC', 'PRIVATE', 'FRIENDS_ONLY') DEFAULT 'PUBLIC',
    FOREIGN KEY (UserId) REFERENCES `User`(Id) ON DELETE CASCADE,
    INDEX idx_post_userid (UserId),
    INDEX idx_post_createtime (CreateTime) 
);
CREATE TABLE IF NOT EXISTS `PostMedia` (
    Id        BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PostId    BIGINT UNSIGNED NOT NULL,
    MediaUrl  VARCHAR(500) NOT NULL,
    MediaType ENUM('IMAGE', 'VIDEO') NOT NULL,
    FOREIGN KEY (PostId) REFERENCES `Post`(Id) ON DELETE CASCADE,
    INDEX idx_postmedia_postid (PostId)
);
CREATE TABLE IF NOT EXISTS `PostReport` (
    Id         BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    UserId     BIGINT UNSIGNED NOT NULL,
    PostId     BIGINT UNSIGNED NOT NULL,
    ReportType TINYINT UNSIGNED NOT NULL, -- 0: Spam, 1: Hate Speech, 2: Fake News, 3: Khác
    Status     TINYINT UNSIGNED DEFAULT 0, -- 0: Đang xử lý, 1: Đã xử lý, 2: Bị từ chối
    Reason     TEXT, -- Mô tả chi tiết lý do
    CreateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserId) REFERENCES `User`(Id) ON DELETE CASCADE,
    FOREIGN KEY (PostId) REFERENCES `Post`(Id) ON DELETE CASCADE,
    UNIQUE KEY (UserId, PostId), -- Mỗi user chỉ được report 1 lần/bài viết
    INDEX idx_report_postid (PostId)
);
CREATE TABLE IF NOT EXISTS `Like` (
    Id        BIGINT AUTO_INCREMENT PRIMARY KEY,
    UserId   BIGINT NOT NULL,              -- Người thích bài viết
    PostId   BIGINT NOT NULL,              -- Bài viết được thích
    CreateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Ngày thích bài viết
    FOREIGN KEY (UserId) REFERENCES `User`(Id) ON DELETE CASCADE,
    FOREIGN KEY (PostId) REFERENCES `Post`(Id) ON DELETE CASCADE,
    UNIQUE (UserId, PostId) -- Một người chỉ có thể thích một bài viết một lần
);
CREATE TABLE IF NOT EXISTS `Comment` (
    Id        BIGINT AUTO_INCREMENT PRIMARY KEY,
    PostId   BIGINT NOT NULL,              -- Bài viết được bình luận
    UserId   BIGINT NOT NULL,              -- Người bình luận
    Content  TEXT NOT NULL,                 -- Nội dung bình luận
    LikesCount INT DEFAULT 0,                -- Số lượt thích bình luận
    ParentCommentId BIGINT DEFAULT NULL,     -- Trả lời bình luận khác (nếu có)
    CreateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Ngày bình luận
    FOREIGN KEY (PostId) REFERENCES `Post`(Id) ON DELETE CASCADE,
    FOREIGN KEY (UserId) REFERENCES `User`(Id) ON DELETE CASCADE,
    FOREIGN KEY (ParentCommentId) REFERENCES `Comment`(Id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS `Bookmark` (
    Id        BIGINT AUTO_INCREMENT PRIMARY KEY,
    UserId   BIGINT NOT NULL,             -- Người lưu bài viết
    PostId   BIGINT NOT NULL,             -- Bài viết được lưu
    CreateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Ngày lưu bài viết
    FOREIGN KEY (UserId) REFERENCES `User`(Id) ON DELETE CASCADE,
    FOREIGN KEY (PostId) REFERENCES `Post`(Id) ON DELETE CASCADE,
    UNIQUE (UserId, PostId) -- Một người không thể lưu cùng một bài viết nhiều lần
);
CREATE TABLE IF NOT EXISTS `Tag` (
    Id        BIGINT AUTO_INCREMENT PRIMARY KEY,
    PostId   BIGINT NOT NULL,            -- Bài viết chứa thẻ
    UserId   BIGINT NOT NULL,            -- Người được gắn thẻ
    FOREIGN KEY (PostId) REFERENCES `Post`(Id) ON DELETE CASCADE,
    FOREIGN KEY (UserId) REFERENCES `User`(Id) ON DELETE CASCADE,
    UNIQUE (PostId, UserId) -- Một người không thể bị gắn thẻ nhiều lần trong một bài viết
);
CREATE TABLE `Following` (
    UserId       BIGINT UNSIGNED NOT NULL, -- Người dùng
    FollowingId  BIGINT UNSIGNED NOT NULL, -- Người mà User này follow
    IsFavorite   BOOLEAN DEFAULT FALSE, -- Đánh dấu ưu tiên (Bạn thân)
    CreatedAt    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (UserId, FollowingId),
    INDEX idx_following (UserId, FollowingId)
);
CREATE TABLE `Block` (
    UserId      BIGINT UNSIGNED NOT NULL, -- Người chặn
    BlockedId   BIGINT UNSIGNED NOT NULL, -- Người bị chặn
    CreatedAt   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (UserId, BlockedId),
    INDEX idx_block (UserId, BlockedId)
);
CREATE TABLE `Mute` (
    UserId       BIGINT UNSIGNED NOT NULL, -- Người thực hiện mute
    MutedId      BIGINT UNSIGNED NOT NULL, -- Người bị mute
    MuteType     ENUM('story', 'post', 'both') NOT NULL, -- Mute loại nào?
    CreatedAt    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (UserId, MutedId, MuteType),
    INDEX idx_mute (UserId, MutedId)
);
CREATE TABLE `CloseFriends` (
    UserId        BIGINT UNSIGNED NOT NULL, -- Người dùng
    FriendId      BIGINT UNSIGNED NOT NULL, -- Người trong danh sách bạn thân
    CreatedAt     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (UserId, FriendId),
    INDEX idx_close_friends (UserId, FriendId)
);
CREATE TABLE conversations (
    conversation_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    is_group BOOLEAN DEFAULT FALSE,
    group_name VARCHAR(255) DEFAULT NULL,
    group_avatar VARCHAR(255) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE conversation_members (
    conversation_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (conversation_id, user_id),
    FOREIGN KEY (conversation_id) REFERENCES conversations(conversation_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE messages (
    message_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    conversation_id BIGINT NOT NULL,
    sender_id BIGINT NOT NULL,
    content TEXT DEFAULT NULL, -- Nội dung tin nhắn
    file_url VARCHAR(255) DEFAULT NULL, -- File, ảnh, video, voice
    message_type ENUM('text', 'image', 'video', 'audio', 'file') NOT NULL DEFAULT 'text',
    is_recalled BOOLEAN DEFAULT FALSE, -- Tin nhắn đã thu hồi
    deleted_at TIMESTAMP NULL DEFAULT NULL, -- Thời gian xóa tin nhắn
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (conversation_id) REFERENCES conversations(conversation_id) ON DELETE CASCADE,
    FOREIGN KEY (sender_id) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE message_reactions (
    reaction_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    message_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    emoji VARCHAR(10) NOT NULL,
    reacted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (message_id, user_id),
    FOREIGN KEY (message_id) REFERENCES messages(message_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE message_replies (
    reply_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    message_id BIGINT NOT NULL, -- Tin nhắn mới
    replied_to_id BIGINT NOT NULL, -- Tin nhắn gốc
    FOREIGN KEY (message_id) REFERENCES messages(message_id) ON DELETE CASCADE,
    FOREIGN KEY (replied_to_id) REFERENCES messages(message_id) ON DELETE CASCADE
);
CREATE TABLE message_shares (
    share_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    original_message_id BIGINT NOT NULL,
    new_message_id BIGINT NOT NULL,
    shared_by BIGINT NOT NULL,
    shared_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (original_message_id) REFERENCES messages(message_id) ON DELETE CASCADE,
    FOREIGN KEY (new_message_id) REFERENCES messages(message_id) ON DELETE CASCADE,
    FOREIGN KEY (shared_by) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE message_status (
    message_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE, -- Đã xem
    is_pinned BOOLEAN DEFAULT FALSE, -- Đã ghim
    deleted_at TIMESTAMP NULL DEFAULT NULL, -- User đã xóa tin nhắn này
    PRIMARY KEY (message_id, user_id),
    FOREIGN KEY (message_id) REFERENCES messages(message_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
    