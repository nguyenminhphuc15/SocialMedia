// src/models/ConversationMember.ts

export interface ConversationMember {
  conversation_member_id: number; // Hoặc string nếu bạn dùng UUID
  conversation_id: number;
  user_id: number;
  is_admin: boolean;
}

export const sampleConversationMembers: ConversationMember[] = [
  {
    conversation_member_id: 1,
    conversation_id: 1,
    user_id: 1,
    is_admin: false,
  },
  {
    conversation_member_id: 2,
    conversation_id: 1,
    user_id: 2,
    is_admin: false,
  },
  { conversation_member_id: 3, conversation_id: 2, user_id: 3, is_admin: true },
  {
    conversation_member_id: 4,
    conversation_id: 2,
    user_id: 4,
    is_admin: false,
  },
  {
    conversation_member_id: 5,
    conversation_id: 2,
    user_id: 5,
    is_admin: false,
  },
  {
    conversation_member_id: 6,
    conversation_id: 3,
    user_id: 6,
    is_admin: false,
  },
  {
    conversation_member_id: 7,
    conversation_id: 3,
    user_id: 7,
    is_admin: false,
  },
  { conversation_member_id: 8, conversation_id: 4, user_id: 8, is_admin: true },
  {
    conversation_member_id: 9,
    conversation_id: 4,
    user_id: 9,
    is_admin: false,
  },
  {
    conversation_member_id: 10,
    conversation_id: 4,
    user_id: 10,
    is_admin: false,
  },
];
