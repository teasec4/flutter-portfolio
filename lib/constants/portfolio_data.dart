import '../models/project.dart';

class PortfolioData {
  // Projects data
  static const List<Project> projects = [
    Project(
      id: 'crypto-portfolio-tracker-swift',
      title: 'Crypto Portfolio Tracker (Swift)',
      description: 'iOS application for tracking a cryptocurrency portfolio',
      detailedDescription: 'A modern iOS application built with Swift and SwiftUI for tracking cryptocurrency portfolios. The app includes three main sections: a market tab displaying all coins with real-time data and dynamic price charts from CoinGecko API; an assets tab where users can add their holdings, track total portfolio value, and monitor profit/loss; and a profile tab (in development) with Supabase login and account management. Focused on clean design, smooth animations, and responsive data updates.',
      contribution: 'Designed the entire UI/UX, implemented state management with Riverpod, and integrated Stripe payments.',
      personalNotes: 'This was my first major Flutter project where I learned the importance of proper state management. I solved complex UI challenges with custom animations and implemented secure payment flows. The biggest challenge was handling different payment states and error scenarios gracefully.',
      technologies: ['Swift', 'SwiftUI', 'Alamofire', 'Supabase', 'SwfitData'],
      imageUrl: 'assets/images/project1.png',
      githubUrl: 'https://github.com/teasec4/swift-crypto-app',
      liveUrl: 'https://ecommerce-demo.maxkovalev.dev',
      assetPath: 'assets/images/project1.png',
      gifUrl: 'assets/gifs/project1.gif',
    ),
    Project(
      id: 'crypto-portfolio-tracker-flutter',
      title: 'Crypto Portfolio Tracker (Flutter)',
      description: 'Collaborative productivity platform for teams with real-time synchronization.',
      detailedDescription: 'A collaborative task management application designed for remote teams. Features include real-time task updates, team collaboration tools, deadline tracking, and progress analytics. Built with a focus on user experience and performance.',
      contribution: 'Built the core architecture, implemented real-time collaboration using WebSockets, and designed the user interface.',
      personalNotes: 'Working on this project taught me a lot about real-time communication and conflict resolution in collaborative environments. I implemented WebSocket connections for live updates and created a robust offline-first architecture.',
      technologies: ['Flutter', 'Dart', 'WebSockets', 'SQLite', 'Provider'],
      imageUrl: 'assets/images/project2.png',
      githubUrl: 'https://github.com/maxkovalev/task-manager',
      liveUrl: 'https://taskmanager-demo.maxkovalev.dev',
        assetPath: 'assets/images/project2.png',
      gifUrl: 'assets/gifs/project1.gif',
    ),
    Project(
      id: 'weather-dashboard',
      title: 'Weather Dashboard',
      description: 'Beautiful weather app with interactive maps and detailed analytics.',
      detailedDescription: 'An elegant weather application featuring interactive maps, detailed weather analytics, and location-based forecasts. Includes weather radar, historical data visualization, and personalized weather alerts.',
      contribution: 'Created the visual design, implemented location services, and optimized performance for smooth map interactions.',
      personalNotes: 'This project challenged me to work with complex map integrations and handle location permissions properly. I learned about performance optimization for map rendering and implemented efficient data caching strategies.',
      technologies: ['Flutter', 'Dart', 'REST API', 'Google Maps', 'Geolocation'],
      imageUrl: 'assets/images/project3.png',
      githubUrl: 'https://github.com/maxkovalev/weather-app',
      liveUrl: 'https://weather-demo.maxkovalev.dev',
        assetPath: 'assets/images/project3.png',
      gifUrl: 'assets/gifs/project1.gif',
    ),
  ];

  // Personal info
  static const String name = 'Max Kovalev';
  static const String shortBio = 'Passionate Flutter developer with 3+ years of experience building beautiful, scalable mobile and web applications. I focus on clean architecture, exceptional user experiences, and staying at the forefront of Flutter innovation.';

  // About page data
  static const List<String> skills = ['Swift', 'Dart', 'TypeScript'];
  static const String experience = 'Mobile development, QA testing';
  static const String education = 'Studied in Russia and China';
  static const String career = 'Worked in an international trading company before switching to development';
}
