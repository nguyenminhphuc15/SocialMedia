
DROP DATABASE IF EXISTS `SocialMedia`;
CREATE DATABASE IF NOT EXISTS `SocialMedia`;
USE `SocialMedia`;
CREATE TABLE IF NOT EXISTS `User` (
    Id                  BIGINT AUTO_INCREMENT PRIMARY KEY,
    Username            VARCHAR(50) UNIQUE NOT NULL,
    Email               VARCHAR(255) UNIQUE NOT NULL,
    Password            VARCHAR(255) NOT NULL,
    FullName            VARCHAR(255),
    Bio                 TEXT,
    Website             VARCHAR(255),
    PhoneNumber         VARCHAR(20) UNIQUE,
    Gender              ENUM('MALE', 'FEMALE', 'OTHER'),
    Birthday            DATE,
    ProfilePicture      VARCHAR(255),
    PrivateAccount      BOOLEAN DEFAULT FALSE,
    Status              ENUM('ACTIVE', 'INACTIVE', 'BANNED') DEFAULT 'ACTIVE',
    Verified            BOOLEAN DEFAULT FALSE,
    CreateTime          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdateTime          TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `Post` (
    Id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    UserId      BIGINT NOT NULL,
    Content     TEXT NOT NULL,
    CreateTime  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status      ENUM('PUBLIC', 'PRIVATE', 'FRIENDS_ONLY') DEFAULT 'PUBLIC',
    FOREIGN KEY (UserId) REFERENCES `User`(Id) ON DELETE CASCADE,
    INDEX idx_post_userid (UserId),
    INDEX idx_post_createtime (CreateTime)
);

CREATE TABLE IF NOT EXISTS `PostMedia` (
    Id          BIGINT AUTO_INCREMENT PRIMARY KEY,  
    PostId      BIGINT NOT NULL,                   
    MediaUrl    VARCHAR(500) NOT NULL,
    MediaType   ENUM('IMAGE', 'VIDEO') NOT NULL,
    FOREIGN KEY (PostId) REFERENCES `Post`(Id) ON DELETE CASCADE,
    INDEX idx_postmedia_postid (PostId)
);

CREATE TABLE IF NOT EXISTS `PostReport` (
    Id          BIGINT AUTO_INCREMENT PRIMARY KEY,  
    UserId      BIGINT NOT NULL,                   
    PostId      BIGINT NOT NULL,                   
    ReportType  TINYINT UNSIGNED NOT NULL,
    Status      TINYINT UNSIGNED DEFAULT 0,
    Reason      TEXT,
    CreateTime  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserId) REFERENCES `User`(Id) ON DELETE CASCADE,
    FOREIGN KEY (PostId) REFERENCES `Post`(Id) ON DELETE CASCADE,
    UNIQUE KEY (UserId, PostId),
    INDEX idx_report_postid (PostId)
);

CREATE TABLE IF NOT EXISTS `Like` (
    Id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    UserId      BIGINT NOT NULL,
    PostId      BIGINT NOT NULL,
    CreateTime  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserId) REFERENCES `User`(Id) ON DELETE CASCADE,
    FOREIGN KEY (PostId) REFERENCES `Post`(Id) ON DELETE CASCADE,
    UNIQUE (UserId, PostId)
);

CREATE TABLE IF NOT EXISTS `Comment` (
    Id              BIGINT AUTO_INCREMENT PRIMARY KEY,
    PostId          BIGINT NOT NULL,
    UserId          BIGINT NOT NULL,
    Content         TEXT NOT NULL,
    LikesCount      INT DEFAULT 0,
    ParentCommentId BIGINT DEFAULT NULL,
    CreateTime      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostId) REFERENCES `Post`(Id) ON DELETE CASCADE,
    FOREIGN KEY (UserId) REFERENCES `User`(Id) ON DELETE CASCADE,
    FOREIGN KEY (ParentCommentId) REFERENCES `Comment`(Id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `Bookmark` (
    Id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    UserId      BIGINT NOT NULL,
    PostId      BIGINT NOT NULL,
    CreateTime  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserId) REFERENCES `User`(Id) ON DELETE CASCADE,
    FOREIGN KEY (PostId) REFERENCES `Post`(Id) ON DELETE CASCADE,
    UNIQUE (UserId, PostId)
);
CREATE TABLE IF NOT EXISTS `Tag` (
    Id      BIGINT AUTO_INCREMENT PRIMARY KEY,
    PostId  BIGINT NOT NULL,
    UserId  BIGINT NOT NULL,
    FOREIGN KEY (PostId) REFERENCES `Post`(Id) ON DELETE CASCADE,
    FOREIGN KEY (UserId) REFERENCES `User`(Id) ON DELETE CASCADE,
    UNIQUE (PostId, UserId)
);

CREATE TABLE IF NOT EXISTS `Relationships` (
    UserId      BIGINT NOT NULL,
    RelatedId   BIGINT NOT NULL,
    RelationshipType ENUM('close_friend', 'following', 'blocked') NOT NULL,
    IsFavorite  BOOLEAN DEFAULT FALSE, 
    CreatedAt   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (UserId, RelatedId, RelationshipType),
    FOREIGN KEY (UserId) REFERENCES `User`(Id) ON DELETE CASCADE,
    FOREIGN KEY (RelatedId) REFERENCES `User`(Id) ON DELETE CASCADE,
    INDEX idx_relationships (UserId, RelatedId, RelationshipType)
);

CREATE TABLE IF NOT EXISTS `Mute` (
    UserId      BIGINT NOT NULL,       
    MutedId     BIGINT NOT NULL,      
    MuteType    ENUM('story', 'post', 'both') NOT NULL,
    CreatedAt   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (UserId, MutedId, MuteType),
    FOREIGN KEY (UserId) REFERENCES `User`(Id) ON DELETE CASCADE, 
    FOREIGN KEY (MutedId) REFERENCES `User`(Id) ON DELETE CASCADE, 
    INDEX idx_mute (UserId, MutedId)
);

CREATE TABLE IF NOT EXISTS `conversations` (
    conversation_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    is_group BOOLEAN DEFAULT FALSE,
    group_name VARCHAR(255) DEFAULT NULL,
    group_avatar VARCHAR(255) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `conversation_members` (
    conversation_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (conversation_id, user_id),
    FOREIGN KEY (conversation_id) REFERENCES `conversations`(conversation_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES `User`(Id) ON DELETE CASCADE 
);

CREATE TABLE IF NOT EXISTS `messages` (
    message_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    conversation_id BIGINT NOT NULL,
    sender_id BIGINT NOT NULL,
    content TEXT DEFAULT NULL,
    file_url VARCHAR(255) DEFAULT NULL,
    message_type ENUM('text', 'image', 'video', 'audio', 'file') NOT NULL DEFAULT 'text',
    is_recalled BOOLEAN DEFAULT FALSE,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    replied_to_id BIGINT NULL, 

    FOREIGN KEY (conversation_id) REFERENCES `conversations`(conversation_id) ON DELETE CASCADE,
    FOREIGN KEY (sender_id) REFERENCES `User`(Id) ON DELETE CASCADE,
    FOREIGN KEY (replied_to_id) REFERENCES `messages`(message_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `message_reactions` (
    reaction_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    message_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    emoji VARCHAR(10) NOT NULL,
    reacted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (message_id, user_id),
    FOREIGN KEY (message_id) REFERENCES `messages`(message_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES `User`(Id) ON DELETE CASCADE      
);


CREATE TABLE IF NOT EXISTS `message_status` (
    message_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    is_pinned BOOLEAN DEFAULT FALSE,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (message_id, user_id),
    FOREIGN KEY (message_id) REFERENCES `messages`(message_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES `User`(Id) ON DELETE CASCADE      
);