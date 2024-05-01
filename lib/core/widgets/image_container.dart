import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatefulWidget {
  const ImageContainer({
    super.key,
    required this.width,
    required this.imageUrl,
    this.height = 125,
    this.borderRadius = 20,
    this.padding,
    this.margin,
    this.child,
    this.noTopRadios = false,
  });

  final double width;
  final double height;
  final String imageUrl;
  final double borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final bool noTopRadios;

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: (!widget.noTopRadios)
            ? BorderRadius.circular(widget.borderRadius)
            : BorderRadius.only(
                bottomLeft: Radius.circular(widget.borderRadius),
                bottomRight: Radius.circular(widget.borderRadius),
              ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: (!widget.noTopRadios)
                ? BorderRadius.circular(widget.borderRadius)
                : BorderRadius.only(
                    bottomLeft: Radius.circular(widget.borderRadius),
                    bottomRight: Radius.circular(widget.borderRadius),
                  ),
            child: CachedNetworkImage(
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              width: double.infinity,
              height: double.infinity,
              imageUrl: widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: widget.padding ?? EdgeInsets.zero,
            child: widget.child ?? Container(),
          ),
        ],
      ),
    );
  }
}
