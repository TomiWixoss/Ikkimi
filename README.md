# 🎌 Ikkimi - Modern Anime Streaming App

> Ứng dụng xem anime miễn phí với kiến trúc hiện đại, được xây dựng bằng Flutter + Riverpod + Clean Architecture (2026 Standard)

[![Flutter](https://img.shields.io/badge/Flutter-3.8.1-02569B?logo=flutter)](https://flutter.dev)
[![Riverpod](https://img.shields.io/badge/Riverpod-2.6.1-purple)](https://riverpod.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-blue.svg)](https://github.com/tomisakae/ikkimi)

## ✨ Tính năng

### 🎬 Xem Anime
- [x] Scraping từ nhiều nguồn anime
- [x] Xem anime qua WebView player
- [x] Hỗ trợ nhiều chất lượng video
- [x] Tự động lưu lịch sử xem
- [x] Tiếp tục xem từ vị trí đã dừng

### 📚 Quản lý
- [x] Thêm anime vào danh sách yêu thích
- [x] Theo dõi anime đang xem
- [x] Đánh dấu tập đã xem
- [x] Tìm kiếm anime nhanh chóng
- [x] Lọc theo thể loại, năm phát hành

### 💾 Backup & Restore
- [x] Export/Import dữ liệu
- [x] Backup tự động
- [x] Đồng bộ qua file

### 🔄 Auto Update
- [x] Tự động kiểm tra phiên bản mới
- [x] Download & cài đặt APK từ GitHub
- [x] Thông báo khi có bản cập nhật

### 🎨 Giao diện
- [x] Material Design 3
- [x] Dark/Light theme
- [x] Responsive UI
- [x] Skeleton loading
- [x] Smooth animations

## 🏗️ Kiến trúc - Clean Architecture + Riverpod (2026 Standard)

### 📐 Tại sao Clean Architecture?

Dự án này sử dụng **Clean Architecture + Riverpod**, được đánh giá là kiến trúc tốt nhất cho Flutter apps năm 2026 theo [Foresight Mobile Research](https://foresightmobile.com/blog/whats-the-best-state-management-library-for-flutter).

**Ưu điểm:**
- ✅ **Compile-time safety** - Phát hiện lỗi ngay khi code
- ✅ **Testability** - Dễ dàng viết unit tests
- ✅ **Scalability** - Dễ mở rộng khi dự án lớn
- ✅ **Maintainability** - Code sạch, dễ maintain
- ✅ **Future-proof** - Chuẩn mới nhất 2026

### 🗂️ Cấu trúc thư mục

```
lib/
├── core/                           # Core functionality
│   ├── models/                     # Domain models (Anime, Episode)
│   ├── providers/                  # Global providers (DI)
│   └── router/                     # GoRouter configuration
│
├── features/                       # Feature-first architecture
│   ├── home/
│   │   ├── data/
│   │   │   └── repositories/       # Repository implementation
│   │   ├── domain/
│   │   │   └── repositories/       # Repository interface
│   │   └── presentation/
│   │       ├── pages/              # UI screens
│   │       ├── providers/          # Riverpod providers
│   │       └── widgets/            # Reusable widgets
│   │
│   ├── anime_detail/               # Anime detail feature
│   ├── watch/                      # Video player feature
│   ├── search/                     # Search feature
│   ├── library/                    # Library feature
│   ├── history/                    # History feature
│   └── settings/                   # Settings feature
│
└── main.dart                       # App entry point
```

### 🔄 Data Flow (Clean Architecture)

```
UI (Presentation) 
    ↓ watches
Provider (Riverpod)
    ↓ calls
Repository Interface (Domain)
    ↓ implements
Repository Implementation (Data)
    ↓ fetches from
API / Database
```

### 🎯 Layers Explained

#### 1️⃣ **Presentation Layer** (`presentation/`)
- UI components (Pages, Widgets)
- Riverpod Providers
- State management
- **Không chứa business logic**

#### 2️⃣ **Domain Layer** (`domain/`)
- Business models (Anime, Episode)
- Repository interfaces
- Use cases (nếu cần)
- **Không phụ thuộc vào framework**

#### 3️⃣ **Data Layer** (`data/`)
- Repository implementations
- API services
- Database operations
- **Implement interfaces từ Domain**

## 🛠️ Tech Stack

### Core Framework
- **Flutter 3.8.1** - Cross-platform UI framework
- **Dart 3.8.1** - Programming language

### State Management & Architecture (2026 Standard)
- **Riverpod 2.6.1** - State management với compile-time safety
- **GoRouter 14.6.2** - Declarative routing
- **Clean Architecture** - Separation of concerns

### UI Components
- **Skeletonizer 2.1.2** - Modern loading skeleton
- **Cached Network Image 3.4.1** - Image caching
- **Extended Image 10.0.1** - Advanced image handling
- **Carousel Slider Plus 7.0.1** - Image carousel
- **Easy Refresh 3.4.0** - Pull to refresh
- **Flutter Staggered Grid View 0.7.0** - Grid layouts

### Network & Scraping
- **Dio 5.7.0** - HTTP client
- **HTML 0.15.4** - HTML parser
- **WebView Flutter 4.10.0** - Embedded web player

### Database
- **Isar 3.1.0+1** - Fast NoSQL database

### Features
- **File Picker 10.3.10** - File selection
- **Archive 4.0.7** - Backup compression
- **Upgrader 12.5.0** - Auto update checker
- **Flutter Downloader 1.11.10** - APK downloader
- **Permission Handler 12.0.1** - Runtime permissions

## 🚀 Cài đặt

### Yêu cầu
- Flutter SDK 3.8.1 trở lên
- Dart SDK 3.8.1 trở lên
- Android Studio / VS Code
- Android SDK (cho Android)
- Xcode (cho iOS)

### Clone & Setup

```bash
# Clone repository
git clone https://github.com/tomisakae/ikkimi.git
cd ikkimi

# Cài đặt dependencies
flutter pub get

# Chạy app
flutter run
```

### Build APK

```bash
# Build APK release
flutter build apk --release

# Build APK split per ABI (giảm kích thước)
flutter build apk --split-per-abi --release
```

## 📖 Hướng dẫn phát triển

### Thêm feature mới

1. **Tạo cấu trúc thư mục:**
```
lib/features/new_feature/
├── data/
│   └── repositories/
├── domain/
│   └── repositories/
└── presentation/
    ├── pages/
    ├── providers/
    └── widgets/
```

2. **Tạo Repository Interface (Domain):**
```dart
// lib/features/new_feature/domain/repositories/feature_repository.dart
abstract class FeatureRepository {
  Future<Data> getData();
}
```

3. **Implement Repository (Data):**
```dart
// lib/features/new_feature/data/repositories/feature_repository_impl.dart
class FeatureRepositoryImpl implements FeatureRepository {
  @override
  Future<Data> getData() async {
    // Implementation
  }
}
```

4. **Tạo Provider (Presentation):**
```dart
// lib/features/new_feature/presentation/providers/feature_provider.dart
final featureProvider = FutureProvider<Data>((ref) async {
  final repository = ref.watch(featureRepositoryProvider);
  return repository.getData();
});
```

5. **Sử dụng trong UI:**
```dart
class FeaturePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(featureProvider);
    
    return data.when(
      data: (value) => Text(value.toString()),
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
```

### Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test
flutter test test/features/home/home_test.dart
```

## 🤝 Đóng góp

Mọi đóng góp đều được chào đón! Vui lòng:

1. Fork repository
2. Tạo branch mới (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Tạo Pull Request

## 📝 License

Dự án này được phân phối dưới giấy phép MIT. Xem file [LICENSE](LICENSE) để biết thêm chi tiết.

## ⚠️ Disclaimer

Ứng dụng này chỉ phục vụ mục đích học tập và nghiên cứu. Người dùng tự chịu trách nhiệm về việc sử dụng ứng dụng và nội dung được truy cập thông qua ứng dụng.

## 🙏 Credits

- Inspired by [Tachiyomi](https://github.com/tachiyomiorg/tachiyomi)
- Architecture based on [Foresight Mobile - Flutter State Management 2026](https://foresightmobile.com/blog/whats-the-best-state-management-library-for-flutter)
- Icons by [Iconsax](https://iconsax.io/)

## 📧 Liên hệ

- GitHub: [@tomisakae](https://github.com/tomisakae)
- Package: `com.tomisakae.ikkimi`

---

Made with ❤️ using Flutter + Riverpod + Clean Architecture

**Architecture:** Clean Architecture + Riverpod (2026 Standard)  
**State Management:** Riverpod 2.6.1 (Compile-time safety)  
**Routing:** GoRouter 14.6.2 (Declarative routing)
