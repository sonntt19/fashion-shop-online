create database Fashion_Shop_Online
go

use Fashion_Shop_Online
go

create table [Role](
	role_id int identity(1,1) primary key,
	role_name varchar(50) not null
)
go

create table [User](
	userId int identity(1,1) primary key,
	fullName nvarchar(50),
	[password] varchar(50),
	avatar varchar(max),
	gender bit,
	email varchar(50),
	mobile varchar(50),
	[address] nvarchar(255),
	[status] bit, 
    role_id int,
	foreign key(role_id) references [Role](role_id)
)
go

create table Slider(
	slider_id int identity(1,1) primary key,
	slider_title nvarchar(50),
	slider_image varchar(max),
	backlink varchar(max),
	note nvarchar(255),
	[status] bit,
	updated_by int,
	FOREIGN KEY(updated_by) REFERENCES [User](userId),
)
go

create table Category(
	category_id int identity(1,1) primary key,
	category_name nvarchar(50)
)
go

create table Product(
	product_id int identity(1,1) primary key,
	product_name nvarchar(255),
	original_prices float,
	sale_prices float,
	product_details nvarchar(max),
	brief_infor nvarchar(255),
	[status] bit,
	quantity int,
    category_id int,
	foreign key(category_id) references Category(category_id)
 )
 go

 create table Product_Size(
	size varchar(20),
	product_id int,
	FOREIGN KEY(product_id) REFERENCES Product(product_id)
 )
 go

 create table Product_Color(
	color varchar(20),
	product_id int,
	FOREIGN KEY(product_id) REFERENCES Product(product_id)
 )
 go

 create table Products_Images(
	products_images_id int identity(1,1) primary key,
	product_id int,
	images varchar(max),
	FOREIGN KEY(product_id) REFERENCES Product(product_id),
 )
 go



 create table [Order](
	order_id int identity(1,1) primary key,
	orderDate date,
	total_cost float,
	fullName nvarchar(50),
	mobile varchar(50),
	[address] nvarchar(255),
	status_order varchar(20),
	userId int,
	FOREIGN KEY(userId) REFERENCES [User](userId),
 )
 go

 create table Order_Detail(
	orderDetail_id int identity(1,1) primary key,
	prices float,
	quantity int,
	order_id int,
	product_id int,
	FOREIGN KEY(product_id) REFERENCES Product(product_id),
	FOREIGN key(order_id) references [Order](order_id),
 )
 go

 create table Feedback(
	feedBack_id int identity(1,1) primary key,
	fullName nvarchar(50),
	rated_star float,
	feedback nvarchar(max),
	image_status varbinary(max),
	[status] bit,
	product_id int,
	userId int,
	foreign key(product_id) references Product(product_id),
	foreign key(userId) references [User](userId)
 )
 go

 create table Category_Blog(
	categoryBlog_id int identity(1,1) primary key,
	categoryBlog_name nvarchar(50)
 )
 go

 create table Blog(
	blog_id int identity(1,1) primary key,
	title nvarchar(50),
	author_id int,
	updated_date date,
	content nvarchar(max),
	thumbnail text,
	brief_infor nvarchar(255),
	categoryBlog_id int,
	foreign key (categoryBlog_id) references Category_Blog(categoryBlog_id),
	foreign key(author_id) references [User](userId)
 )
 go
 create table Update_Customer(
	updateCustomer_id int identity(1,1) primary key,
	email varchar(50),
	fullName nvarchar(50),
	gender bit,	
	mobile varchar(50),
	[address] nvarchar(255),
	update_date date,
	update_by int,
	FOREIGN KEY(update_by) REFERENCES [User](userID),
 )
 go



ALTER TABLE Blog
ADD CONSTRAINT fk_Blog_author_id
FOREIGN KEY (author_id)
REFERENCES [User](userId);
go

