// src/models/Like.ts

export interface Like {
  LikeId: number; // Hoặc string nếu bạn dùng UUID
  UserId: number;
  PostId: number;
}

export const sampleLikes: Like[] = [
  { LikeId: 1, UserId: 2, PostId: 1 },
  { LikeId: 2, UserId: 3, PostId: 1 },
  { LikeId: 3, UserId: 1, PostId: 2 },
  { LikeId: 4, UserId: 4, PostId: 3 },
  { LikeId: 5, UserId: 5, PostId: 4 },
  { LikeId: 6, UserId: 6, PostId: 5 },
  { LikeId: 7, UserId: 7, PostId: 6 },
  { LikeId: 8, UserId: 8, PostId: 7 },
  { LikeId: 9, UserId: 9, PostId: 8 },
  { LikeId: 10, UserId: 10, PostId: 9 },
  { LikeId: 11, UserId: 1, PostId: 10 },
  { LikeId: 12, UserId: 2, PostId: 11 },
  { LikeId: 13, UserId: 3, PostId: 12 },
  { LikeId: 14, UserId: 4, PostId: 13 },
  { LikeId: 15, UserId: 5, PostId: 14 },
  { LikeId: 16, UserId: 6, PostId: 15 },
  { LikeId: 17, UserId: 7, PostId: 1 },
  { LikeId: 18, UserId: 8, PostId: 2 },
  { LikeId: 19, UserId: 9, PostId: 3 },
  { LikeId: 20, UserId: 10, PostId: 4 },
];
