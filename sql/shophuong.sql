SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `cart` (`id`, `userId`, `productId`, `qty`, `productName`, `productPrice`, `productImage`) VALUES
(40, 1, 6, 1, 'Essex EUP-123EA1', '230000000', '4c301f519e.jpg');

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(2, 'ĐỒ HANDMADE', 1),
(4, 'ĐỒ HANDMADE TÁI CHẾ NHỰA', 1),
(5, 'ĐỒ HANDMADE TÁI CHẾ GIẤY', 1);

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `receivedDate` date DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `orders` (`id`, `userId`, `createdDate`, `receivedDate`, `status`) VALUES
(39, 31, '2024-02-27', '2024-02-27', 'Complete');

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `productPrice` decimal(10,0) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `order_details` (`id`, `orderId`, `productId`, `qty`, `productPrice`, `productName`, `productImage`) VALUES
(36, 39, 7, 2, '3190000', 'HOA TREO TƯỜNG', 'ban1 hoa.jpg'),
(37, 39, 4, 1, '749000000', 'ĐỒ HANDMADE TÁI CHẾ NHỰA ', 'nhua1.jpg'),
(38, 39, 8, 3, '19000000', 'ĐỒ HANDMADE TÁI CHẾ NHỰA 4', 'nhua4.jpg'),
(39, 39, 9, 4, '4200000', 'LỒNG ĐEN TRUNG THU', 'ban2 longden.jpeg');

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `originalPrice` decimal(10,0) NOT NULL,
  `promotionPrice` decimal(10,0) NOT NULL,
  `image` varchar(50) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdDate` date NOT NULL,
  `cateId` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `des` varchar(1000) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `soldCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `products` (`id`, `name`, `originalPrice`, `promotionPrice`, `image`, `createdBy`, `createdDate`, `cateId`, `qty`, `des`, `status`, `soldCount`) VALUES
(2, 'MÓC KHÓA TRÀ SỮA', '8000', '7000', 'ban6.jpg', 1, '2024-02-27', 2, 96, 'Móc khóa trà sữa.', 1, 4),
(3, 'HOA', '9500', '8500', 'ban3.jpg', 1, '2024-02-27', 2, 9, 'Hoa trang trí', 1, 1),
(4, 'LỒNG ĐÈN', '7400', '6900', 'ban2 longden.jpEg', 1, '2024-02-27', 2, 19, 'Lồng đèn con thỏ.', 1, 1),
(5, 'MÓC KHÓA CON VẬT', '9000', '8000', 'ban5.jpg', 1, '2024-02-27', 2, 8, 'Móc khóa con vật.', 1, 2),
(6, 'HOA TREO TƯỜNG', '40000', '30000', 'ban1 hoa.jpg', 1, '2024-02-27', 2, 7, 'Hoa treo tường.', 1, 3),
(7, 'ĐỒ HANDMADE TÁI CHẾ NHỰA 1 ', '31900', '21000', 'nhua1.jpg', 1, '2024-02-27', 4, 8, 'Đồ handmade tái chế từ nhựa.', 1, 2),
(8, 'ĐỒ HANDMADE TÁI CHẾ NHỰA 2', '19000', '10000', 'nhua2.jpg', 1, '2024-02-27', 4, 7, ' Đồ handmade tái chế từ nhựa.', 1, 3),
(9, 'ĐỒ HANDMADE TÁI CHẾ NHỰA 3', '9000', '8000', 'nhua3.jpg', 1, '2024-02-27', 4, 6, 'Đồ handmade tái chế từ nhựa.', 1, 4),
(10, 'ĐỒ HANDMADE TÁI CHẾ NHỰA 4', '40000', '30000', 'nhua4.jpg', 1, '2024-02-27', 4, 10, 'Đồ handmade tái chế từ nhựa.', 1, 0),
(11, 'ĐỒ HANDMADE TÁI CHẾ NHỰA 5', '30000', '21000', 'nhua5.jpg', 1, '2024-02-27', 4, 10, 'Đồ handmade tái chế từ nhựa.', 1, 0),
(12, 'ĐỒ HANDMADE TÁI CHẾ NHỰA 6', '34000', '30000', 'nhua6.jpg', 1, '2024-02-27', 4, 10, 'Đồ handmade tái chế từ nhựa.', 1, 0),
(13, 'ĐỒ HANDMADE GIẤY 1', '20000', '18000', 'giay1.jpg', 1, '2024-02-27', 5, 20, 'Đồ handmade tái chế từ giấy.', 1, 0),
(14, 'ĐỒ HANDMADE GIẤY 2', '19000', '15000', 'giay2.jpg', 1, '2024-02-27', 5, 15, 'Đồ handmade tái chế từ giấy.', 1, 0),
(15, 'ĐỒ HANDMADE GIẤY 3', '20000', '17000', 'giay3.jpg', 1, '2024-02-27', 5, 10, 'Đồ handmade tái chế từ giấy.', 1, 0),
(16, 'ĐỒ HANDMADE GIẤY 4', '24000', '20000', 'giay4.jpg', 1, '2024-02-27', 5, 10, 'Đồ handmade tái chế từ giấy.', 1, 0),
(17, 'ĐỒ HANDMADE GIẤY 5', '27000', '25000', 'giay5.jpg', 1, '2024-02-27', 5, 20, 'Đồ handmade tái chế từ giấy.', 1, 0),
(18, 'ĐỒ HANDMADE GIẤY 6', '19000', '17000', 'giay6.jpg', 1, '2024-02-27', 5, 5, 'Đồ handmade tái chế từ giấy.', 1, 0);

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Normal');

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `address` varchar(500) NOT NULL,
  `isConfirmed` tinyint(4) NOT NULL DEFAULT 0,
  `captcha` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`id`, `email`, `fullname`, `dob`, `password`, `role_id`, `status`, `address`, `isConfirmed`, `captcha`) VALUES
(1, 'admin@gmail.com', 'Nguyễn Lập An Khương', '2024-02-27', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '', 1, ''),
(31, 'lapankhuongnguyen@gmail.com', 'khuong nguyen', '2024-02-27', 'c4ca4238a0b923820dcc509a6f75849b', 2, 1, 'CanTho', 1, '56661');

ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `product_id` (`productId`);

ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`);

ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`orderId`),
  ADD KEY `product_id` (`productId`);

ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cateId`);

ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cateId`) REFERENCES `categories` (`id`);

ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;
