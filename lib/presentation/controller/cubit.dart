import 'dart:async';
import 'dart:io';
import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_lab/presentation/controller/state.dart';
import 'package:e_lab/presentation/screens/layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/services/services_locator.dart';
import '../../core/utils/snackbar/snackbar.dart';
import '../../domain/usecases/diabetes_post_usecase.dart';
import '../../domain/usecases/upload_braintumor_usecase.dart';
import '../../domain/usecases/upload_chest_usecase.dart';
import '../../domain/usecases/uploadskinusecase.dart';

class ElabCubit extends Cubit<MainState> {
  ElabCubit() : super(InitialState());

  static ElabCubit get(context) => BlocProvider.of(context);
  final ScrollController scrollController = ScrollController();
  final TextEditingController ageEditingController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? accountBlood;
  String? accountGender;
  DateTime? birthdate;
  final formKeySignUp = GlobalKey<FormState>();
  final formKeyLogin = GlobalKey<FormState>();
  final picker = ImagePicker();
  int? age;
  String? gender;
  String? polydipsia;
  String? polyuria;
  String? suddenWeightLoss;
  String? alopecia;
  File? skinImg;
  File? chestImg;
  File? brainImg;
  bool isDark = false;
  SharedPreferences? prefs;
  String? skinResult;
  String? brainResult;
  String? chestResult;
  String? diabetesResult;
  bool isVisible = false;
  bool diabetesResultLoading = false;
  bool skinResultLoading = false;
  bool xrayResultLoading = false;
  bool brainResultLoading = false;
  final credential = FirebaseAuth.instance.currentUser;

  //CollectionReference users = FirebaseFirestore.instance.collection('userSSS');
  //int userAge = AgeCalculator.age(DateTime(FirebaseFirestore.instance.collection('userSSS').doc(FirebaseAuth.instance.currentUser!.uid)['ageYear'], FirebaseFirestore.instance.collection('userSSS').doc(FirebaseAuth.instance.currentUser!.uid)['ageMonth'], FirebaseFirestore.instance.collection('userSSS').doc(FirebaseAuth.instance.currentUser!.uid)['ageDay']),).years;

  ///Diabetes variables
  editAge(String newAge) {
    emit(DiabetesVariableLoading());
    age = int.parse(newAge);
    emit(DiabetesVariableSuccess());
  }

  editGender(String newGender) {
    emit(DiabetesVariableLoading());
    gender = newGender;
    emit(DiabetesVariableSuccess());
  }

  editPolydipsia(String newPolydipsia) {
    emit(DiabetesVariableLoading());
    polydipsia = newPolydipsia;
    emit(DiabetesVariableSuccess());
  }

  editPolyuria(String newPolyuria) {
    emit(DiabetesVariableLoading());
    polyuria = newPolyuria;
    emit(DiabetesVariableSuccess());
  }

  editSuddenWeightLoss(String newSuddenWeightLoss) {
    emit(DiabetesVariableLoading());
    suddenWeightLoss = newSuddenWeightLoss;
    emit(DiabetesVariableSuccess());
  }

  editAlopecia(String newAlopecia) {
    emit(DiabetesVariableLoading());
    alopecia = newAlopecia;
    emit(DiabetesVariableSuccess());
  }

  ///Theme functions
  void changeAppMode() {
    isDark = !isDark;
    addBool();
    emit(ChangeModeState());
  }

  addBool() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool('boolValue', isDark);
  }

  getBoolValue() async {
    prefs = await SharedPreferences.getInstance();
    //Return bool
    isDark = prefs!.getBool('boolValue') ?? false;
  }

  ///Pick disease photos
  Future pickSkinCancerImage() async {
    emit(LoadingPick());
    PickedFile? pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    skinImg = File(pickedFile!.path);
    emit(SuccessPick());
  }

  Future pickChestImage() async {
    emit(LoadingPick());
    PickedFile? pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    chestImg = File(pickedFile!.path);
    emit(SuccessPick());
  }

  Future pickBrainImage() async {
    emit(LoadingPick());
    PickedFile? pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );
    brainImg = File(pickedFile!.path);
    emit(SuccessPick());
  }

  ///DATA FUNCTIONS
  addResults(String result, String collection) async{
    emit(AddResLoading());
    await FirebaseFirestore.instance.collection('userSSS').doc(credential!.uid).collection(collection).doc('${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}').set({
      'results': FieldValue.arrayUnion([
        {
          'time' : DateTime.now().hour < 10? DateTime.now().minute < 10? '0${DateTime.now().hour} : 0${DateTime.now().minute}': '0${DateTime.now().hour} : ${DateTime.now().minute}' : DateTime.now().minute < 10?'${DateTime.now().hour} : 0${DateTime.now().minute}' : '${DateTime.now().hour} : ${DateTime.now().minute}',
          'result' : result,
        }
      ]),
    });
    emit(AddResSuccess());
  }

  uploadSKinCancer() async {
    if(skinImg != null){
      skinResultLoading = true;
      emit(LoadingSkinCancerUpload());
      skinResult = await UploadSkinUseCase(sl()).call(skinImg);
      skinResultLoading = false;
      if(skinResult != 'Error Occurred' || skinResult != null){
        addResults(skinResult!, 'Skin_history');
      }
      emit(SuccessSkinCancerUpload());
    }
  }

  uploadBrainTumor() async {
    if(brainImg != null){
      brainResultLoading = true;
      emit(LoadingBrainTumorUpload());
      brainResult = await UploadBrainTumorUseCase(sl()).call(brainImg);
      brainResultLoading = false;
      if(brainResult != 'Error Occurred' || brainResult != null){
        addResults(brainResult!, 'Brain_history');
      }
      emit(SuccessBrainTumorUpload());
    }
  }

  uploadChest() async {
    if(chestImg != null){
      xrayResultLoading = true;
      emit(LoadingChestUpload());
      chestResult = await UploadChestUseCase(sl()).call(chestImg);
      xrayResultLoading = false;
      if(chestResult != 'Error Occurred' || chestResult != null){
        addResults(chestResult!, 'Chest_history');
      }
      emit(SuccessBrainTumorUpload());
    }
  }

  postDiabetes() async {
    if (age == null || gender == null || polyuria == null || polydipsia == null ||
        suddenWeightLoss == null || alopecia == null) {
      return;
    }else {
      diabetesResultLoading = true;
      emit(DiabetesSentApi());
      diabetesResult = await DiabetesPostUseCase(sl()).execute(
        gender == "Male" ? 0 : 1,
        age,
        suddenWeightLoss == 'Yes' ? 1 : 0,
        polyuria == 'Yes' ? 1 : 0,
        alopecia == 'Yes' ? 1 : 0,
        polydipsia == 'Yes' ? 1 : 0,
      );
      diabetesResultLoading = false;
      if(diabetesResult != 'Error Occurred' || diabetesResult != null){
        addResults(diabetesResult!, 'Diabetes_history');
      }
      emit(DiabetesReceivingApi());
    }
  }

  ///Account functions
  Future signIn(BuildContext context) async {
    if(formKeyLogin.currentState!.validate()){
      emit(LoginLoading());
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        emit(LoginSuccess());
      } on FirebaseAuthException catch (e) {
        emit(LoginError());
        showSnackBar(context, e.toString());
      }
    }
  }

  register(BuildContext context) async {
    emit(RegisterLoading());
    if(formKeySignUp.currentState!.validate()){
      try {
        final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        CollectionReference users =
        FirebaseFirestore.instance.collection('userSSS');

        users
            .doc(credential.user!.uid)
            .set({
          'username': userNameController.text,
          'ageYear': birthdate!.year,
          'ageMonth': birthdate!.month,
          'ageDay': birthdate!.day,
          'email': emailController.text,
          'password': passwordController.text,
          'bloodType': accountBlood,
          'phone': phoneController.text,
          'gender': accountGender,
        })
            .then((value) => print("User Added"));
        emit(RegisterSuccess());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {

          showSnackBar(context, ' The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {

          showSnackBar(context, 'The account already exists for that email.');
        } else {
          showSnackBar(context, 'Error - Please try again later');
        }
      } catch (e) {
        showSnackBar(context, e.toString());
      }
      emit(RegisterError());
    }
  }

  pickDate(BuildContext context) async{
    emit(DateWaiting());
    final date = await showDatePicker(
      context: context,
      initialDate: birthdate == null? DateTime(2020, 1, 1,) : birthdate!,
      firstDate: DateTime(1950),
      lastDate: DateTime(2020, 1, 1,),
      confirmText: 'Set',
      cancelText: 'Cancel',
        builder: (context,picker){
          return Theme(
            //TODO: change colors
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Colors.black,
                onPrimary: Colors.white,
                surface: Colors.black54,
                onSurface: Colors.white,
              ),
              dialogBackgroundColor:Colors.blueGrey,
            ),
            child: picker ?? const Text('Brith date'),);
        });
    emit(DatePicked());
    print(date);
    if(date != null){
      emit(DateConfirmed());
      birthdate = date;
    }else{
      emit(DateError());
      return;
    }
  }

  // calculateUserAge() async{
  //   var snapShot = await users.doc(credential!.uid).get();
  //   Map<String, dynamic>? data = snapShot.data();
  //   return data![''];
  // }

  editAccountBlood(String newType) {
    emit(DiabetesVariableLoading());
    accountBlood = newType;
    emit(DiabetesVariableSuccess());
  }

  editAccountGender(String newGender) {
    emit(DiabetesVariableLoading());
    accountGender = newGender;
    emit(DiabetesVariableSuccess());
  }

  resetPassword(BuildContext context) async {
    emit(ResetPassLoading());
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        });
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      emit(ResetPassSuccess());
    } on FirebaseAuthException catch (e) {
      emit(ResetPassError());
      showSnackBar(context, "ERROR :  ${e.code} ");
    }
    return;
  }

  googleLogin(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    //if (googleSignIn == null) return;
    //_user = googleUser;
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    print('Signed In');
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  googleSignIn (BuildContext context) async {
    await googleLogin(context);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AppLayout()));
  }
}