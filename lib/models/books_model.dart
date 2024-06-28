import 'package:bookero/utils/app_assets.dart';

class BooksModel {
  final String title;
  final String category;
  final String author;
  final String description;
  final String excerpt;
  final String image;
  final String rating;
  final String price;

  BooksModel({
    required this.title,
    required this.category,
    required this.author,
    required this.description,
    required this.excerpt,
    required this.image,
    required this.rating,
    required this.price,
  });
}

List<BooksModel> books = [
  BooksModel(
    title: "If Only I Had Told Her",
    category: "Fiction",
    author: "Laura Nowlin",
    description:
        "If only I’d told her that I loved her years ago, then I wouldn’t be here now.Finn has always loved Autumn. She’s not just the girl next door or his mother’s best friend’s daughter, she is his everything. But she’s not his girlfriend. That’s Sylvie, and Finn would never hurt her, so there’s no way Autumn could know how he truly feels.",
    excerpt: excerpt,
    image: AppAssets.i_1,
    rating: "4.7",
    price: "9",
  ),
  BooksModel(
    title: "The Creative Act",
    category: "Philosophy",
    author: "Rick Rubin",
    description:
        "“I set out to write a book about what to do to make a great work of art. Instead, it revealed itself to be a book on how to be.” —Rick Rubin The Creative Act is a beautiful and generous course of study that illuminates the path of the artist as a road we all can follow. It distills the wisdom gleaned from a lifetime’s work into a luminous reading experience that puts the power to create moments—and lifetimes—of exhilaration and transcendence within closer reach for all of us.",
    excerpt: excerpt,
    image: AppAssets.i_2,
    rating: "4.5",
    price: "32",
  ),
  BooksModel(
    title: "The Happiness Advantage",
    category: "Business",
    author: "Shawn Achor",
    description:
        "An engaging, deeply researched guide to flourishing in a world of increasing stress and negativity—the inspiration for one of the most popular TED Talks of all time “Powerful [and] charming . . . A book for just about anyone . . . The philosophies in this book are easily the best wire frames to build a happy and successful life.”—Medium Happiness is not the belief that we don’t need to change; it is the realization that we can. As we come to understand that our happiness has the power to change the world around us, we can take action not just to improve our own well-being, but to help make others more successful, too.",
    excerpt: excerpt,
    image: AppAssets.i_3,
    rating: "4.9",
    price: "19",
  ),
  BooksModel(
    title: "Becoming",
    category: "Biography",
    author: "Michelle Obama",
    description:
        "An intimate, powerful, and inspiring memoir by the former First Lady of the United States #1 NEW YORK TIMES BESTSELLER • OPRAH’S BOOK CLUB PICK • NAACP IMAGE AWARD WINNER In a life filled with meaning and accomplishment, Michelle Obama has emerged as one of the most iconic and compelling.",
    excerpt: excerpt,
    image: AppAssets.i_4,
    rating: "4.8",
    price: "18",
  ),
  BooksModel(
    title: "American Gods",
    category: "Fiction",
    author: "Neil Gaiman",
    description:
        "Days before his release from prison, Shadow's wife, Laura, dies in a mysterious car crash. Numbly, he makes his way back home. On the plane, he encounters the enigmatic Mr Wednesday, who claims to be a refugee from a distant war, a former god and the king of America. Together they embark on a profoundly strange journey across the heart of the USA, whilst all around them a storm of preternatural and epic proportions threatens to break.",
    excerpt: excerpt,
    image: AppAssets.i_5,
    rating: "4.7",
    price: "12",
  )
];

List<Map> audioBooks = [
  {
    "title": "Taking the body",
    "author": "V.L. Locey",
    "image": AppAssets.i_6,
    "rating": "4.5",
    "price": "32",
  },
  {
    "title": "James Percival Everbett",
    "author": "James bett",
    "image": AppAssets.i_7,
    "rating": "4.9",
    "price": "27",
  },
  {
    "title": "Whiskey Tender",
    "author": "Ryan Ringbloom",
    "image": AppAssets.i_8,
    "rating": "4.3",
    "price": "23",
  },
  {
    "title": "Lost in Jaba",
    "author": "Walt Gleeson",
    "image": AppAssets.i_9,
    "rating": "4.7",
    "price": "12",
  },
  {
    "title": "Our Moon",
    "author": "Rebecca Yarros",
    "image": AppAssets.i_10,
    "rating": "4.7",
    "price": "9",
  }
];

List<String> moreBooks = [
  AppAssets.i_11,
  AppAssets.i_12,
  AppAssets.i_13,
  AppAssets.i_14,
  AppAssets.i_15,
];

const String excerpt =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident. Sunt in culpa qui officia deserunt mollit anim id est laborum. here are many variations of passages of Lorem Ipsum available, \n\nbut the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. \n\nAll the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident. Sunt in culpa qui officia deserunt mollit anim id est laborum. here are many variations of passages of Lorem Ipsum available, \n\nbut the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. \n\nAll the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.";
