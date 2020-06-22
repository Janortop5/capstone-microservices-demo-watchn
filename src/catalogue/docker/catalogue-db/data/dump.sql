CREATE USER IF NOT EXISTS 'catalogue_user' IDENTIFIED BY 'default_password';

GRANT ALL ON socksdb.* TO 'catalogue_user';

CREATE TABLE IF NOT EXISTS sock (
	sock_id varchar(40) NOT NULL, 
	name varchar(20), 
	description varchar(200), 
	price float, 
	count int, 
	image_url_1 varchar(40), 
	image_url_2 varchar(40), 
	PRIMARY KEY(sock_id)
);

CREATE TABLE IF NOT EXISTS tag (
	tag_id MEDIUMINT NOT NULL AUTO_INCREMENT, 
	name varchar(20),
  display_name varchar(20), 
	PRIMARY KEY(tag_id)
);

CREATE TABLE IF NOT EXISTS sock_tag (
	sock_id varchar(40), 
	tag_id MEDIUMINT NOT NULL, 
	FOREIGN KEY (sock_id) 
		REFERENCES sock(sock_id), 
	FOREIGN KEY(tag_id)
		REFERENCES tag(tag_id)
);

INSERT INTO sock VALUES ("6d62d909-f957-430e-8689-b5129c0bb75e", "Pocket Watch", "Properly dapper.", 385.00, 33, "/catalogue/images/pocket_watch.jpg", "/catalogue/images/pocket_watch.jpg");
INSERT INTO sock VALUES ("a0a4f044-b040-410d-8ead-4de0446aec7e", "Wood Watch", "Looks like a tree", 50.99, 115, "/catalogue/images/wood_watch.jpg", "/catalogue/images/wood_watch.jpg");
INSERT INTO sock VALUES ("808a2de1-1aaa-4c25-a9b9-6612e8f29a38", "Chronograf Classic", "Spend that IPO money",  5100.00, 9, "/catalogue/images/chrono_classic.jpg", "/catalogue/images/chrono_classic.jpg");
INSERT INTO sock VALUES ("510a0d7e-8e83-4193-b483-e27e09ddc34d", "Gentleman", "Touch of class for a bargain.",  795.00, 62, "/catalogue/images/gentleman.jpg", "/catalogue/images/gentleman.jpg");

INSERT INTO tag (name, display_name) VALUES ("smart", "Smart");
INSERT INTO tag (name, display_name) VALUES ("dress", "Dress");
INSERT INTO tag (name, display_name) VALUES ("luxury", "Luxury");
INSERT INTO tag (name, display_name) VALUES ("casual", "Casual");

INSERT INTO sock_tag VALUES ("6d62d909-f957-430e-8689-b5129c0bb75e", "1");
INSERT INTO sock_tag VALUES ("a0a4f044-b040-410d-8ead-4de0446aec7e", "4");
INSERT INTO sock_tag VALUES ("808a2de1-1aaa-4c25-a9b9-6612e8f29a38", "2");
INSERT INTO sock_tag VALUES ("808a2de1-1aaa-4c25-a9b9-6612e8f29a38", "3");
INSERT INTO sock_tag VALUES ("510a0d7e-8e83-4193-b483-e27e09ddc34d", "2");