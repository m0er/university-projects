CREATE SEQUENCE seq_comment_id
START WITH 1
INCREMENT BY 1;

ALTER TABLE moerogComment DROP (
	admin_nickname, user_nickname
);

ALTER TABLE moerogComment ADD (
	writer VARCHAR2(10)
);

SELECT comment_id, comment_datetime, comment_content, post_id, writer FROM moerogComment;

SELECT comment_id as commentId, comment_datetime as commentDatetime, comment_content as commentContent, writer, post_id as postId
FROM moerogComment
WHERE post_id = 50
ORDER BY comment_id DESC;

DELETE FROM moerogComment
WHERE 1=1
AND comment_id = 10
AND post_id = 50
AND writer = 'mOer';

SELECT comment_id as commentId, comment_datetime as commentDatetime, comment_content as commentContent, 
writer, post_id as postId FROM moerogComment WHERE post_id = 50 ORDER BY comment_id DESC;

SELECT comment_id as commentId, comment_datetime as commentDatetime, comment_content as commentContent, writer, post_id as postId
FROM moerogComment
WHERE post_id = 51
ORDER BY comment_id ASC;

SELECT * FROM moerogPost;

SELECT *
FROM (
	SELECT * FROM moerogPost WHERE post_category = 1 ORDER BY post_id DESC
)
WHERE ROWNUM = 1;
