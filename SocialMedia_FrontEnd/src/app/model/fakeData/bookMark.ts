// src/models/Bookmark.ts

export interface Bookmark {
  BookmarkId: number; // Hoặc string nếu bạn dùng UUID
  UserId: number;
  PostId: number;
}

export const sampleBookmarks: Bookmark[] = [
  { BookmarkId: 1, UserId: 1, PostId: 3 },
  { BookmarkId: 2, UserId: 2, PostId: 4 },
  { BookmarkId: 3, UserId: 3, PostId: 5 },
  { BookmarkId: 4, UserId: 4, PostId: 6 },
  { BookmarkId: 5, UserId: 5, PostId: 7 },
  { BookmarkId: 6, UserId: 6, PostId: 8 },
  { BookmarkId: 7, UserId: 7, PostId: 9 },
  { BookmarkId: 8, UserId: 8, PostId: 10 },
  { BookmarkId: 9, UserId: 9, PostId: 11 },
  { BookmarkId: 10, UserId: 10, PostId: 12 },
  { BookmarkId: 11, UserId: 1, PostId: 13 },
  { BookmarkId: 12, UserId: 2, PostId: 14 },
  { BookmarkId: 13, UserId: 3, PostId: 15 },
  { BookmarkId: 14, UserId: 4, PostId: 1 },
  { BookmarkId: 15, UserId: 5, PostId: 2 },
];
