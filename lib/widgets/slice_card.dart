import 'package:flutter/material.dart';
import 'package:myroulette/models/slice.dart';

class SliceCard extends StatelessWidget {
  const SliceCard({super.key, required this.slice});
  final Slice slice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              spacing: 4,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: slice.color,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  width: 24,
                  height: 24,
                ),
                Expanded(
                  child: Text(
                    slice.name,
                    style: TextStyle(fontSize: 24),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Icon(Icons.delete_forever_outlined),
          )
        ],
      ),
    );
  }
}