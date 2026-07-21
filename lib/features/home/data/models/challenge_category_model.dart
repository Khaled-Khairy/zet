import 'package:flutter/material.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';

class ChallengeItemModel {
  final String title;
  final String description;
  final String rewardAmount;
  final String? leadSvgAsset;
  final String? logoAsset;

  const ChallengeItemModel({
    required this.title,
    required this.description,
    required this.rewardAmount,
    this.leadSvgAsset,
    this.logoAsset,
  });
}

class ChallengeCategoryModel {
  final String title;
  final String description;
  final String icon;
  final Color? iconColor;
  final List<ChallengeItemModel> challenges;

  const ChallengeCategoryModel({
    required this.title,
    required this.description,
    required this.icon,
    this.iconColor,
    required this.challenges,
  });

  static ChallengeCategoryModel getCategoryByTitle(String title) {
    return mockCategories.firstWhere(
      (cat) => cat.title == title,
      orElse: () => mockCategories.first,
    );
  }

  static List<ChallengeCategoryModel> get mockCategories => [
        const ChallengeCategoryModel(
          title: 'تحديات النشر',
          description: 'هي تحديات لإختبار قوتك وخبرتك في استخدام مواقع التواصل الإجتماعي',
          icon: AppSvgs.tempGlobe,
          iconColor: AppColors.cyan,
          challenges: [
            ChallengeItemModel(
              title: 'تحدي النشر',
              description: 'انشر مقطع عن اي منتج من منتجات متجرنا وخليه ي...',
              rewardAmount: '75',
              leadSvgAsset: AppSvgs.tempGlobe,
              logoAsset: AppImages.tempLogo,
            ),
            ChallengeItemModel(
              title: 'تحدي النشر',
              description: 'انشر مقطع عن اي منتج من منتجات متجرنا وخليه ي...',
              rewardAmount: '75',
              leadSvgAsset: AppSvgs.tempGlobe,
              logoAsset: AppImages.tempLogo,
            ),
            ChallengeItemModel(
              title: 'تحدي النشر',
              description: 'انشر مقطع عن اي منتج من منتجات متجرنا وخليه ي...',
              rewardAmount: '25',
              leadSvgAsset: AppSvgs.tempGlobe,
              logoAsset: AppImages.tempLogo,
            ),
            ChallengeItemModel(
              title: 'تحدي النشر',
              description: 'انشر مقطع عن اي منتج من منتجات متجرنا وخليه ي...',
              rewardAmount: '100',
              leadSvgAsset: AppSvgs.tempGlobe,
              logoAsset: AppImages.tempLogo,
            ),
            ChallengeItemModel(
              title: 'تحدي النشر',
              description: 'انشر مقطع عن اي منتج من منتجات متجرنا وخليه ي...',
              rewardAmount: '50',
              leadSvgAsset: AppSvgs.tempGlobe,
              logoAsset: AppImages.tempLogo,
            ),
            ChallengeItemModel(
              title: 'تحدي النشر',
              description: 'انشر مقطع عن اي منتج من منتجات متجرنا وخليه ي...',
              rewardAmount: '30',
              leadSvgAsset: AppSvgs.tempGlobe,
              logoAsset: AppImages.tempLogo,
            ),
            ChallengeItemModel(
              title: 'تحدي النشر',
              description: 'انشر مقطع عن اي منتج من منتجات متجرنا وخليه ي...',
              rewardAmount: '35',
              leadSvgAsset: AppSvgs.tempGlobe,
              logoAsset: AppImages.tempLogo,
            ),
          ],
        ),
        const ChallengeCategoryModel(
          title: 'تحديات الشراء',
          description: 'تحديات مصممة خصيصاً لمكافأتك عند الشراء من علاماتك التجارية المفضلة',
          icon: AppSvgs.market,
          iconColor: AppColors.cyan,
          challenges: [
            ChallengeItemModel(
              title: 'تحدي الشراء الأول',
              description: 'قم بشراء أي منتج بقيمة 100 ريال واحصل على مكافأة سريعة',
              rewardAmount: '50',
              leadSvgAsset: AppSvgs.market,
            ),
            ChallengeItemModel(
              title: 'تحدي التوفير',
              description: 'تسوق بقيمة 200 ريال أو أكثر من المتجر الشريك لتحصل على نقاط مضاعفة',
              rewardAmount: '120',
              leadSvgAsset: AppSvgs.market,
            ),
            ChallengeItemModel(
              title: 'تحدي نهاية الأسبوع',
              description: 'اشترِ قطعتين واحصل على خصم إضافي مع نقاط إضافية',
              rewardAmount: '80',
              leadSvgAsset: AppSvgs.market,
            ),
          ],
        ),
        const ChallengeCategoryModel(
          title: 'تحديات التفاعل',
          description: 'تفاعل مع منشوراتنا واشترك في قنواتنا لتحصل على مكافآت فورية',
          icon: AppSvgs.star,
          iconColor: AppColors.cyan,
          challenges: [
            ChallengeItemModel(
              title: 'تحدي التعليقات',
              description: 'اترك تعليقاً إيجابياً على منشور اليوم في منصة إكس',
              rewardAmount: '15',
              leadSvgAsset: AppSvgs.star,
            ),
            ChallengeItemModel(
              title: 'تحدي المتابعة',
              description: 'تابع حسابنا الرسمي على منصة تيك توك وإنستغرام',
              rewardAmount: '30',
              leadSvgAsset: AppSvgs.star,
            ),
            ChallengeItemModel(
              title: 'تحدي المشاركة',
              description: 'شارك منشور الفعالية مع ثلاثة من أصدقائك',
              rewardAmount: '25',
              leadSvgAsset: AppSvgs.star,
            ),
          ],
        ),
        const ChallengeCategoryModel(
          title: 'تحديات التقييم',
          description: 'شاركنا رأيك الصادق حول المنتجات والخدمات التي جربتها',
          icon: AppSvgs.starSquareRounded,
          iconColor: AppColors.cyan,
          challenges: [
            ChallengeItemModel(
              title: 'تحدي تقييم التطبيق',
              description: 'قيم التطبيق على المتجر واكتب رأيك لتحصل على مكافأة',
              rewardAmount: '40',
              leadSvgAsset: AppSvgs.starSquareRounded,
            ),
            ChallengeItemModel(
              title: 'تحدي تقييم المنتج',
              description: 'اكتب تقييماً مفصلاً لآخر منتج قمت بشرائه مع صورة',
              rewardAmount: '60',
              leadSvgAsset: AppSvgs.starSquareRounded,
            ),
          ],
        ),
        const ChallengeCategoryModel(
          title: 'تحديات دعوة الأصدقاء',
          description: 'ادعُ أصدقائك للانضمام إلينا واكسب مكافآت مميزة لك ولهم',
          icon: AppSvgs.person,
          iconColor: AppColors.cyan,
          challenges: [
            ChallengeItemModel(
              title: 'تحدي الدعوة الأولى',
              description: 'ادعُ صديقاً واحداً للتسجيل باستخدام رمز الإحالة الخاص بك',
              rewardAmount: '50',
              leadSvgAsset: AppSvgs.person,
            ),
            ChallengeItemModel(
              title: 'تحدي المجموعة',
              description: 'قم بدعوة 5 أصدقاء للتسجيل وتفعيل حساباتهم في التطبيق',
              rewardAmount: '300',
              leadSvgAsset: AppSvgs.person,
            ),
          ],
        ),
      ];
}
