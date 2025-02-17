// src/models/PostReport.ts

export interface PostReport {
  PostReportId: number; // Hoặc string nếu bạn dùng UUID
  UserId: number;
  PostId: number;
  ReportType: 1 | 2 | 3 | 4; // Hoặc enum nếu bạn muốn đặt tên ý nghĩa
  Reason: string;
}

export const samplePostReports: PostReport[] = [
  {
    PostReportId: 1,
    UserId: 5,
    PostId: 1,
    ReportType: 1,
    Reason: 'Misleading information.',
  },
  {
    PostReportId: 2,
    UserId: 3,
    PostId: 4,
    ReportType: 2,
    Reason: 'Spam account.',
  },
  {
    PostReportId: 3,
    UserId: 2,
    PostId: 7,
    ReportType: 3,
    Reason: 'Hate speech.',
  },
  {
    PostReportId: 4,
    UserId: 8,
    PostId: 10,
    ReportType: 1,
    Reason: 'Copyright infringement.',
  },
  {
    PostReportId: 5,
    UserId: 9,
    PostId: 12,
    ReportType: 2,
    Reason: 'Harassment.',
  },
];
