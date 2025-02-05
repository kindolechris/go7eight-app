import 'package:appwrite/appwrite.dart';
import 'package:intl/intl.dart';

//final client = Client().setEndpoint('http://sic.dse.co.tz:2022/v1').setProject('654a0a66e3c77037e8d5');

const projectId = "665b0e89ac828873c462";
const endPoint = 'http://sic.dse.co.tz:2024/v1';
final client = Client().setEndpoint(endPoint).setProject(projectId);
final account = Account(client);
final storage = Storage(client);
final databases = Databases(client);
const databaseId = "665b0e9aa0a612c7b621";
const bucketId = "665b621621fe75b05bf1";
const userProfileBucketId = "66a665a9d5904ef28492";
const userCollectionId = "665b1081ab0b253bb7fc";
const userProfilePhotoCollectionId = "66a664dc1b315438ebd5";
const countriesCollectionId = "665c43bf84a51a9d2a9b";
const gymCollectionId = "665b1325be4580400438";
const gymLikesCollectionId = "669ba0e0dbb99ad6f7ae";
const eventsCollectionId = "6688fbe8c22ab821a7ec";
const ratingCollectionId = "66951c681916bb99a2b4";
const reviewCollectionId = "6688c55d91442af1ad4a";
const gymReviewCollectionId = "66a6587a56394dba9bc4";
const checkInsCollectionId = "668ade0f623c62cb848f";
const subscriptionCollectionId = "668afc1faaeeb82ce065";
const checkUserFunctionId = "6662f457527cf9b20981";
const likeAgymFunctionId = "669bdc5d37a58d4294f8";
const createAccountFunctionId = "6666d7161154d3bbddae";
final formatter = NumberFormat("#,###", "en_US");