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
import { ContentResponse } from './contentResponse';
import { QuizQuestionResponse } from './quizQuestionResponse';

export interface QuizContentResponse extends ContentResponse { 
    id?: number;
    contentType?: QuizContentResponse.ContentTypeEnum;
    questions?: Array<QuizQuestionResponse>;
}
export namespace QuizContentResponse {
    export type ContentTypeEnum = 'QUIZ';
    export const ContentTypeEnum = {
        QUIZ: 'QUIZ' as ContentTypeEnum
    };
}