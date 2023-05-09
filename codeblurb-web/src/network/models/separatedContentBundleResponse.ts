/**
 * CodeBlurb API
 * No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)
 *
 * OpenAPI spec version: v1
 * 
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 */
import { CodingContentResponse } from './codingContentResponse';
import { QuizContentResponse } from './quizContentResponse';
import { VideoContentResponse } from './videoContentResponse';

export interface SeparatedContentBundleResponse { 
    includedVideos?: Array<VideoContentResponse>;
    includedCodings?: Array<CodingContentResponse>;
    includedQuizzes?: Array<QuizContentResponse>;
}