import '../models/project.dart';

class PortfolioData {
  // Projects data
  static const List<Project> projects = [
    Project(
      id: 'ecommerce-app',
      title: 'E-Commerce App',
      description: 'Full-featured shopping experience with seamless checkout and order tracking.',
      detailedDescription: 'A comprehensive e-commerce mobile application built with Flutter, featuring a modern UI design, secure payment integration, and real-time order tracking. The app includes product catalog browsing, shopping cart functionality, user authentication, and order management.',
      contribution: 'Designed the entire UI/UX, implemented state management with Riverpod, and integrated Stripe payments.',
      personalNotes: 'This was my first major Flutter project where I learned the importance of proper state management. I solved complex UI challenges with custom animations and implemented secure payment flows. The biggest challenge was handling different payment states and error scenarios gracefully.',
      technologies: ['Flutter', 'Dart', 'Riverpod', 'Firebase', 'Stripe API'],
      imageUrl: 'assets/images/project1.png',
      githubUrl: 'https://github.com/maxkovalev/ecommerce-app',
      liveUrl: 'https://ecommerce-demo.maxkovalev.dev',
        assetPath: 'assets/images/project1.png',
        gifUrl: 'assets/gifs/project1.gif',
    ),
    Project(
      id: 'task-manager',
      title: 'Task Management Tool',
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
    Project(
      id: 'social-platform',
      title: 'Social Media Platform',
      description: 'Modern social platform with messaging, posts, and community features.',
      detailedDescription: 'A modern social media platform featuring real-time messaging, community posts, user profiles, and interactive features. Built with scalability in mind and includes advanced features like live notifications and content moderation.',
      contribution: 'Developed the entire frontend, implemented real-time messaging, and designed the scalable architecture.',
      personalNotes: 'Building this platform taught me about scalable architecture and real-time features. I implemented Firebase Cloud Messaging for notifications and created a modular architecture that could handle growing user bases.',
      technologies: ['Flutter', 'Dart', 'Firebase', 'WebSockets', 'Cloud Firestore'],
      imageUrl: 'assets/images/project4.png',
      githubUrl: 'https://github.com/maxkovalev/social-app',
      liveUrl: 'https://social-demo.maxkovalev.dev',
        assetPath: 'assets/images/project4.png',
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
