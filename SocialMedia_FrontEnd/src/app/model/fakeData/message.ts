// src/models/Message.ts

export interface Message {
  message_id: number; // Hoặc string nếu bạn dùng UUID
  conversation_id: number;
  sender_id: number;
  content: string;
  message_type: 'text' | 'image' | 'video' | 'audio'; // Thêm các loại message khác
  timestamp?: Date; // Thêm timestamp
}

export const sampleMessages: Message[] = [
  {
    message_id: 1,
    conversation_id: 1,
    sender_id: 1,
    content: 'Hey Jane, how are you?',
    message_type: 'text',
  },
  {
    message_id: 2,
    conversation_id: 1,
    sender_id: 2,
    content: "Hi John, I'm doing well!",
    message_type: 'text',
  },
  {
    message_id: 3,
    conversation_id: 2,
    sender_id: 3,
    content: 'Anyone working on the project tonight?',
    message_type: 'text',
  },
  {
    message_id: 4,
    conversation_id: 3,
    sender_id: 6,
    content: "Hey Michael, what's up?",
    message_type: 'text',
  },
  {
    message_id: 5,
    conversation_id: 3,
    sender_id: 7,
    content: 'Hi Sarah, not much!',
    message_type: 'text',
  },
  {
    message_id: 6,
    conversation_id: 4,
    sender_id: 8,
    content: 'Ready for a workout tomorrow?',
    message_type: 'text',
  },
];
