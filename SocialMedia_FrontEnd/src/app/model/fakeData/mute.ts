// src/models/Mute.ts

export interface Mute {
  MuteId: number; // Hoặc string nếu bạn dùng UUID
  UserId: number;
  MutedId: number;
  MuteType: 'post' | 'story' | 'both';
}

export const sampleMutes: Mute[] = [
  { MuteId: 1, UserId: 1, MutedId: 4, MuteType: 'post' },
  { MuteId: 2, UserId: 2, MutedId: 5, MuteType: 'story' },
  { MuteId: 3, UserId: 3, MutedId: 6, MuteType: 'both' },
  { MuteId: 4, UserId: 4, MutedId: 7, MuteType: 'post' },
  { MuteId: 5, UserId: 5, MutedId: 8, MuteType: 'story' },
  { MuteId: 6, UserId: 6, MutedId: 9, MuteType: 'both' },
  { MuteId: 7, UserId: 7, MutedId: 10, MuteType: 'post' },
  { MuteId: 8, UserId: 8, MutedId: 1, MuteType: 'story' },
  { MuteId: 9, UserId: 9, MutedId: 2, MuteType: 'both' },
  { MuteId: 10, UserId: 10, MutedId: 3, MuteType: 'post' },
];
