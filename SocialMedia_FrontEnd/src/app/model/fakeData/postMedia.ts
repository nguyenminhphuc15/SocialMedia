// src/models/PostMedia.ts

export interface PostMedia {
  PostMediaId: number; // Hoặc string nếu bạn dùng UUID
  PostId: number;
  MediaUrl: string;
  MediaType: 'IMAGE' | 'VIDEO';
}

export const samplePostMedia: PostMedia[] = [
  {
    PostMediaId: 1,
    PostId: 1,
    MediaUrl: 'eiffel_tower.jpg',
    MediaType: 'IMAGE',
  },
  {
    PostMediaId: 2,
    PostId: 2,
    MediaUrl: 'workout_selfie.jpg',
    MediaType: 'IMAGE',
  },
  {
    PostMediaId: 3,
    PostId: 3,
    MediaUrl: 'game_screenshot.jpg',
    MediaType: 'IMAGE',
  },
  {
    PostMediaId: 4,
    PostId: 4,
    MediaUrl: 'book_on_table.jpg',
    MediaType: 'IMAGE',
  },
  {
    PostMediaId: 5,
    PostId: 5,
    MediaUrl: 'brunch_table.jpg',
    MediaType: 'IMAGE',
  },
  {
    PostMediaId: 6,
    PostId: 6,
    MediaUrl: 'painting_in_progress.jpg',
    MediaType: 'IMAGE',
  },
  {
    PostMediaId: 7,
    PostId: 7,
    MediaUrl: 'guitar_practice.mp4',
    MediaType: 'VIDEO',
  },
  {
    PostMediaId: 8,
    PostId: 8,
    MediaUrl: 'rome_street.jpg',
    MediaType: 'IMAGE',
  },
  {
    PostMediaId: 9,
    PostId: 9,
    MediaUrl: 'market_analysis.jpg',
    MediaType: 'IMAGE',
  },
  {
    PostMediaId: 10,
    PostId: 10,
    MediaUrl: 'history_lesson.jpg',
    MediaType: 'IMAGE',
  },
  {
    PostMediaId: 11,
    PostId: 11,
    MediaUrl: 'coffee_cup.jpg',
    MediaType: 'IMAGE',
  },
  {
    PostMediaId: 12,
    PostId: 12,
    MediaUrl: 'leg_day_weights.jpg',
    MediaType: 'IMAGE',
  },
  {
    PostMediaId: 13,
    PostId: 13,
    MediaUrl: 'debugging_code.jpg',
    MediaType: 'IMAGE',
  },
  {
    PostMediaId: 14,
    PostId: 14,
    MediaUrl: 'rainy_day_book.jpg',
    MediaType: 'IMAGE',
  },
  {
    PostMediaId: 15,
    PostId: 15,
    MediaUrl: 'homemade_pizza.jpg',
    MediaType: 'IMAGE',
  },
];
