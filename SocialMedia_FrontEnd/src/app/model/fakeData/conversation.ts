// src/models/Conversation.ts

export interface Conversation {
  conversation_id: number; // Hoặc string nếu bạn dùng UUID
  is_group: boolean;
  group_name?: string | null;
  group_avatar?: string | null;
}

export const sampleConversations: Conversation[] = [
  { conversation_id: 1, is_group: false, group_name: null, group_avatar: null },
  {
    conversation_id: 2,
    is_group: true,
    group_name: 'Coding Group',
    group_avatar: 'coding_group.jpg',
  },
  { conversation_id: 3, is_group: false, group_name: null, group_avatar: null },
  {
    conversation_id: 4,
    is_group: true,
    group_name: 'Fitness Friends',
    group_avatar: 'fitness_friends.jpg',
  },
];
