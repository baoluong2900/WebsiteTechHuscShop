USE [DataTechHuscShop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/12/2021 10:26:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/12/2021 10:26:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/12/2021 10:26:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](150) NULL,
	[Password] [nvarchar](30) NULL,
	[Phone] [nvarchar](15) NULL,
	[RegisteredDate] [date] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/12/2021 10:26:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] NOT NULL,
	[OrderDate] [date] NULL,
	[CustomerId] [int] NOT NULL,
	[Amount] [float] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/12/2021 10:26:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/12/2021 10:26:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [float] NULL,
	[Image] [nvarchar](50) NULL,
	[Description] [text] NULL,
	[Discount] [float] NULL,
	[EnteredDate] [date] NULL,
	[Status] [int] NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (1, N'Laptop')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (2, N'Tai nghe')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (3, N'Loa')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (4, N'Bàn phím')
GO
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Password], [Phone], [RegisteredDate]) VALUES (1, N'Bảo Lương', N'baoluong0209@gmail.com', N'123456Bao', N'0912129', CAST(N'2021-12-20' AS Date))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Password], [Phone], [RegisteredDate]) VALUES (2, N'A Vũ', N'duyvu@gmail.com', N'121212', N'0120102', CAST(N'2021-12-20' AS Date))
GO
INSERT [dbo].[Order] ([OrderId], [OrderDate], [CustomerId], [Amount], [Status]) VALUES (1, CAST(N'2021-12-20' AS Date), 1, 300, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [CustomerId], [Amount], [Status]) VALUES (2, CAST(N'2021-12-20' AS Date), 2, 4500, 1)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (1, 1, 1, 2, 600)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Quantity], [UnitPrice]) VALUES (2, 2, 2, 1, 1200)
GO
INSERT [dbo].[Product] ([ProductId], [Name], [Quantity], [UnitPrice], [Image], [Description], [Discount], [EnteredDate], [Status], [CategoryId]) VALUES (1, N'Bàn phím logetich', 10, 300, NULL, N'Logetich', 5, CAST(N'2021-12-20' AS Date), 1, 4)
INSERT [dbo].[Product] ([ProductId], [Name], [Quantity], [UnitPrice], [Image], [Description], [Discount], [EnteredDate], [Status], [CategoryId]) VALUES (2, N'Laptop MSI GF 63', 4, 1200, NULL, N'MSI', 10, CAST(N'2021-12-20' AS Date), 1, 1)
INSERT [dbo].[Product] ([ProductId], [Name], [Quantity], [UnitPrice], [Image], [Description], [Discount], [EnteredDate], [Status], [CategoryId]) VALUES (3, N'Laptop Dell G7', 4, 2000, NULL, N'Dell', 5, CAST(N'2021-12-20' AS Date), 1, 1)
INSERT [dbo].[Product] ([ProductId], [Name], [Quantity], [UnitPrice], [Image], [Description], [Discount], [EnteredDate], [Status], [CategoryId]) VALUES (4, N'Laptop Gaming Acer Nitro 5 ', 6, 1800, NULL, N'Acer', 4, CAST(N'2021-12-20' AS Date), 1, 1)
INSERT [dbo].[Product] ([ProductId], [Name], [Quantity], [UnitPrice], [Image], [Description], [Discount], [EnteredDate], [Status], [CategoryId]) VALUES (5, N'Tai nghe logetich G pro X', 15, 200, NULL, N'Logetich', 0, CAST(N'2021-12-20' AS Date), 1, 2)
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
