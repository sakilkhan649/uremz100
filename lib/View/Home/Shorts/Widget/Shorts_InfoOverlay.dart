import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Widgets/Custom_Text.dart';

class ShortsInfoOverlay extends StatelessWidget {
  final String title;
  final String description;
  final List<String>? tags;
  final bool isEpisodeInfo; // true for EP.11 style
  final bool isExpanded;
  final VoidCallback onMoreTap;

  const ShortsInfoOverlay({
    super.key,
    required this.title,
    required this.description,
    this.tags,
    this.isEpisodeInfo = false,
    required this.isExpanded,
    required this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Title with Arrow
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: CustomText(
                text: title,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 8.w),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 16.sp,
            ),
          ],
        ),
        
        // Tags
        if (tags != null && tags!.isNotEmpty) ...[
          SizedBox(height: 12.h),
          Row(
            children: tags!.map((tag) => _buildTag(tag)).toList(),
          ),
        ],

        SizedBox(height: 12.h),

        // Description / Episode Info
        SizedBox(
          width: 300.w,
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFE6E6E6),
                height: 1.4,
              ),
              children: [
                if (isEpisodeInfo)
                  TextSpan(
                    text: "EP.11  |  ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                TextSpan(text: description),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: onMoreTap,
                    child: Text(
                      isExpanded ? " Less" : " ... more",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            maxLines: isExpanded ? null : 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildTag(String label) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: CustomText(
        text: label,
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        color: const Color(0xFFE6E6E6),
      ),
    );
  }
}
