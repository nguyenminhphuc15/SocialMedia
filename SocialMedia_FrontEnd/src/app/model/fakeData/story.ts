// src/models/Story.ts

export interface Story {
  StoryId: number;
  UserId: number;
  MediaType: 'IMAGE' | 'VIDEO';
  MediaUrl: string;
  CreatedAt?: Date;
  ExpiresAt?: Date;
  ViewCount?: number;
  IsActive?: boolean;
}

export const sampleStories: Story[] = [
  {
    StoryId: 1,
    UserId: 1,
    MediaType: 'IMAGE',
    MediaUrl: 'story_1_1.jpg',
    ExpiresAt: new Date('2024-01-02T10:00:00'),
  },
  {
    StoryId: 2,
    UserId: 2,
    MediaType: 'VIDEO',
    MediaUrl: 'story_2_1.mp4',
    ExpiresAt: new Date('2024-01-02T11:00:00'),
  },
  {
    StoryId: 3,
    UserId: 3,
    MediaType: 'IMAGE',
    MediaUrl: 'story_3_1.jpg',
    ExpiresAt: new Date('2024-01-02T12:00:00'),
  },
  {
    StoryId: 4,
    UserId: 4,
    MediaType: 'VIDEO',
    MediaUrl: 'story_4_1.mp4',
    ExpiresAt: new Date('2024-01-02T13:00:00'),
  },
  {
    StoryId: 5,
    UserId: 5,
    MediaType: 'IMAGE',
    MediaUrl: 'story_5_1.jpg',
    ExpiresAt: new Date('2024-01-02T14:00:00'),
  },
  {
    StoryId: 6,
    UserId: 6,
    MediaType: 'VIDEO',
    MediaUrl: 'story_6_1.mp4',
    ExpiresAt: new Date('2024-01-02T15:00:00'),
  },
  {
    StoryId: 7,
    UserId: 7,
    MediaType: 'IMAGE',
    MediaUrl: 'story_7_1.jpg',
    ExpiresAt: new Date('2024-01-02T16:00:00'),
  },
  {
    StoryId: 8,
    UserId: 8,
    MediaType: 'VIDEO',
    MediaUrl: 'story_8_1.mp4',
    ExpiresAt: new Date('2024-01-02T17:00:00'),
  },
  {
    StoryId: 9,
    UserId: 9,
    MediaType: 'IMAGE',
    MediaUrl: 'story_9_1.jpg',
    ExpiresAt: new Date('2024-01-02T18:00:00'),
  },
  {
    StoryId: 10,
    UserId: 10,
    MediaType: 'VIDEO',
    MediaUrl: 'story_10_1.mp4',
    ExpiresAt: new Date('2024-01-02T19:00:00'),
  },
  {
    StoryId: 11,
    UserId: 1,
    MediaType: 'IMAGE',
    MediaUrl: 'story_1_2.jpg',
    ExpiresAt: new Date('2024-01-02T20:00:00'),
  },
  {
    StoryId: 12,
    UserId: 2,
    MediaType: 'VIDEO',
    MediaUrl: 'story_2_2.mp4',
    ExpiresAt: new Date('2024-01-02T21:00:00'),
  },
  {
    StoryId: 13,
    UserId: 3,
    MediaType: 'IMAGE',
    MediaUrl: 'story_3_2.jpg',
    ExpiresAt: new Date('2024-01-02T22:00:00'),
  },
  {
    StoryId: 14,
    UserId: 4,
    MediaType: 'VIDEO',
    MediaUrl: 'story_4_2.mp4',
    ExpiresAt: new Date('2024-01-02T23:00:00'),
  },
  {
    StoryId: 15,
    UserId: 5,
    MediaType: 'IMAGE',
    MediaUrl: 'story_5_2.jpg',
    ExpiresAt: new Date('2024-01-03T00:00:00'),
  },
  {
    StoryId: 16,
    UserId: 6,
    MediaType: 'VIDEO',
    MediaUrl: 'story_6_2.mp4',
    ExpiresAt: new Date('2024-01-03T01:00:00'),
  },
  {
    StoryId: 17,
    UserId: 7,
    MediaType: 'IMAGE',
    MediaUrl: 'story_7_2.jpg',
    ExpiresAt: new Date('2024-01-03T02:00:00'),
  },
  {
    StoryId: 18,
    UserId: 8,
    MediaType: 'VIDEO',
    MediaUrl: 'story_8_2.mp4',
    ExpiresAt: new Date('2024-01-03T03:00:00'),
  },
  {
    StoryId: 19,
    UserId: 9,
    MediaType: 'IMAGE',
    MediaUrl: 'story_9_2.jpg',
    ExpiresAt: new Date('2024-01-03T04:00:00'),
  },
  {
    StoryId: 20,
    UserId: 10,
    MediaType: 'VIDEO',
    MediaUrl: 'story_10_2.mp4',
    ExpiresAt: new Date('2024-01-03T05:00:00'),
  },
];
