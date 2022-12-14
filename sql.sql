USE [master]
GO
/****** Object:  Database [Wish]    Script Date: 8/16/2022 11:10:52 PM ******/
CREATE DATABASE [Wish]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Wish', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Wish.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Wish_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Wish_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Wish] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Wish].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Wish] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Wish] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Wish] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Wish] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Wish] SET ARITHABORT OFF 
GO
ALTER DATABASE [Wish] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Wish] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Wish] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Wish] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Wish] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Wish] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Wish] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Wish] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Wish] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Wish] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Wish] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Wish] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Wish] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Wish] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Wish] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Wish] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Wish] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Wish] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Wish] SET  MULTI_USER 
GO
ALTER DATABASE [Wish] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Wish] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Wish] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Wish] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Wish] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Wish] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Wish] SET QUERY_STORE = OFF
GO
USE [Wish]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 8/16/2022 11:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
	[Email] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[block] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buyer]    Script Date: 8/16/2022 11:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buyer](
	[bID] [int] IDENTITY(1,1) NOT NULL,
	[First Name] [varchar](255) NULL,
	[Last Name] [varchar](255) NULL,
	[Phone] [int] NULL,
	[Email] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[sellid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/16/2022 11:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 8/16/2022 11:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[AccountID] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[sell_ID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 8/16/2022 11:10:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
	[block] [int] NULL,
	[nview] [int] NULL,
 CONSTRAINT [PK__product__3213E83F36F40A89] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([uID], [user], [pass], [isSell], [isAdmin], [Email], [phone], [block]) VALUES (1, N'admin', N'123', 1, 1, N'admin@fpt.edu.vn', N'321312313', 0)
INSERT [dbo].[Accounts] ([uID], [user], [pass], [isSell], [isAdmin], [Email], [phone], [block]) VALUES (2, N'hoang anh', N'123', 1, 1, N'sdadsda@fasddf.com', N'4324324234', 0)
INSERT [dbo].[Accounts] ([uID], [user], [pass], [isSell], [isAdmin], [Email], [phone], [block]) VALUES (3, N'ngoc thanh', N'321', 0, 0, N'sdadsda@fasddf.com', N'423423423', 0)
INSERT [dbo].[Accounts] ([uID], [user], [pass], [isSell], [isAdmin], [Email], [phone], [block]) VALUES (4, N'duy khanh', N'HWV8ZN', 0, 0, N'jdhjs@adsd.com', N'423423423', 0)
INSERT [dbo].[Accounts] ([uID], [user], [pass], [isSell], [isAdmin], [Email], [phone], [block]) VALUES (5, N'sa1', N'NPX7OF', 0, 0, N'jdhjs@adsd.com', N'423423423', 0)
INSERT [dbo].[Accounts] ([uID], [user], [pass], [isSell], [isAdmin], [Email], [phone], [block]) VALUES (6, N'sa2 123', N'WIZ5VZ', 120000, 1, N'jdhjs@adsd.com', N'423423423', 0)
INSERT [dbo].[Accounts] ([uID], [user], [pass], [isSell], [isAdmin], [Email], [phone], [block]) VALUES (7, N'sa3', N'ZSW2LU', 0, 1, N'jdhjs@adsd.com', N'423423423', 0)
INSERT [dbo].[Accounts] ([uID], [user], [pass], [isSell], [isAdmin], [Email], [phone], [block]) VALUES (8, N'sa4', N'RVV5SR', 0, 0, N'jdhjs@adsd.com', N'423423423', 0)
INSERT [dbo].[Accounts] ([uID], [user], [pass], [isSell], [isAdmin], [Email], [phone], [block]) VALUES (9, N'sa5', N'VAI6XR', 0, 3, N'jdhjs@adsd.com', N'423423423', 0)
INSERT [dbo].[Accounts] ([uID], [user], [pass], [isSell], [isAdmin], [Email], [phone], [block]) VALUES (10, N'sa6', N'DNX6JK', 0, 0, N'jdhjs@adsd.com', N'423423423', 0)
INSERT [dbo].[Accounts] ([uID], [user], [pass], [isSell], [isAdmin], [Email], [phone], [block]) VALUES (71, N'sa7', N'12345', 0, 0, N'lenovo12dasds3@gmail.com', N'4234324', 0)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Buyer] ON 

INSERT [dbo].[Buyer] ([bID], [First Name], [Last Name], [Phone], [Email], [Address], [sellid]) VALUES (71, N'Dong Sy', N'Nguen', 975259570, N'nguyensydong2000@gmail.com', N'Nghe An', NULL)
SET IDENTITY_INSERT [dbo].[Buyer] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'LAMBORGHINI')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'ROLLS ROYCE')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'FERRARI')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'VINFAST')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (5, N'TOYOTA')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (6, N'TESLA')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (7, N'KIA')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([AccountID], [id], [name], [image], [price], [sell_ID]) VALUES (71, 50, N'Ferrari 3', N'https://storage.googleapis.com/f1-cms/2020/08/d173f63a-20200818_091531.png', 1000000.0000, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (3, N'Lamborghini Huracan Sto', N'https://vcdn1-vnexpress.vnecdn.net/2020/11/19/lamborghini-huracan-sto-160577-6122-9252-1605777840.jpg?w=900&h=540&q=100&dpr=1&fit=crop&s=YrGcwGA6esan91ZDwYanEg', 996000.0000, N'Lamborghini just launched the Huracan STO. According to Lamborghini, the Huracan STO has the perfect combination of power, aerodynamics and mass. Lamborghini''s latest super cow is considered to be the best performance racing supercar in the world.', N'Lamborghini just launched the Huracan STO. According to Lamborghini, the Huracan STO has the perfect combination of power, aerodynamics and mass. Lamborghini''s latest super cow is considered to be the best performance racing supercar in the world.', 1, 7, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (4, N'Rolls Royce Ghost234', N'https://vcdn-vnexpress.vnecdn.net/2020/09/02/2021-Rolls-ROyce-Ghost-3-3617-1599022529.jpg', 1500000.0000, N'Rolls Royce Ghost with the first version was released to the public in 2010. Is the most successful car in the history of Rolls Royce. So far, after 10 years on the market, the luxury automaker Rolls Royce introduced the second generation of Ghost sedans in September 2020. The new generation has many new upgrades from exterior to interior. Ghost 2021 has 03 versions including standard, Black Badge and extended wheelbase (EWB).', N'Rolls Royce Ghost with the first version was released to the public in 2010. Is the most successful car in the history of Rolls Royce. So far, after 10 years on the market, the luxury automaker Rolls Royce introduced the second generation of Ghost sedans in September 2020. The new generation has many new upgrades from exterior to interior. Ghost 2021 has 03 versions including standard, Black Badge and extended wheelbase (EWB).', 2, 1, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (6, N'Rolls Royce Phantom', N'https://vnn-imgs-f.vgcloud.vn/2019/12/28/17/2019-rolls-royce-phantom-6.jpg', 2600000.0000, N'The Rolls Royce Phantom is a large luxury sports car produced by Rolls Royce', N'The Rolls Royce Phantom is a large luxury sports car produced by Rolls Royce', 2, 7, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (7, N'Lamborghini Huracan Evo', N'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2021-lamborghini-huracan-evo-mmp-1-1600293029.jpg', 1200000.0000, N'Huracan EVO is an upgrade of the Huracan Performante, debuted in early 2019 in Coupe format. After that, the EVO Spyder convertible version was also released in early 2020. With the changed design, the upgraded engine and a series of other assistive technologies, the Lamborghini Huracan EVO 2021 super sports car became strong. stronger and more modern. Exterior with many new points.', N'Huracan EVO is an upgrade of the Huracan Performante, debuted in early 2019 in Coupe format. After that, the EVO Spyder convertible version was also released in early 2020. With the changed design, the upgraded engine and a series of other assistive technologies, the Lamborghini Huracan EVO 2021 super sports car became strong. stronger and more modern. Exterior with many new points.', 1, 14, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (8, N'Vinfast President', N'https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwfd31fe7f/images/President/CE16.png', 200000.0000, N'VinFast President là mẫu xe phát triển từ dòng xe Lux SA2.0 và được định vị để trở thành một dòng xe đặc biệt nhắm tới những người Việt Nam thành đạt, tiên phong. Mẫu xe mới này sẽ chỉ được sản xuất giới hạn 500 chiếc và dành riêng cho thị trường Việt Nam. ', N'VinFast President là mẫu xe phát triển từ dòng xe Lux SA2.0 và được định vị để trở thành một dòng xe đặc biệt nhắm tới những người Việt Nam thành đạt, tiên phong. Mẫu xe mới này sẽ chỉ được sản xuất giới hạn 500 chiếc và dành riêng cho thị trường Việt Nam. ', 4, 15, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (9, N'Ferrari 488 Spider', N'https://baoquocte.vn/stores/news_dataimages/dangtuan/102020/15/14/bang-gia-xe-ferrari-2020-tai-viet-nam-moi-nhat-thang-102020_6.jpg?rt=20201015144127', 800000.0000, N'Ferrari 488 Spider is the most powerful V8 mid-engined sports car of the Ferrari family. With the same specifications as the couple that was released six months ago, the 488 Spider is equipped with a V8, twin-turbocharged, 3.9-liter cylinder capacity capable of producing a maximum capacity of 660. horse power. Super car can accelerate from 0 to 100 km / h in just 3 seconds and from 0 to 200 km / h in 8.7 seconds.', N'Ferrari 488 Spider is the most powerful V8 mid-engined sports car of the Ferrari family. With the same specifications as the couple that was released six months ago, the 488 Spider is equipped with a V8, twin-turbocharged, 3.9-liter cylinder capacity capable of producing a maximum capacity of 660. horse power. Super car can accelerate from 0 to 100 km / h in just 3 seconds and from 0 to 200 km / h in 8.7 seconds.', 3, 14, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (10, N'Vinfast Lux SA 2.0', N'https://vinfastchevroletnewway.com.vn/wp-content/uploads/2019/09/sa-orange-169.jpg', 46800.0000, N'VinFast Lux SA2.0 là mẫu xe thể thao đa dụng sang trọng (Luxury SUV) 7 chỗ đến từ thương hiệu Việt - hãng xe VinFast. Lux SA2.0 được giới thiệu lần đầu tiên tại Triển lãm xe hơi Paris 2018, và chính thức đi vào lắp ráp - sản xuất tại Việt Nam từ năm 2019.', N'VinFast Lux SA2.0 là mẫu xe thể thao đa dụng sang trọng (Luxury SUV) 7 chỗ đến từ thương hiệu Việt - hãng xe VinFast. Lux SA2.0 được giới thiệu lần đầu tiên tại Triển lãm xe hơi Paris 2018, và chính thức đi vào lắp ráp - sản xuất tại Việt Nam từ năm 2019.', 4, 15, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (11, N'Ferrari F8 Tributo', N'https://autopress.vn/uploads/userfiles/images/news_1555951599/Ferrari-F8-Tributo-launch-1-1200x628.jpg', 996000.0000, N'The Ferrari F8 Tributo is a mid-engine sports car from the Italian automaker Ferrari. F8 Tributo debuted at the Geneva Motor Show in March 2019 to replace the Ferrari 488 GTB.', N'The Ferrari F8 Tributo is a mid-engine sports car from the Italian automaker Ferrari. F8 Tributo debuted at the Geneva Motor Show in March 2019 to replace the Ferrari 488 GTB.', 3, 17, 0, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (12, N'Ferrari F8 Tributo Red', N'https://cms-i.autodaily.vn/du-lieu/2019/03/01/ferrari-f8-tributo-lo-dien-2.jpg', 1000000.0000, N'RED FERRARI F8 TRIBUTO: Sleek and voluptuous, the 2020 Ferrari F8 Tributo is the new supercar to choose if you like your automotive performance packaged in an undeniably glamorous wrapper', N'RED FERRARI F8 TRIBUTO: Sleek and voluptuous, the 2020 Ferrari F8 Tributo is the new supercar to choose if you like your automotive performance packaged in an undeniably glamorous wrapper', 3, 19, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (13, N'Ferrari Ferrari 488 GTB', N'https://cdn.dicklovett.co.uk/uploads/used_stock_image/1_427163_ns.jpg?v=1605283220', 750000.0000, N'Ferrari 488 GTB sử dụng động cơ tăng áp kép V8 3.9L, sản sinh công suất 660 mã lực và mô-men xoắn 760 Nm. Siêu xe có thể tăng tốc 0-100 km/h trong 3 giây trước khi đạt tốc độ tối đa 330 km/h.', N'Ferrari 488 GTB sử dụng động cơ tăng áp kép V8 3.9L, sản sinh công suất 660 mã lực và mô-men xoắn 760 Nm. Siêu xe có thể tăng tốc 0-100 km/h trong 3 giây trước khi đạt tốc độ tối đa 330 km/h.', 3, 18, 0, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (15, N'Vinfast President V8', N'https://media.baodautu.vn/Images/phuongthanh/2020/08/12/1.jpg', 210000.0000, N'VinFast President là mẫu xe phát triển từ dòng xe Lux SA2.0 và được định vị để trở thành một dòng xe đặc biệt nhắm tới những người Việt Nam thành đạt, tiên phong. Mẫu xe mới này sẽ chỉ được sản xuất giới hạn 500 chiếc và dành riêng cho thị trường Việt Nam. ', N'VinFast President là mẫu xe phát triển từ dòng xe Lux SA2.0 và được định vị để trở thành một dòng xe đặc biệt nhắm tới những người Việt Nam thành đạt, tiên phong. Mẫu xe mới này sẽ chỉ được sản xuất giới hạn 500 chiếc và dành riêng cho thị trường Việt Nam. ', 4, 6, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (17, N'Ferrari 250 GT', N'https://media-cdn.laodong.vn/Storage/NewsPortal/2019/7/14/744133/606673.jpg', 1000000.0000, N'Ferrari 250 GTO is classified as a rare and considered Ferrari masterpiece when there are only 39 units produced between 1962 and 1964, and it is also the most beautiful Ferrari car in history under the table. hands of famous Italian car designers', N'Ferrari 250 GTO is classified as a rare and considered Ferrari masterpiece when there are only 39 units produced between 1962 and 1964, and it is also the most beautiful Ferrari car in history under the table. hands of famous Italian car designers', 3, 1, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (18, N' Ferrari 458 Speciale', N'https://ss-images.saostar.vn/wp700/2019/02/10/4572615/ferrari_sp3jc_1-share_buorrml5.jpg', 850000.0000, N'Speciale in Italian means "special", which is the name for the premium version of the line of cars Ferrari 458 that debuted late last year. Unlike the F430 with the special 430 Scuderia, this time Ferrari simply took the Speciale name for the special edition of the 458 Italia, a two-door sports car with a 4.5L V8 engine.', N'Speciale in Italian means "special", which is the name for the premium version of the line of cars Ferrari 458 that debuted late last year. Unlike the F430 with the special 430 Scuderia, this time Ferrari simply took the Speciale name for the special edition of the 458 Italia, a two-door sports car with a 4.5L V8 engine.', 3, 7, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (36, N'Lamborghini Urus', N'https://www.pngfind.com/pngs/m/258-2585564_lamborghini-urus-2018-prix-hd-png-download.png', 910000.0000, N'SUV', N'SuperCar SUV ', 1, 1, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (45, N'Rolls Royce Ghost 2', N'https://icdn.dantri.com.vn/thumb_w/640/2020/12/05/rollsroyce-1607122730658.jpg', 1500000.0000, N'This is luxury car beautiful', N'Luxury car no1 in the world and...', 2, 65, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (50, N'Ferrari 3', N'https://storage.googleapis.com/f1-cms/2020/08/d173f63a-20200818_091531.png', 1000000.0000, N'new car', N'super car', 3, 1, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (51, N'Ferrari 4', N'https://image.vtc.vn/resize/th/upload/2020/05/10/ferrari-f42-2-18414282.jpg', 2000000.0000, N'New Car', N'Super car', 3, 1, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (52, N'Vinfast Lux', N'https://dailyauto.vn/wp-content/uploads/2019/03/danh-gia-xe-vinfast-lux-a2.0-18-e1591343573563.jpg', 1000000.0000, N'Xe Viet Nam cua vingroup', N'Vinfast the he moi chat luong cao', 2, 1, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (55, N'Fotuner', N'https://hkbike.com.vn/wp-content/uploads/2018/12/gia-xe-toyota-1.jpg', 1000000.0000, N'Toyota 2021', N'Toyota', 5, 1, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (59, N'Tesla', N'https://www.investo.vn/wp-content/uploads/2020/12/tesla-model-x-dream-giveaway.jpg', 1000000.0000, N'SAS', N'ASS
', 6, 1, 0, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [block], [nview]) VALUES (60, N'abc', N'https://static.carmudi.vn/wp-content/uploads/2019-11/O9jszEGa7N.jpg', 12000000.0000, N'sfsf', N'sadfsd', 2, 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF_product_nview]  DEFAULT ((0)) FOR [nview]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Accounts] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([uID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Accounts]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_product] FOREIGN KEY([id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_Category1] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_Category1]
GO
USE [master]
GO
ALTER DATABASE [Wish] SET  READ_WRITE 
GO
