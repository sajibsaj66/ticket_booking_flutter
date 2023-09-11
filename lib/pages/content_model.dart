class UnbordingContent {
  String image;
  String title;

  UnbordingContent({required this.image, required this.title});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'Book your ticket from home!',
    image: 'assets/book.png',
  ),
  UnbordingContent(
    title: 'You can choose your preferable seats',
    image: 'assets/seat.png',
  ),
  UnbordingContent(
    title: 'Welcome to Ticket Booking App',
    image: 'assets/welcome.png',
  ),
];
