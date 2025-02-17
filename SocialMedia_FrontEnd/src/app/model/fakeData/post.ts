// src/models/Post.ts

import { User } from './user';

export interface Post {
  PostId: number; // Hoặc string nếu bạn dùng UUID
  UserId: number; // ID của người dùng
  Content: string;
  Status: 'PUBLIC' | 'PRIVATE' | 'DRAFT';
  createdAt?: Date; // Thêm các trường thời gian nếu cần
  updatedAt?: Date;
  User?: User; // Để liên kết đến thông tin người dùng (nếu bạn fetch cùng lúc)
}

export const samplePosts: Post[] = [
  {
    PostId: 1,
    UserId: 1,
    Content: 'Golden hour at the Eiffel Tower. #paris #travel #photography',
    Status: 'PUBLIC',
  },
  {
    PostId: 2,
    UserId: 2,
    Content: 'Just crushed my workout! Feeling strong. #fitness #workout #gym',
    Status: 'PUBLIC',
  },
  {
    PostId: 3,
    UserId: 3,
    Content: 'Working on a new game. Stay tuned! #gamedev #indiedev #coding',
    Status: 'PUBLIC',
  },
  {
    PostId: 4,
    UserId: 4,
    Content: 'Lost in a good book. #reading #booklover #cozy',
    Status: 'PUBLIC',
  },
  {
    PostId: 5,
    UserId: 5,
    Content: 'Delicious brunch with friends. #foodie #brunch #friends',
    Status: 'PUBLIC',
  },
  {
    PostId: 6,
    UserId: 6,
    Content: 'Creating a new painting. #art #artist #painting',
    Status: 'PUBLIC',
  },
  {
    PostId: 7,
    UserId: 7,
    Content: 'Practicing my guitar. #music #guitar #musician',
    Status: 'PUBLIC',
  },
  {
    PostId: 8,
    UserId: 8,
    Content: 'Exploring the streets of Rome. #rome #travel #italy',
    Status: 'PUBLIC',
  },
  {
    PostId: 9,
    UserId: 9,
    Content: 'Analyzing the market. #finance #investing #stocks',
    Status: 'PUBLIC',
  },
  {
    PostId: 10,
    UserId: 10,
    Content: 'Teaching my students about history. #education #teacher #history',
    Status: 'PUBLIC',
  },
  {
    PostId: 11,
    UserId: 1,
    Content: 'Morning coffee vibes. #coffee #morning #goodvibes',
    Status: 'PUBLIC',
  },
  {
    PostId: 12,
    UserId: 2,
    Content: 'Leg day is the best day! #gymlife #fitnessmotivation #legday',
    Status: 'PUBLIC',
  },
  {
    PostId: 13,
    UserId: 3,
    Content: 'Debugging is my superpower. #codinglife #developer #debugging',
    Status: 'PUBLIC',
  },
  {
    PostId: 14,
    UserId: 4,
    Content: 'Rainy day reads. #rainyday #books #readingtime',
    Status: 'PUBLIC',
  },
  {
    PostId: 15,
    UserId: 5,
    Content: 'Homemade pizza night. #pizza #homemade #foodporn',
    Status: 'PUBLIC',
  },
];
