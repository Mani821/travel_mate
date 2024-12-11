class AppData {
  AppData();


  static String getOnboardingHeading(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return "Let's Travel Together";
      case 1:
        return 'Plan Your Perfect Trip';
      case 2:
        return 'Connect with Fellow Travelers';
      case 3:
        return 'Travel Smart & Safe';
      default:
        return "Let's Travel Together";
    }
  }

  static String getOnboardingText(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return 'Your perfect travel companion for unforgettable adventures and seamless journeys. Never explore alone again!';
      case 1:
        return 'Create detailed itineraries, discover hidden gems, and get personalized recommendations for your dream destination.';
      case 2:
        return 'Join a global community of explorers. Share experiences, tips, and make new friends along the way.';
      case 3:
        return 'Access real-time updates, emergency contacts, and local insights to ensure worry-free adventures anywhere in the world.';
      default:
        return 'Your perfect travel companion for unforgettable adventures and seamless journeys. Never explore alone again!';
    }
  }
}
