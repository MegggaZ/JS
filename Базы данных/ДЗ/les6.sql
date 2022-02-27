use vk;

SELECT 
	COUNT(id) AS quantity_messages
	FROM messages WHERE from_user_id (SELECT * FROM friend_requests WHERE (initiation_user_id=1 or target_user_id=1) AND status='approved')
GROUP BY id
ORDER BY quantity_messages;

