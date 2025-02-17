// src/models/MessageReaction.ts

export interface MessageReaction {
  message_reaction_id: number; // Hoặc string nếu bạn dùng UUID
  message_id: number;
  user_id: number;
  emoji: string;
}

export const sampleMessageReactions: MessageReaction[] = [
  { message_reaction_id: 1, message_id: 1, user_id: 2, emoji: '👍' },
  { message_reaction_id: 2, message_id: 2, user_id: 1, emoji: '😊' },
  { message_reaction_id: 3, message_id: 3, user_id: 4, emoji: '🤔' },
  { message_reaction_id: 4, message_id: 4, user_id: 7, emoji: '👋' },
  { message_reaction_id: 5, message_id: 5, user_id: 6, emoji: '😄' },
];
