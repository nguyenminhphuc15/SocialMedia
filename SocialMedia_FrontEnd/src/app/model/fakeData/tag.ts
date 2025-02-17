// src/models/Tag.ts

export interface Tag {
  TagId: number; // Hoặc string nếu bạn dùng UUID
  PostId: number;
  UserId: number;
}

export const sampleTags: Tag[] = [
  { TagId: 1, PostId: 1, UserId: 2 },
  { TagId: 2, PostId: 2, UserId: 3 },
  { TagId: 3, PostId: 3, UserId: 1 },
  { TagId: 4, PostId: 4, UserId: 5 },
  { TagId: 5, PostId: 5, UserId: 6 },
  { TagId: 6, PostId: 6, UserId: 7 },
  { TagId: 7, PostId: 7, UserId: 8 },
  { TagId: 8, PostId: 8, UserId: 9 },
  { TagId: 9, PostId: 9, UserId: 10 },
  { TagId: 10, PostId: 10, UserId: 1 },
  { TagId: 11, PostId: 11, UserId: 2 },
  { TagId: 12, PostId: 12, UserId: 3 },
  { TagId: 13, PostId: 13, UserId: 4 },
  { TagId: 14, PostId: 14, UserId: 5 },
  { TagId: 15, PostId: 15, UserId: 6 },
];
