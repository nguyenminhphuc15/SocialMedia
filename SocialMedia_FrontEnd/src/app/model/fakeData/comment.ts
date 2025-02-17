// src/models/Comment.ts

import { User } from './user';

export interface Comment {
  CommentId: number; // Hoặc string nếu bạn dùng UUID
  PostId: number;
  UserId: number;
  Content: string;
  createdAt?: Date;
  updatedAt?: Date;
  User?: User; // Để liên kết đến thông tin người dùng
}

export const sampleComments: Comment[] = [
  {
    CommentId: 1,
    PostId: 1,
    UserId: 2,
    Content: 'Stunning view!',
  },
  {
    CommentId: 2,
    PostId: 1,
    UserId: 3,
    Content: 'Paris is always a good idea.',
  },
  {
    CommentId: 3,
    PostId: 2,
    UserId: 1,
    Content: 'Looking strong! Keep it up.',
  },
  {
    CommentId: 4,
    PostId: 3,
    UserId: 4,
    Content: 'Can wait to play it!',
  },
  {
    CommentId: 5,
    PostId: 4,
    UserId: 5,
    Content: 'What book are you reading?',
  },
  {
    CommentId: 6,
    PostId: 5,
    UserId: 6,
    Content: 'Looks delicious!',
  },
  {
    CommentId: 7,
    PostId: 6,
    UserId: 7,
    Content: 'Beautiful artwork!',
  },
  {
    CommentId: 8,
    PostId: 7,
    UserId: 8,
    Content: 'Awesome guitar skills!',
  },
  {
    CommentId: 9,
    PostId: 8,
    UserId: 9,
    Content: 'Rome is amazing!',
  },
  {
    CommentId: 10,
    PostId: 9,
    UserId: 10,
    Content: 'Interesting analysis.',
  },
  {
    CommentId: 11,
    PostId: 10,
    UserId: 1,
    Content: 'History is fascinating.',
  },
  {
    CommentId: 12,
    PostId: 11,
    UserId: 2,
    Content: 'Love my morning coffee.',
  },
  {
    CommentId: 13,
    PostId: 12,
    UserId: 3,
    Content: 'Feeling the burn!',
  },
  {
    CommentId: 14,
    PostId: 13,
    UserId: 4,
    Content: 'Debugging is an art.',
  },
  {
    CommentId: 15,
    PostId: 14,
    UserId: 5,
    Content: 'Perfect for a rainy day.',
  },
  {
    CommentId: 16,
    PostId: 15,
    UserId: 6,
    Content: 'Homemade is always better.',
  },
];
