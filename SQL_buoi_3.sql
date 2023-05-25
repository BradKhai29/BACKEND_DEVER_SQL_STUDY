CREATE DATABASE MY_SHOP;
-- PK : primary key
-- FK : foreign key
/* 
    Quy ước khi đặt tên cho Primary Key : <Tên bảng> + ID
        VD: brandID, productID, customerID  

    Cách đặt tên này sẽ rõ ràng hơn so vs cách đặt tên ngắn gọn là : id
*/

CREATE TABLE Brand
(
    brandID INT UNIQUE,
    brandName VARCHAR(50),
    CONSTRAINT Brand_PK PRIMARY KEY (brandID)
);

CREATE TABLE Product
(
    productID INT UNIQUE,
    brandID INT,
    price INT,
    productName VARCHAR(50),
    isAvailable BOOLEAN,
    CONSTRAINT Product_PK PRIMARY KEY (productID),
    CONSTRAINT Product_Brand_FK FOREIGN KEY (brandID) REFERENCES Brand (brandID)
);

CREATE TABLE Customer
(
    customerID INT UNIQUE,
    fullName VARCHAR(60),
    phoneNumber VARCHAR(12),
    email VARCHAR(30),
    CONSTRAINT Customer_PK PRIMARY KEY (customerID)
);

CREATE TABLE OrderProduct
(
    orderID INT UNIQUE,
    customerID INT,
    createdAt DATE,
    totalAmount INT,
    CONSTRAINT Order_PK PRIMARY KEY (orderID),
    CONSTRAINT Order_Customer_FK FOREIGN KEY (customerID) REFERENCES Customer (customerID)
);


CREATE TABLE OrderDetail
(
    orderID int,
    productID INT,
    quantity INT,
    constraint Detail_PK PRIMARY KEY (orderID, productID),
    CONStraint Order_FK FOREIGN KEY (orderID) REFERENCES OrderProduct (orderID),
    CONStraint Order_product_FK FOREIGN KEY (productID) REFERENCES Product (productID)
);

/*
Lý do chi tiết hóa đơn (OrderDetail) có primary key hợp bởi 2 key là productID, orderID
Lấy ví dụ: 1 Hóa đơn có mã : I001, mua 2 ly Latte đá, 3 ly cà phê đen
 + mã latte đá   : latte
 + mã cà phê đen : caphe

    Thì hóa đơn chi tiết khi lưu trong database sẽ như sau
    -------------------------------------------
    |mã hóa đơn | mã sản phẩm | số lượng (ly) |
    |-----------------------------------------|
    |I001       | latte       | 2             |
    |I001       | caphe       | 3             |
    -------------------------------------------
*/
