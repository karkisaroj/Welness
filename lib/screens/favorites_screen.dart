import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:welness/models/quote.dart';
import 'package:welness/services/favorites_service.dart';
import 'package:welness/widgets/custom_card.dart';
import 'package:welness/app/app_routes.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _loadFavorites();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadFavorites() async {
    await FavoritesService.loadFavorites();
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
      _animationController.forward();
    }
  }

  Future<void> _removeFavorite(Quote quote) async {
    await FavoritesService.removeFavorite(quote);
    if (mounted) {
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Removed from favorites'),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final favorites = FavoritesService.favoriteQuotes;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.dashboard);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          "My Favorites",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        centerTitle: true,
        actions: [
          if (favorites.isNotEmpty)
            IconButton(
              onPressed: () async {
                final result = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    title: Text('Clear All Favorites'),
                    content: Text(
                      'Are you sure you want to remove all favorite quotes?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: Text(
                          'Clear All',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );

                if (result == true) {
                  await FavoritesService.clearAllFavorites();
                  setState(() {});
                }
              },
              icon: Icon(Icons.delete_sweep, color: Colors.red),
            ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: Color(0xFF6C63FF)))
          : favorites.isEmpty
          ? _buildEmptyState(isDark)
          : _buildFavoritesList(favorites, isDark),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: Color(0xFF6C63FF).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.favorite_border,
              size: 64.h,
              color: Color(0xFF6C63FF),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            "No Favorites Yet",
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white : Colors.black87,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "Start adding quotes to your favorites\nto see them here",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              color: isDark ? Colors.white70 : Colors.grey[600],
              fontFamily: 'Poppins',
              height: 1.4,
            ),
          ),
          SizedBox(height: 32.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40.w),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.dashboard);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6C63FF),
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.explore, color: Colors.white),
                  SizedBox(width: 8.w),
                  Text(
                    "Explore Quotes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesList(List<Quote> favorites, bool isDark) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 10.h),
              child: Row(
                children: [
                  Icon(Icons.favorite, color: Color(0xFFFF6B6B), size: 20.h),
                  SizedBox(width: 8.w),
                  Text(
                    "${favorites.length} Favorite${favorites.length == 1 ? '' : 's'}",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white70 : Colors.grey[600],
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final quote = favorites[index];
                return _buildFavoriteQuoteCard(quote, isDark, index);
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteQuoteCard(Quote quote, bool isDark, int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: CustomCard(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '"${quote.text}"',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontStyle: FontStyle.italic,
                          color: isDark ? Colors.white : Colors.black87,
                          fontFamily: 'Poppins',
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "— ${quote.author.isNotEmpty ? quote.author : 'Unknown'}",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: isDark ? Colors.white70 : Colors.grey[600],
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (quote.category.isNotEmpty) ...[
                        SizedBox(height: 8.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF6C63FF).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            quote.category,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xFF6C63FF),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                GestureDetector(
                  onTap: () => _removeFavorite(quote),
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Color(0xFFFF6B6B).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Color(0xFFFF6B6B),
                      size: 20.h,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
