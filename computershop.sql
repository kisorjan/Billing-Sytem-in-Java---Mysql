-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2017 at 05:32 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.5.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `computershop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(2, 'admin', 'Vez0BHLkecQ=');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `cashier` varchar(100) NOT NULL,
  `accessdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `holds`
--

CREATE TABLE `holds` (
  `id` int(11) NOT NULL,
  `accessuser` varchar(100) NOT NULL,
  `accessdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `holds_items`
--

CREATE TABLE `holds_items` (
  `id` int(11) NOT NULL,
  `holdno` int(11) NOT NULL,
  `itemcode` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `qty` double NOT NULL,
  `salesprice` double NOT NULL,
  `suptotal` double NOT NULL,
  `accessuser` varchar(20) NOT NULL,
  `accessdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `holds_items`
--

INSERT INTO `holds_items` (`id`, `holdno`, `itemcode`, `description`, `qty`, `salesprice`, `suptotal`, `accessuser`, `accessdate`, `status`) VALUES
(1, 1, '1', 'dell mouse', 1, 300, 300, 'Administrator', '2017-08-09 06:03:42', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoiceno` bigint(20) NOT NULL,
  `total_items` double NOT NULL,
  `invoice_bill` double NOT NULL,
  `discounts` double DEFAULT NULL,
  `bill_amount` double NOT NULL,
  `accessuser` varchar(100) NOT NULL,
  `accessdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoiceno`, `total_items`, `invoice_bill`, `discounts`, `bill_amount`, `accessuser`, `accessdate`, `status`) VALUES
(1, 1, 300, 15, 285, 'Administrator', '2017-08-09 06:06:23', 1),
(2, 1, 60, 1.2, 58.8, 'Administrator', '2017-08-15 05:15:43', 1),
(3, 1, 60, 0, 60, 'null', '2017-08-15 05:22:29', 1),
(4, 1, 60, 0, 60, 'Administrator', '2017-08-15 05:25:48', 1),
(5, 1, 60, 0, 60, 'Administrator', '2017-08-15 05:28:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint(20) NOT NULL,
  `invoiceno` bigint(20) NOT NULL,
  `itemcode` bigint(20) NOT NULL,
  `qty` double NOT NULL,
  `salesprice` double NOT NULL,
  `accessuser` varchar(100) NOT NULL,
  `accessdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `invoiceno`, `itemcode`, `qty`, `salesprice`, `accessuser`, `accessdate`) VALUES
(1, 1, 1, 1, 300, 'Administrator', '2017-08-09 06:06:23'),
(2, 2, 2, 1, 60, 'Administrator', '2017-08-15 05:15:43'),
(3, 3, 2, 1, 60, 'null', '2017-08-15 05:22:29'),
(4, 4, 2, 1, 60, 'Administrator', '2017-08-15 05:25:48'),
(5, 5, 2, 1, 60, 'Administrator', '2017-08-15 05:28:47');

-- --------------------------------------------------------

--
-- Table structure for table `item_categorys`
--

CREATE TABLE `item_categorys` (
  `id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_categorys`
--

INSERT INTO `item_categorys` (`id`, `description`) VALUES
(1, 'Keyboard'),
(2, 'Mouse'),
(3, 'Mother Board'),
(4, 'Ram'),
(5, 'PC'),
(6, 'Laptops'),
(7, 'Hard disk'),
(8, 'Web Camera'),
(9, 'Speaker'),
(10, 'VGA Card'),
(11, 'Network Card\r\n'),
(12, 'Sound Card');

-- --------------------------------------------------------

--
-- Table structure for table `item_master`
--

CREATE TABLE `item_master` (
  `id` bigint(20) NOT NULL,
  `itemcode` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `notes` varchar(100) NOT NULL,
  `dateadded` date NOT NULL,
  `purchaseprice` double NOT NULL,
  `salesprice` double NOT NULL,
  `barcode` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `accessUser` varchar(100) NOT NULL,
  `accessDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_master`
--

INSERT INTO `item_master` (`id`, `itemcode`, `description`, `category`, `stock`, `notes`, `dateadded`, `purchaseprice`, `salesprice`, `barcode`, `status`, `accessUser`, `accessDate`) VALUES
(3, 1, 'dell mouse', 'Mouse', 29, 'serial no - 300256', '2017-08-09', 250, 300, '1616', 1, 'Administrator', '2017-08-09 06:06:28'),
(4, 2, 'dfsaf', 'VGA Card', 23, 'dgtdfr', '2017-08-11', 50, 60, '1212', 0, 'Administrator', '2017-08-15 05:28:48'),
(6, 3, 'mouse', 'PC', 197, 'sdf', '2017-08-11', 600, 650, '1234', 1, 'Administrator', '2017-08-11 17:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` bigint(20) NOT NULL,
  `orderno` int(11) NOT NULL,
  `orderdate` date NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `itemcode` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `costprice` double NOT NULL,
  `qty` double NOT NULL,
  `status` int(11) NOT NULL,
  `receive_status` int(11) NOT NULL,
  `accessuser` varchar(100) NOT NULL,
  `accessdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `orderno`, `orderdate`, `supplier`, `itemcode`, `description`, `costprice`, `qty`, `status`, `receive_status`, `accessuser`, `accessdate`) VALUES
(1, 1, '2017-08-09', 'rihan', 1, 'dell mouse', 120, 100, 1, 1, 'Administrator', '2017-08-09 05:55:06'),
(2, 2, '2017-08-11', 'Aslam ', 3, 'mouse', 120, 140, 1, 1, 'Administrator', '2017-08-11 17:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `pay_bills`
--

CREATE TABLE `pay_bills` (
  `invoiceno` bigint(20) NOT NULL,
  `billamount` double NOT NULL,
  `cash` double NOT NULL,
  `balance` double NOT NULL,
  `accessdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cashier` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pay_bills`
--

INSERT INTO `pay_bills` (`invoiceno`, `billamount`, `cash`, `balance`, `accessdate`, `cashier`) VALUES
(5, 60, 70, 10, '2017-08-15 05:28:49', 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `receive_stock`
--

CREATE TABLE `receive_stock` (
  `id` bigint(20) NOT NULL,
  `orderno` int(11) NOT NULL,
  `date` date NOT NULL,
  `itemcode` int(11) NOT NULL,
  `qty` double NOT NULL,
  `price` double NOT NULL,
  `subtotal` double NOT NULL,
  `cashier` varchar(100) NOT NULL,
  `accessdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receive_stock`
--

INSERT INTO `receive_stock` (`id`, `orderno`, `date`, `itemcode`, `qty`, `price`, `subtotal`, `cashier`, `accessdate`) VALUES
(1, 1, '2017-08-09', 1, 120, 100, 12000, 'Administrator', '2017-08-09 05:55:06'),
(3, 2, '2017-08-11', 3, 120, 140, 16800, 'null', '2017-08-11 17:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `returns_stock`
--

CREATE TABLE `returns_stock` (
  `id` int(11) NOT NULL,
  `returndate` date NOT NULL,
  `itemcode` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `accessuser` varchar(100) NOT NULL,
  `accesstime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `returns_stock`
--

INSERT INTO `returns_stock` (`id`, `returndate`, `itemcode`, `stock`, `accessuser`, `accesstime`) VALUES
(1, '2017-08-09', '1', 30, 'Administrator', '2017-08-09 05:46:50'),
(2, '2017-08-10', '3', 15, 'Administrator', '2017-08-11 16:56:42'),
(3, '2017-08-11', '3', 10, 'null', '2017-08-11 17:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `shop_details`
--

CREATE TABLE `shop_details` (
  `id` int(11) NOT NULL,
  `shopname` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `telephone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shop_details`
--

INSERT INTO `shop_details` (`id`, `shopname`, `address`, `city`, `telephone`) VALUES
(1, 'Mater Mind Computer Shop', '120/Main Street,Kalmunai,Sri-Lanka', 'Kalmunai', '0756894323');

-- --------------------------------------------------------

--
-- Table structure for table `stock_transections`
--

CREATE TABLE `stock_transections` (
  `id` bigint(20) NOT NULL,
  `itemcode` varchar(100) NOT NULL,
  `curqty` int(11) NOT NULL,
  `saleqty` int(11) NOT NULL,
  `remqty` int(11) NOT NULL,
  `transection` varchar(100) NOT NULL,
  `accessuser` varchar(100) NOT NULL,
  `accessdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_transections`
--

INSERT INTO `stock_transections` (`id`, `itemcode`, `curqty`, `saleqty`, `remqty`, `transection`, `accessuser`, `accessdate`) VALUES
(1, '1', 30, 1, 29, 'Invoice', 'Administrator', '2017-08-09 06:06:27'),
(2, '2', 30, 1, 29, 'Invoice', 'Administrator', '2017-08-15 05:15:45'),
(3, '2', 29, 1, 28, 'Invoice', 'Administrator', '2017-08-15 05:19:59'),
(4, '2', 28, 1, 27, 'Invoice', 'null', '2017-08-15 05:22:31'),
(5, '2', 27, 1, 26, 'Invoice', 'null', '2017-08-15 05:24:24'),
(6, '2', 26, 1, 25, 'Invoice', 'null', '2017-08-15 05:25:21'),
(7, '2', 25, 1, 24, 'Invoice', 'Administrator', '2017-08-15 05:25:49'),
(8, '2', 24, 1, 23, 'Invoice', 'Administrator', '2017-08-15 05:28:48');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_master`
--

CREATE TABLE `supplier_master` (
  `recid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `telephone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fax` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `accessuser` varchar(100) NOT NULL,
  `accessdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_master`
--

INSERT INTO `supplier_master` (`recid`, `id`, `name`, `address`, `city`, `telephone`, `email`, `fax`, `mobile`, `accessuser`, `accessdate`, `status`) VALUES
(1, 1, 'aslam', 'jhg', 'hjg', '', '', '', '', '', '2017-08-09 05:50:44', 0),
(2, 2, 'aslam', 'sammanthurai', 'sam', '0756851235', '0677245454', 'ksfwew@gamil.com', '7892472415', 'Administrator', '2017-08-09 06:11:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `accessuser` varchar(100) NOT NULL,
  `accessdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `phone`, `username`, `password`, `accessuser`, `accessdate`, `status`) VALUES
(1, 'kisorjan', '0756894323', 'kisor', 'ToV+ElBiqoI=', 'Administrator', '2017-08-09 05:14:00', 1),
(2, 'thuwan', '07545674211', 'thuwan', 'jauUyafXj1M=', 'Administrator', '2017-08-09 06:13:48', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holds`
--
ALTER TABLE `holds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holds_items`
--
ALTER TABLE `holds_items`
  ADD PRIMARY KEY (`id`,`holdno`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoiceno`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`,`invoiceno`),
  ADD KEY `invoiceno` (`invoiceno`);

--
-- Indexes for table `item_categorys`
--
ALTER TABLE `item_categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_master`
--
ALTER TABLE `item_master`
  ADD PRIMARY KEY (`id`,`itemcode`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_bills`
--
ALTER TABLE `pay_bills`
  ADD PRIMARY KEY (`invoiceno`);

--
-- Indexes for table `receive_stock`
--
ALTER TABLE `receive_stock`
  ADD PRIMARY KEY (`id`,`orderno`);

--
-- Indexes for table `returns_stock`
--
ALTER TABLE `returns_stock`
  ADD PRIMARY KEY (`id`,`returndate`);

--
-- Indexes for table `shop_details`
--
ALTER TABLE `shop_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_transections`
--
ALTER TABLE `stock_transections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_master`
--
ALTER TABLE `supplier_master`
  ADD PRIMARY KEY (`recid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `holds`
--
ALTER TABLE `holds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `holds_items`
--
ALTER TABLE `holds_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoiceno` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `item_categorys`
--
ALTER TABLE `item_categorys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `item_master`
--
ALTER TABLE `item_master`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `receive_stock`
--
ALTER TABLE `receive_stock`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `returns_stock`
--
ALTER TABLE `returns_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `shop_details`
--
ALTER TABLE `shop_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `stock_transections`
--
ALTER TABLE `stock_transections`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `supplier_master`
--
ALTER TABLE `supplier_master`
  MODIFY `recid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_ibfk_1` FOREIGN KEY (`invoiceno`) REFERENCES `invoices` (`invoiceno`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
