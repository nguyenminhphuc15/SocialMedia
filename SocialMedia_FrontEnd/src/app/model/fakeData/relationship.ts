// src/models/Relationships.ts

export interface Relationships {
  RelationshipId: number; // Hoặc string nếu bạn dùng UUID
  UserId: number;
  RelatedId: number;
  RelationshipType: 'following' | 'blocked' | 'close_friend';
  IsFavorite: boolean;
}

export const sampleRelationships: Relationships[] = [
  {
    RelationshipId: 1,
    UserId: 1,
    RelatedId: 2,
    RelationshipType: 'following',
    IsFavorite: true,
  },
  {
    RelationshipId: 2,
    UserId: 1,
    RelatedId: 3,
    RelationshipType: 'following',
    IsFavorite: false,
  },
  {
    RelationshipId: 3,
    UserId: 2,
    RelatedId: 1,
    RelationshipType: 'following',
    IsFavorite: true,
  },
  {
    RelationshipId: 4,
    UserId: 3,
    RelatedId: 1,
    RelationshipType: 'following',
    IsFavorite: false,
  },
  {
    RelationshipId: 5,
    UserId: 4,
    RelatedId: 5,
    RelationshipType: 'blocked',
    IsFavorite: false,
  },
  {
    RelationshipId: 6,
    UserId: 5,
    RelatedId: 6,
    RelationshipType: 'following',
    IsFavorite: true,
  },
  {
    RelationshipId: 7,
    UserId: 6,
    RelatedId: 7,
    RelationshipType: 'following',
    IsFavorite: false,
  },
  {
    RelationshipId: 8,
    UserId: 7,
    RelatedId: 8,
    RelationshipType: 'following',
    IsFavorite: true,
  },
  {
    RelationshipId: 9,
    UserId: 8,
    RelatedId: 9,
    RelationshipType: 'following',
    IsFavorite: false,
  },
  {
    RelationshipId: 10,
    UserId: 9,
    RelatedId: 10,
    RelationshipType: 'following',
    IsFavorite: true,
  },
  {
    RelationshipId: 11,
    UserId: 10,
    RelatedId: 1,
    RelationshipType: 'following',
    IsFavorite: false,
  },
  {
    RelationshipId: 12,
    UserId: 2,
    RelatedId: 3,
    RelationshipType: 'close_friend',
    IsFavorite: true,
  },
  {
    RelationshipId: 13,
    UserId: 3,
    RelatedId: 4,
    RelationshipType: 'close_friend',
    IsFavorite: false,
  },
  {
    RelationshipId: 14,
    UserId: 4,
    RelatedId: 5,
    RelationshipType: 'following',
    IsFavorite: true,
  },
  {
    RelationshipId: 15,
    UserId: 5,
    RelatedId: 1,
    RelationshipType: 'following',
    IsFavorite: false,
  },
];
