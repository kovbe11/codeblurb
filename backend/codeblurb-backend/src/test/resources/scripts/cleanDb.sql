SET
    REFERENTIAL_INTEGRITY FALSE;
TRUNCATE TABLE coding_content;
TRUNCATE TABLE coding_content_code_skeleton;
TRUNCATE TABLE coding_content_code_snippets;
TRUNCATE TABLE coding_content_test_cases;
TRUNCATE TABLE content;
TRUNCATE TABLE content_bundle;
TRUNCATE TABLE content_bundle_included_content;
TRUNCATE TABLE customer;
TRUNCATE TABLE customer_payments;
TRUNCATE TABLE issued_token;
TRUNCATE TABLE logged_out_token;
TRUNCATE TABLE payment;
TRUNCATE TABLE payment_content_bundles_bought;
TRUNCATE TABLE quiz_content;
TRUNCATE TABLE quiz_question;
TRUNCATE TABLE quiz_question_answers;
TRUNCATE TABLE shopping_cart;
TRUNCATE TABLE shopping_cart_items;
TRUNCATE TABLE shopping_item;
TRUNCATE TABLE test_case;
TRUNCATE TABLE test_case_hints;
TRUNCATE TABLE video_content;
SET
REFERENTIAL_INTEGRITY TRUE;