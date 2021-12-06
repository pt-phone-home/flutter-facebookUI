import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key key, @required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      )
          : null,
      child: Container(
          height: 60.0,
          color: Colors.white,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _CreateRoomButton(),
                );
              }
              final User user = onlineUsers[index - 1];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: ProfileAvatar(
                  imageUrl: user.imageUrl,
                  isActive: true,
                ),
              );
            },
            itemCount: 1 + onlineUsers.length,
          )),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: Colors.white,
        side: BorderSide(width: 3.0, color: Colors.blueAccent[100]),
        textStyle: TextStyle(color: Palette.facebookBlue),
      ),
      onPressed: () => print('Create Room'),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          Text('Create\nRoom')
        ],
      ),
    );
  }
}
