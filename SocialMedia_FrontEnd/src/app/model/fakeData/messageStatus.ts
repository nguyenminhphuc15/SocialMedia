// src/models/MessageStatus.ts

export interface MessageStatus {
  message_status_id: number; // Hoặc string nếu bạn dùng UUID
  message_id: number;
  user_id: number;
  is_read: boolean;
  is_pinned: boolean;
}

export const sampleMessageStatuses: MessageStatus[] = [
  {
    message_status_id: 1,
    message_id: 1,
    user_id: 2,
    is_read: true,
    is_pinned: false,
  },
  {
    message_status_id: 2,
    message_id: 2,
    user_id: 1,
    is_read: true,
    is_pinned: true,
  },
  {
    message_status_id: 3,
    message_id: 3,
    user_id: 4,
    is_read: false,
    is_pinned: false,
  },
  {
    message_status_id: 4,
    message_id: 4,
    user_id: 7,
    is_read: true,
    is_pinned: false,
  },
  {
    message_status_id: 5,
    message_id: 5,
    user_id: 6,
    is_read: false,
    is_pinned: true,
  },
];
