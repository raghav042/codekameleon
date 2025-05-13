import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codekameleon/extension/context_extension.dart';
import 'package:codekameleon/extension/datettime_extension.dart';
import 'package:codekameleon/helper/language_helper.dart';
import 'package:codekameleon/model/user_model.dart';
import 'package:codekameleon/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../constant/app_strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isUploading = false;
  bool isEditingBio = false;
  late String editedBio;
  final bioController = TextEditingController();

  @override
  void dispose() {
    bioController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source, UserProvider userProvider,
      ScaffoldMessengerState messenger) async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: source, imageQuality: 85);
      if (pickedFile == null) return;

      setState(() => isUploading = true);
      final imageFile = File(pickedFile.path);
      final downloadUrl = await userProvider.uploadProfilePicture(imageFile);

      if (downloadUrl != null) {
        await _updateUserField('imageUrl', downloadUrl, userProvider);
        messenger.showSnackBar(
            const SnackBar(content: Text('Profile picture updated')));
      } else {
        messenger.showSnackBar(
            const SnackBar(content: Text('Upload failed. Please try again.')));
      }
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() => isUploading = false);
    }
  }

  Future<void> _updateUserField(
      String field, dynamic value, UserProvider userProvider) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return;

    await userProvider
        .updateUser(updateValues: {field: value}, user: currentUser);
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get();
    if (snapshot.exists) {
      userProvider.user = UserModel.fromJson(snapshot.data()!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.read<UserProvider>();
    final user = context.watch<UserProvider>().user;
    final size = MediaQuery.sizeOf(context);
    final colorScheme = context.colorScheme;
    final messenger = ScaffoldMessenger.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            _buildProfileImage(user, size, userProvider, messenger),
            const SizedBox(height: 10),
            Text(user.name, style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 10),
            _buildBioContainer(user, colorScheme, userProvider, messenger),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard(
                    size,
                    colorScheme,
                    Icons.star,
                    AppStrings.progressPoints,
                    user.points.toString(),
                    Colors.amber,
                    colorScheme.primary),
                _buildLanguageCard(size, colorScheme),
              ],
            ),
            const SizedBox(height: 20),
            _buildSectionHeader(
              context,
              colorScheme,
              AppStrings.myProfileTxt,
              Icons.data_object,
            ),
            _buildProfileDetails(user, colorScheme, context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(UserModel user, Size size,
      UserProvider userProvider, ScaffoldMessengerState messenger) {
    final colorScheme = context.colorScheme;
    return Stack(
      children: [
        Hero(
          tag: AppStrings.profilePicTag,
          child: CircleAvatar(
            radius: size.width / 4,
            backgroundColor: colorScheme.surfaceContainerHigh,
            backgroundImage: !isUploading && user.imageUrl != null
                ? CachedNetworkImageProvider(user.imageUrl!)
                : null,
            child: isUploading
                ? const CircularProgressIndicator()
                : user.imageUrl == null
                    ? Icon(
                        Icons.person_4,
                        size: 100,
                        color: context.colorScheme.primary,
                      )
                    : null,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: InkWell(
            onTap: isUploading
                ? null
                : () => _showImageSourceActionSheet(
                    context, userProvider, messenger),
            child: CircleAvatar(
              radius: 23,
              backgroundColor: isUploading
                  ? colorScheme.surfaceContainerHighest
                  : colorScheme.surface,
              child: Icon(Icons.camera_alt, color: context.colorScheme.primary),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showImageSourceActionSheet(BuildContext context,
      UserProvider userProvider, ScaffoldMessengerState messenger) async {
    await showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery, userProvider, messenger);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera, userProvider, messenger);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBioContainer(UserModel user, ColorScheme colorScheme,
      UserProvider userProvider, ScaffoldMessengerState messenger) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(25),
          ),
          child: isEditingBio
              ? TextField(
                  controller: bioController..text = editedBio,
                  autofocus: true,
                  minLines: 1,
                  maxLines: 5,
                  onChanged: (val) => editedBio = val,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Enter your bio'),
                )
              : Text(user.bio,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16)),
        ),
        IconButton(
          icon: Icon(isEditingBio ? Icons.check : Icons.edit),
          onPressed: isUploading
              ? null
              : () async {
                  if (isEditingBio) {
                    setState(() => isUploading = true);
                    await _updateUserField('bio', editedBio, userProvider);
                    messenger.showSnackBar(
                        const SnackBar(content: Text('Bio updated')));
                    setState(() {
                      isEditingBio = false;
                      isUploading = false;
                    });
                  } else {
                    setState(() {
                      editedBio = user.bio;
                      isEditingBio = true;
                    });
                  }
                },
        ),
      ],
    );
  }

  Widget _buildStatCard(Size size, ColorScheme colorScheme, IconData icon,
      String label, String value, Color iconColor, Color valueColor) {
    return Container(
      width: size.width / 2 - 30,
      height: size.width / 2 - 30,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(width: 12),
              Expanded(
                child: Text(label,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Text(value,
              style: GoogleFonts.quicksand(fontSize: 50, color: valueColor)),
        ],
      ),
    );
  }

  Widget _buildLanguageCard(Size size, ColorScheme colorScheme) {
    return Container(
      width: size.width / 2 - 30,
      height: size.width / 2 - 30,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.menu_book_outlined, color: colorScheme.tertiary),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(AppStrings.currentlyLearning,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          if (LanguageHelper.recentLanguage != null)
            Image.asset(LanguageHelper.recentLanguage!.largeIcon,
                height: size.width / 4 - 10),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, ColorScheme colorScheme,
      String title, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainer,
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16), bottom: Radius.circular(4)),
          ),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 12),
              Text(title,
                  style: GoogleFonts.quicksand(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Divider(height: 2, color: colorScheme.surface),
      ],
    );
  }

  Widget _buildProfileDetails(
      UserModel user, ColorScheme colorScheme, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(4), bottom: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileInfoRow(
              context, AppStrings.assignName, user.name, colorScheme.primary),
          _profileInfoRow(
              context, AppStrings.assignEmail, user.email, colorScheme.primary),
          _profileInfoRow(context, AppStrings.assignPoints,
              user.points.toString(), colorScheme.tertiary),
          _profileInfoRow(context, AppStrings.assignOnline,
              user.isOnline.toString(), colorScheme.tertiary),
          _profileInfoRow(context, AppStrings.assignStatus, AppStrings.active,
              colorScheme.tertiary),
          _profileInfoRow(context, AppStrings.lastSeenAt,
              user.lastSeenAt.toFullDateTimeFormat(), colorScheme.secondary),
          _profileInfoRow(context, AppStrings.registeredAt,
              user.registeredAt.toFullDateTimeFormat(), colorScheme.secondary),
          _profileInfoRow(
              context, AppStrings.assignBio, user.bio, colorScheme.primary),
        ],
      ),
    );
  }

  Widget _profileInfoRow(
      BuildContext context, String label, String value, Color valueColor) {
    final colorScheme = context.colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.onSurface.withValues(alpha: 0.8))),
          const SizedBox(width: 8),
          Expanded(
            child: Text(value,
                style: TextStyle(
                    fontSize: 16,
                    color: valueColor,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
