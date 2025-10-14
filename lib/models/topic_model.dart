// lib/models/topic_model.dart
class TopicModel {
  final String id;
  final String title;
  final String imagePath;
  final List<String> imageCollection;

  const TopicModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.imageCollection,
  });
}

// Topic data constants
class TopicData {
  static final List<TopicModel> topics = [
    TopicModel(
      id: 'anime',
      title: 'Anime',
      imagePath: 'assets/images/topics/animeCover.png',
      imageCollection: [
        'assets/images/collections/anime/anime_1.png',
        'assets/images/collections/anime/anime_2.png',
        'assets/images/collections/anime/anime_3.png',
        'assets/images/collections/anime/anime_4.png',
        'assets/images/collections/anime/anime_5.png',
        'assets/images/collections/anime/anime_6.png',
        'assets/images/collections/anime/anime_7.png',
        'assets/images/collections/anime/anime_8.png',
        'assets/images/collections/anime/anime_9.png',
        'assets/images/collections/anime/anime_10.png',
        'assets/images/collections/anime/anime_11.png',
        'assets/images/collections/anime/anime_12.png',
        'assets/images/collections/anime/anime_13.png',
      ],
    ),
    TopicModel(
      id: 'cartoon',
      title: 'Cartoon',
      imagePath: 'assets/images/topics/cartoonCover.png',
      imageCollection: [
        'assets/images/collections/cartoon/cartoon1.png',
        'assets/images/collections/cartoon/cartoon2.png',
        'assets/images/collections/cartoon/cartoon3.png',
        'assets/images/collections/cartoon/cartoon4.png',
        'assets/images/collections/cartoon/cartoon5.png',
        'assets/images/collections/cartoon/cartoon6.png',
        'assets/images/collections/cartoon/cartoon7.png',
        'assets/images/collections/cartoon/cartoon9.png',
        'assets/images/collections/cartoon/cartoon10.png',
        'assets/images/collections/cartoon/cartoon11.png',
        'assets/images/collections/cartoon/cartoon12.png',
        'assets/images/collections/cartoon/cartoon13.png',
        'assets/images/collections/cartoon/cartoon14.png',
        'assets/images/collections/cartoon/cartoon15.png',
      ],
    ),
    TopicModel(
      id: 'cute',
      title: 'Cute',
      imagePath: 'assets/images/topics/cuteCover.png',
      imageCollection: [
        'assets/images/collections/cute/cuteanimals1.png',
        'assets/images/collections/cute/cuteanimals2.png',
        'assets/images/collections/cute/cuteanimals3.png',
        'assets/images/collections/cute/cuteanimals4.png',
        'assets/images/collections/cute/cuteanimals5.png',
        'assets/images/collections/cute/cuteanimals6.png',
        'assets/images/collections/cute/cuteanimals7.png',
        'assets/images/collections/cute/cuteanimals8.png',
        'assets/images/collections/cute/cuteanimals9.png',
        'assets/images/collections/cute/cuteanimals10.png',
        'assets/images/collections/cute/cuteanimals11.png',
        'assets/images/collections/cute/cuteanimals12.png',
        'assets/images/collections/cute/cuteanimals13.png',
        'assets/images/collections/cute/cuteanimals14.png',
        'assets/images/collections/cute/cuteanimals15.png',
        'assets/images/collections/cute/cuteanimals16.png',
        'assets/images/collections/cute/cuteanimals17.png',
      ],
    ),
    TopicModel(
      id: 'animal',
      title: 'Animal',
      imagePath: 'assets/images/topics/animalCover.png',
      imageCollection: [
        'assets/images/collections/animal/animal1.png',
        'assets/images/collections/animal/animal2.png',
        'assets/images/collections/animal/animal3.png',
        'assets/images/collections/animal/animal4.png',
        'assets/images/collections/animal/animal5.png',
        'assets/images/collections/animal/animal6.png',
        'assets/images/collections/animal/animal7.png',
        'assets/images/collections/animal/animal8.png',
        'assets/images/collections/animal/animal9.png',
        'assets/images/collections/animal/animal10.png',
      ],
    ),
    TopicModel(
      id: 'bird',
      title: 'Birds',
      imagePath: 'assets/images/topics/birdsCover.png',
      imageCollection: [
        'assets/images/collections/birds/birds3.png',
        'assets/images/collections/birds/birds4.png',
        'assets/images/collections/birds/birds7.png',
        'assets/images/collections/birds/birds8.png',
        'assets/images/collections/birds/birds9.png',
        'assets/images/collections/birds/birds10.png',
        'assets/images/collections/birds/birds11.png',
        'assets/images/collections/birds/birds12.png',
        'assets/images/collections/birds/birds13.png',
      ],
    ),
    TopicModel(
      id: 'chibi',
      title: 'Chibi',
      imagePath: 'assets/images/topics/chibiCover.png',
      imageCollection: [
        'assets/images/collections/chibi/Chibi1.png',
        'assets/images/collections/chibi/Chibi2.png',
        'assets/images/collections/chibi/Chibi3.png',
        'assets/images/collections/chibi/Chibi4.png',
        'assets/images/collections/chibi/Chibi5.png',
        'assets/images/collections/chibi/Chibi6.png',
        'assets/images/collections/chibi/Chibi7.png',
        'assets/images/collections/chibi/Chibi8.png',
        'assets/images/collections/chibi/Chibi9.png',
        'assets/images/collections/chibi/Chibi10.png',
        'assets/images/collections/chibi/Chibi11.png',
      ],
    ),
  ];
}
