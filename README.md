# 100 Games with Godot — 01: Pong

Dự án này là game đầu tiên trong series “100 game từ dễ đến khó” để học Godot Engine và làm game. Mục tiêu: nhanh, gọn, hoàn chỉnh tối thiểu (MVP), dễ mở rộng ở các phiên bản sau.

## Tổng quan
- Godot: 4.x (project hiện dùng 4.5 theo cấu hình).
- Thể loại: Pong cổ điển, góc nhìn dọc (AI ở trên, người chơi ở dưới).
- Điểm số: khi bóng vượt qua vạch goal của đối phương, điểm tương ứng tăng và bóng được reset về giữa.

## Điều khiển
- Người chơi: phím `A` (trái) và `D` (phải).
- AI: thanh trên tự đuổi bóng với độ khó vừa phải.

## Chạy dự án
- Cách 1 (khuyên dùng): mở Godot Editor và chọn file project.godot.
- Cách 2 (CLI): nếu đã thêm Godot vào PATH:

```powershell
# Mở project bằng Godot 4
godot4 --path .

# Hoặc chỉ định đường dẫn Godot.exe (ví dụ)
"C:\\Program Files\\Godot\\Godot_v4.x\\Godot.exe" --path .
```

## Cấu trúc chính
- Cảnh: scenes/main.tscn
- Script: 
  - Bóng: scripts/ball.gd
  - Vợt người chơi: scripts/play_paddle.gd
  - Vợt máy (AI): scripts/enemy_paddle.gd
  - Quản lý chính: scripts/main.gd

## Ghi chú kỹ thuật
- Input Map đã khai báo `A` và `D` trong project.godot để đọc bằng `Input.get_action_strength()`.
- Vật lý: bóng dùng `CharacterBody2D` với `move_and_collide()` và phản xạ theo góc chạm vợt; biên trái/phải là tường tĩnh; goal trên/dưới là `Area2D` bắt sự kiện.
- .gitignore: tối ưu cho Godot + VS Code + xuất bản (exports) trên nhiều hệ điều hành.

## Định hướng mở rộng (các bước sau trong series)
- Thêm âm thanh va chạm/ghi điểm và hiệu ứng.
- Tăng/giảm độ khó AI theo điểm số hoặc thời gian.
- Menu tạm dừng, cài đặt điều khiển, lựa chọn độ khó.
- Ghi best score, thêm 2 người chơi local.

Chúc bạn học vui — game #1 đã sẵn sàng để chơi và làm nền cho các bài tiếp theo!

.