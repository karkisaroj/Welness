import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness/models/quote.dart';
import 'package:welness/services/favorites_service.dart';

class FavoriteButton extends StatefulWidget {
  final Quote quote;
  final double? size;
  final Color? activeColor;
  final Color? inactiveColor;
  final VoidCallback? onToggle;

  const FavoriteButton({
    super.key,
    required this.quote,
    this.size,
    this.activeColor,
    this.inactiveColor,
    this.onToggle,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  bool _isFavorite = false;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 0.1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _loadFavoriteStatus();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadFavoriteStatus() async {
    await FavoritesService.loadFavorites();
    if (mounted) {
      setState(() {
        _isFavorite = FavoritesService.isFavorite(widget.quote);
      });
    }
  }

  Future<void> _toggleFavorite() async {
    if (_isAnimating) return;

    setState(() {
      _isAnimating = true;
    });

    final wasAdded = await FavoritesService.toggleFavorite(widget.quote);

    if (mounted) {
      setState(() {
        _isFavorite = wasAdded;
        _isAnimating = false;
      });

      _animationController.forward().then((_) {
        _animationController.reverse();
      });

      final message = wasAdded
          ? 'Added to favorites'
          : 'Removed from favorites';
      final color = wasAdded ? Colors.green : Colors.orange;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                wasAdded ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
                size: 20.h,
              ),
              SizedBox(width: 8.w),
              Text(message),
            ],
          ),
          backgroundColor: color,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          margin: EdgeInsets.all(16.w),
          duration: Duration(seconds: 2),
        ),
      );

      widget.onToggle?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: _toggleFavorite,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Transform.rotate(
              angle: _rotationAnimation.value,
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: _isFavorite
                      ? (widget.activeColor ?? Color(0xFFFF6B6B)).withOpacity(
                          0.1,
                        )
                      : (isDark
                            ? Colors.white.withOpacity(0.1)
                            : Colors.grey.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: _isFavorite
                        ? (widget.activeColor ?? Color(0xFFFF6B6B)).withOpacity(
                            0.3,
                          )
                        : Colors.transparent,
                    width: 1,
                  ),
                ),
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    key: ValueKey(_isFavorite),
                    color: _isFavorite
                        ? (widget.activeColor ?? Color(0xFFFF6B6B))
                        : (widget.inactiveColor ??
                              (isDark ? Colors.white54 : Colors.grey)),
                    size: widget.size ?? 24.h,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FloatingFavoriteButton extends StatelessWidget {
  final Quote quote;
  final VoidCallback? onToggle;

  const FloatingFavoriteButton({super.key, required this.quote, this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFF6B6B).withOpacity(0.3),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: FavoriteButton(quote: quote, size: 28.h, onToggle: onToggle),
    );
  }
}
