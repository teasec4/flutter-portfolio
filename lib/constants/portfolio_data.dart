import '../models/project.dart';

class PortfolioData {
  // Projects data
  static const List<Project> projects = [
    Project(
      id: 'crypto-desktop-001',
      title: 'Crypto Desktop',
      description: 'A cross-platform application for monitoring and analyzing cryptocurrency data.',
      contribution: 'Full-stack development: architected and implemented a complete cryptocurrency portfolio management application with real-time data analytics, user authentication, and local data persistence.',
      detailedDescription: 'Crypto Desktop is a comprehensive cross-platform Flutter application designed for cryptocurrency enthusiasts and traders. The application provides real-time cryptocurrency price tracking, portfolio management, and advanced analytics visualization. Users can authenticate securely via Supabase, track their cryptocurrency holdings, view detailed charts using FL Chart, and maintain local data through Isar database. The architecture follows Clean Architecture principles with BLoC pattern for state management, ensuring scalability and maintainability.',
      personalNotes: 'This project demonstrates expertise in building professional-grade desktop applications with Flutter. Key learning outcomes include implementing secure authentication flows, managing complex state with BLoC, designing efficient local caching strategies, and creating responsive multi-platform UIs. The project showcases best practices in architecture, separation of concerns, and handling async operations.',
      technologies: [
        'Flutter',
        'Dart 3.9.2+',
        'BLoC',
        'Isar Database',
        'Supabase',
        'Go Router',
        'FL Chart',
        'Clean Architecture',
      ],
      imageUrl: 'assets/images/project1.png',
      githubUrl: 'https://github.com/teasec4/flutter_crypto_desctop',
      liveUrl: null,
      assetPath: 'assets/images/project1.png',
      gifUrl: 'assets/gifs/project1.webp',
    ),
    Project(
      id: 'crypto-async-await',
      title: 'Crypto Tracker - Portfolio Manager (Swift)',
      description: 'iOS app for real-time cryptocurrency tracking and portfolio management with modern Swift architecture.',
      contribution: 'Full-stack development using MVVM architecture, CoinGecko API integration, and Supabase for authentication.',
      detailedDescription: 'Educational iOS application for cryptocurrency market monitoring and personal portfolio management. Features real-time price tracking, portfolio management, price charts, market statistics, secure Supabase authentication, and efficient pagination. Built with MVVM architecture and Repository Pattern.',
      personalNotes: 'Demonstrates modern Swift best practices: async/await, Protocol-Oriented Design, Dependency Injection, and clean MVVM architecture. Great example of REST API integration and scalable iOS app development.',
      technologies: [
        'Swift 5.9+',
        'SwiftUI',
        'SwiftData',
        'Alamofire',
        'Supabase',
        'CoinGecko API',
        'MVVM',
      ],
      imageUrl: 'assets/images/project2.png',
      githubUrl: 'https://github.com/teasec4/swift-crypto-app',
      liveUrl: null,
      assetPath: 'assets/images/project2.png',
      gifUrl: 'assets/gifs/project2.webp',
    ),
    Project(
      id: 'mactimer-v1',
      title: 'MacTimerV1',
      description: 'A macOS timer application for managing multiple timers with history tracking and statistics.',
      contribution: 'Full-stack SwiftUI development with MVVM architecture, state management, and persistent storage.',
      detailedDescription: 'A native macOS timer app built with SwiftUI and modern Swift practices. Features include creating and managing multiple timers, tracking timer history, viewing usage statistics, and local database storage. Uses MVVM architecture with Dependency Injection for clean code structure.',
      personalNotes: 'Focused on clean architecture, reactive programming with Combine, and efficient state management.',
      technologies: ['SwiftUI', 'Combine', 'MVVM', 'Dependency Injection', 'Swift 5.7+'],
      imageUrl: 'assets/images/project3.png',
      githubUrl: 'https://github.com/teasec4/MacTimerManager',
      liveUrl: null,
      assetPath: 'assets/images/project3.png',
      gifUrl: 'assets/gifs/project3.webp',
    ),
  ];

  // Personal info
  static const String name = 'Max Kovalev';
  static const String shortBio = 'Full-stack developer with international experience. I build modern, cross-platform applications with clean code and scalable architecture.';
  static const String aboutBio = 'I\'m a developer with international experience, building modern applications across platforms. I enjoy writing clean code, quickly mastering new technologies, and finding optimal solutions to complex problems.';

  // About page data
  static const List<String> skills = ['Swift', 'Dart', 'Go', 'Rust', 'TypeScript', 'JavaScript', 'Flutter', 'React', 'SwiftUI'];
  static const String experience = 'Mobile development, API integration, databases, web development, basic DevOps';
  static const String education = 'Studied in Russia and China';
  static const String career = 'Worked in an international trading company before switching to development';

  // Social links
  static const Map<String, String> socialLinks = {
    'github': 'https://github.com/teasec4',
    'x': 'https://x.com/yourusername',
    'telegram': 'https://t.me/yourusername',
    'wechat': 'https://wechat.com/yourusername',
    'email': 'mailto:your.email@example.com',
  };
}
