import 'package:flutter/material.dart';
import 'package:helth_pay/Components/my_divider.dart';
import 'package:helth_pay/Components/Contact_us_tile.dart';
import 'package:helth_pay/Screens/bottom_sheet.dart';
import 'package:helth_pay/Screens/profile_page.dart';
import '../Components/bottom_button.dart';
import '../constants.dart';
import '../home.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEFF3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            setState(() {
              currentScreen = ProfilePage();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Home();
              }));
            });
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Feedback',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                color: Colors.white,
                child: const TextField(
                  textAlignVertical: TextAlignVertical.top,
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  decoration: InputDecoration(
                    hintText: 'Comment',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54)),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rate your experience',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Flexible(
                          child: Icon(
                            Icons.star_border_outlined,
                            color: Colors.yellowAccent,
                            size: 40,
                          ),
                        ),
                        Flexible(
                          child: Icon(
                            Icons.star_border_outlined,
                            color: Colors.yellowAccent,
                            size: 40,
                          ),
                        ),
                        Flexible(
                          child: Icon(
                            Icons.star_border_outlined,
                            color: Colors.yellowAccent,
                            size: 40,
                          ),
                        ),
                        Flexible(
                          child: Icon(
                            Icons.star_border_outlined,
                            color: Colors.yellowAccent,
                            size: 40,
                          ),
                        ),
                        Flexible(
                          child: Icon(
                            Icons.star_border_outlined,
                            color: Colors.yellowAccent,
                            size: 40,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return BottomSheetContainer(
                        child: FeedbackSuccess(
                          changeStatusIcon: Icons.check_circle_outline_outlined,
                          buttonTitle: 'Back to Profile',
                          buttonColor: myLightBlue,
                          iconColor: myBlue,
                          onClosePressed: (){
                            Navigator.pop(context);
                          },
                          onPressed: () {
                            setState(
                              () {
                                currentTab = currentTab;
                                currentScreen = const ProfilePage();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const Home();
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: const BottomButton(
                  buttonTitle: 'Submit',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedbackSuccess extends StatelessWidget {
  const FeedbackSuccess({
    Key? key,
    this.passwordChangeStatus,
    required this.changeStatusIcon,
    this.onPressed,
    required this.buttonTitle,
    required this.buttonColor,
    required this.iconColor,
    this.onClosePressed,
  }) : super(key: key);

  final String? passwordChangeStatus;
  final IconData changeStatusIcon;
  final VoidCallback? onPressed;
  final String buttonTitle;
  final int buttonColor;
  final int iconColor;
  final VoidCallback? onClosePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: //onClosePressed,
                    () {
                  Navigator.pop(context);
                },
                child: Row(
                  children:  [
                    const Text(
                      'close ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.close_rounded,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Color(buttonColor),
                borderRadius: BorderRadius.circular(25)),
            child: Icon(
              changeStatusIcon,
              color: Color(iconColor),
              size: 40,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Text(
          //     passwordChangeStatus,
          //     style: const TextStyle(fontWeight: FontWeight.bold),
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Thank you!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'By making your voice heard you',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const Text(
            'help us improve BelloKano Pay',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),

          Padding(
            padding: const EdgeInsets.only(
              right: 40.0,
              left: 40,
              top: 10,
            ),
            child: GestureDetector(
              onTap: onPressed,
              child: BottomButton(
                buttonTitle: buttonTitle,
                color: Color(myBlue),
              ),
            ),
          )
        ],
      ),
    );
  }
}
