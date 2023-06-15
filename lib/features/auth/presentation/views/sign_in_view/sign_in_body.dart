import 'sign_in_imports.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {});
    passwordController.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 05.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.h,
            ),
            Center(
              child: Image.asset(
                "assets/images/daftra.png",
                width: 65.w,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: Container(
                width: Responsive.isTablet(context) ? 50.w : 90.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Welcome, log In",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    CustomTextFieldForAuth(
                      textEditingController: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Email",
                      labelText: "Email",
                    ),
                    CustomTextFieldForAuth(
                      textEditingController: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: "Password",
                      labelText: "Password",
                    ),
                    SizedBox(
                      height: 02.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {},
                          child: Text(
                            "Forgot Password?",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 02.h,
                    ),
                    SizedBox(
                      width: Responsive.isTablet(context) ? 40.w : 80.w,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          signIn();
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Log in',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 04.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    if (emailController.text.isValidIzamEmailOnly &&
        passwordController.text.isValidPassword) {
      try {
        showAlertDialog(
            context: context,
            title: "Login successful",
            content: await DatabaseHelper.doesEmailExist(
                emailController.text, passwordController.text));
      } catch (error) {
        showAlertDialog(
            context: context,
            title: "Error acquired",
            content: "Please try again later.");
      }
    } else {
      if (!emailController.text.isValidIzamEmailOnly) {
        showAlertDialog(
            context: context,
            title: "Invalid email",
            content: "Please check the validity of the email");
      } else if (!passwordController.text.isValidPassword) {
        showAlertDialog(
            context: context,
            title: "Invalid input",
            content: "Please check the validity of the password");
      }
    }
  }
}
