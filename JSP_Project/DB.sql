CREATE TABLE IF NOT EXISTS member (
	id VARCHAR(20) NOT NULL,
	passwd VARCHAR(20),
	email VARCHAR(30),
	PRIMARY KEY (id)
);
select * from member;

ALTER TABLE member
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

