// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class _NewsListState extends State<NewsList> {
//   final List<bool> _isNewsScreenFavorite = <bool>[];
//   @override
//   initState() {
//     for (var i = 0; i < widget.results.length; i++) {
//       _isNewsScreenFavorite.add(false);
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: widget.results.length,
//       itemBuilder: (BuildContext context, int index) {
//         var wResults = widget.results.elementAt(index);
//         return InkWell(
//           splashColor: Colors.red,
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => DisplaySelectedNews(
//                   urlToImage: wResults.urlToImage,
//                   author: wResults.author,
//                   description: wResults.description,
//                   publishedAt: wResults.publishedAt,
//                   title: wResults.title,
//                   content: wResults.content,
//                 ),
//               ),
//             );
//           },
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               vertical: 2,
//               horizontal: 10,
//             ),
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10.0),
//                     child: Image.network(
//                       wResults.urlToImage,
//                       width: double.infinity,
//                       height: 150,
//                       fit: BoxFit.fill,
//                       color: Colors.grey.withOpacity(1),
//                       colorBlendMode: BlendMode.modulate,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Center(
//                       child: Text(
//                         wResults.title.toString().trim(),
//                         style: Theme.of(context).textTheme.bodyText1!.merge(
//                               const TextStyle(color: Colors.white),
//                             ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     right: 5.0,
//                     bottom: 10.0,
//                     child: Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             if (DisplayFavorites.isFavoriteScreenActive) {
//                               _isNewsScreenFavorite[index] =
//                                   !_isNewsScreenFavorite.elementAt(index);
//                               DisplayFavorites.favoriteDataList
//                                   .remove(wResults);
//                             } else {
//                               _isNewsScreenFavorite[index] =
//                                   !_isNewsScreenFavorite.elementAt(index);
//                               _isNewsScreenFavorite[index]
//                                   ? DisplayFavorites.favoriteDataList
//                                       .add(wResults)
//                                   : DisplayFavorites.favoriteDataList
//                                       .remove(wResults);
//                             }
//                             //print(wResults.publishedAt);
//                           });
//                         },
//                         icon: Icon(
//                           DisplayFavorites.isFavoriteScreenActive
//                               ? Icons.favorite
//                               : _isNewsScreenFavorite.elementAt(index)
//                                   ? Icons.favorite
//                                   : Icons.favorite_border_outlined,
//                           color: Colors.red,
//                           size: 50,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
