class ApiConstance{
  static const String baseUrl='https://elect-lab-production.up.railway.app';

///GET DATA LINKS
  static const String getChest='$baseUrl/ResXray';

  static const String getSkinCancer='$baseUrl/ResSkin';

  static const String getBrainTumor='$baseUrl/ResBrain';


///POST DATA LINKS
  static const String postChest='$baseUrl/chest_predict';

  static const String postSkinCancer='$baseUrl/skin_cancer_predict';

  static const String postBrainTumor='$baseUrl/brain_tumor_predict';
}