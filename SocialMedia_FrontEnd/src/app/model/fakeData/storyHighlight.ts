// src/models/StoryHighlight.ts

export interface StoryHighlight {
  StoryHighlightId: number;
  UserId: number;
  Title: string;
  CoverImage?: string;
  CreatedAt?: Date;
  UpdatedAt?: Date;
}

export const sampleStoryHighlights: StoryHighlight[] = [
  {
    StoryHighlightId: 1,
    UserId: 1,
    Title: 'Paris Trip',
    CoverImage: 'paris_cover.jpg',
  },
  {
    StoryHighlightId: 2,
    UserId: 2,
    Title: 'Workout Routine',
    CoverImage: 'workout_cover.jpg',
  },
  {
    StoryHighlightId: 3,
    UserId: 3,
    Title: 'Coding Projects',
    CoverImage: 'coding_cover.jpg',
  },
  {
    StoryHighlightId: 4,
    UserId: 4,
    Title: 'Favorite Books',
    CoverImage: 'books_cover.jpg',
  },
  {
    StoryHighlightId: 5,
    UserId: 5,
    Title: 'Brunch Spots',
    CoverImage: 'brunch_cover.jpg',
  },
  {
    StoryHighlightId: 6,
    UserId: 6,
    Title: 'Art Collection',
    CoverImage: 'art_cover.jpg',
  },
  {
    StoryHighlightId: 7,
    UserId: 7,
    Title: 'Guitar Practice',
    CoverImage: 'guitar_cover.jpg',
  },
  {
    StoryHighlightId: 8,
    UserId: 8,
    Title: 'Rome Adventure',
    CoverImage: 'rome_cover.jpg',
  },
  {
    StoryHighlightId: 9,
    UserId: 9,
    Title: 'Investing Tips',
    CoverImage: 'investing_cover.jpg',
  },
  {
    StoryHighlightId: 10,
    UserId: 10,
    Title: 'History Lessons',
    CoverImage: 'history_cover.jpg',
  },
  {
    StoryHighlightId: 11,
    UserId: 1,
    Title: 'Travel Memories',
    CoverImage: 'travel_cover.jpg',
  },
  {
    StoryHighlightId: 12,
    UserId: 2,
    Title: 'Fitness Goals',
    CoverImage: 'fitness_cover.jpg',
  },
  {
    StoryHighlightId: 13,
    UserId: 3,
    Title: 'Web Development',
    CoverImage: 'webdev_cover.jpg',
  },
  {
    StoryHighlightId: 14,
    UserId: 4,
    Title: 'Book Recommendations',
    CoverImage: 'bookrecs_cover.jpg',
  },
  {
    StoryHighlightId: 15,
    UserId: 5,
    Title: 'Food Adventures',
    CoverImage: 'food_cover.jpg',
  },
  {
    StoryHighlightId: 16,
    UserId: 6,
    Title: 'Digital Art',
    CoverImage: 'digitalart_cover.jpg',
  },
  {
    StoryHighlightId: 17,
    UserId: 7,
    Title: 'Acoustic Covers',
    CoverImage: 'acoustic_cover.jpg',
  },
  {
    StoryHighlightId: 18,
    UserId: 8,
    Title: 'European Travels',
    CoverImage: 'europe_cover.jpg',
  },
  {
    StoryHighlightId: 19,
    UserId: 9,
    Title: 'Financial Growth',
    CoverImage: 'financialgrowth_cover.jpg',
  },
  {
    StoryHighlightId: 20,
    UserId: 10,
    Title: 'Ancient Civilizations',
    CoverImage: 'ancientciv_cover.jpg',
  },
];
