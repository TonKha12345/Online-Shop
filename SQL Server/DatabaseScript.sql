USE [master]
GO
/****** Object:  Database [TTK_Online]    Script Date: 8/23/2023 2:02:38 PM ******/
CREATE DATABASE [TTK_Online]
GO

USE [TTK_Online]
GO
/****** Object:  Table [dbo].[About]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Descriptions] [varchar](500) NULL,
	[Images] [nvarchar](250) NULL,
	[Detail] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[CreateBy] [nvarchar](250) NULL,
	[ModifyDate] [datetime] NULL DEFAULT (getdate()),
	[ModifyBy] [nvarchar](250) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](500) NULL,
	[Status] [bit] NULL DEFAULT ((1)),
	[LanguageID] [nvarchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [bigint] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nvarchar](250) NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyBy] [nvarchar](250) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](500) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
	[LanguageID] [nvarchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NULL DEFAULT ((1)),
	[LanguageID] [nvarchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Content]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Decriptions] [nvarchar](max) NULL,
	[Images] [nvarchar](250) NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[CreateBy] [nvarchar](250) NULL,
	[ModifyDate] [datetime] NULL DEFAULT (getdate()),
	[ModifyBy] [nvarchar](250) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[Status] [bit] NULL DEFAULT ((1)),
	[LanguageID] [nvarchar](2) NULL,
	[ShowOnHome] [bit] NULL DEFAULT ((1)),
	[ToHot] [datetime] NULL,
	[ViewCount] [bigint] NULL DEFAULT ((0)),
	[Tags] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContentTag](
	[ContentID] [bigint] NOT NULL,
	[TagID] [varchar](100) NOT NULL,
	[LanguageID] [nvarchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Credential](
	[GroupID] [varchar](20) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Content] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[Status] [bit] NULL DEFAULT ((1)),
	[LanguageID] [nvarchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Footer]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NULL DEFAULT ((1)),
	[LanguageID] [nvarchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Languages]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[ID] [nvarchar](2) NULL,
	[Value] [nvarchar](50) NULL,
	[Status] [bit] NULL DEFAULT ((1))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[TypeID] [int] NOT NULL,
	[Status] [bit] NULL DEFAULT ((1)),
	[LanguageID] [nvarchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [float] NULL,
	[Price] [float] NULL,
	[CustomerID] [bigint] NOT NULL,
	[ShipName] [nvarchar](250) NULL,
	[ShipPhone] [nvarchar](20) NULL,
	[ShipAddress] [nvarchar](250) NULL,
	[ShipEmail] [nvarchar](250) NULL,
	[Status] [bit] NULL DEFAULT ((1)),
	[LanguageID] [nvarchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](100) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[Descriptions] [nvarchar](250) NULL,
	[Images] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
	[Price] [float] NULL,
	[PromotionPrice] [float] NULL,
	[IncludeVAT] [bit] NULL DEFAULT ((1)),
	[Quantity] [float] NULL,
	[CategoryID] [bigint] NOT NULL,
	[Detail] [nvarchar](250) NULL,
	[Warranty] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[CreateBy] [nvarchar](250) NULL,
	[ModifyDate] [datetime] NULL DEFAULT (getdate()),
	[ModifyBy] [nvarchar](250) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](500) NULL,
	[Status] [bit] NULL DEFAULT ((1)),
	[NewProduct] [bit] NULL DEFAULT ((0)),
	[FeatureProduct] [bit] NULL DEFAULT ((0)),
	[LanguageID] [nvarchar](2) NULL,
	[ShowOnHome] [bit] NULL DEFAULT ((1)),
	[ToHot] [datetime] NULL,
	[ViewCount] [bigint] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [bigint] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[CreateBy] [nvarchar](250) NULL,
	[ModifyDate] [datetime] NULL DEFAULT (getdate()),
	[ModifyBy] [nvarchar](250) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](500) NULL,
	[Status] [bit] NULL DEFAULT ((1)),
	[ShowOnHome] [bit] NULL DEFAULT ((1)),
	[LanguageID] [nvarchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Images] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[Decription] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[CreateBy] [nvarchar](250) NULL,
	[ModifyDate] [datetime] NULL DEFAULT (getdate()),
	[ModifyBy] [nvarchar](250) NULL,
	[Status] [bit] NULL DEFAULT ((1)),
	[LanguageID] [nvarchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [varchar](100) NOT NULL,
	[Name] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/23/2023 2:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](250) NULL,
	[Password] [nvarchar](250) NULL,
	[Name] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[CreateBy] [nvarchar](250) NULL,
	[ModifyDate] [datetime] NULL DEFAULT (getdate()),
	[ModifyBy] [nvarchar](250) NULL,
	[Status] [bit] NULL DEFAULT ((1)),
	[ProvinceID] [bigint] NULL,
	[DistristID] [bigint] NULL,
	[GroupID] [varchar](20) NULL CONSTRAINT [DF_Users_GroupID]  DEFAULT ('MEMBER'),
	[LanguageID] [nvarchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([ID], [Name], [MetaTitle], [Descriptions], [Images], [Detail], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [LanguageID]) VALUES (2, NULL, NULL, NULL, NULL, N'<div class="container-fluid">
    <div class="section group">
        <div class="col_1_of_3 span_1_of_3">
            <h3>Who We Are</h3>
            <img src="Assets/Client/images/about_img.jpg" alt="">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
        </div>
        <div class="col_1_of_3 span_1_of_3">
            <h3>Our History</h3>
            <div class="history-desc">
                <div class="year"><p>1998 -</p></div>
                <p class="history">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <div class="clear"></div>
            </div>
            <div class="history-desc">
                <div class="year"><p>2001 -</p></div>
                <p class="history">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.</p>
                <div class="clear"></div>
            </div>
            <div class="history-desc">
                <div class="year"><p>2006 -</p></div>
                <p class="history">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <div class="clear"></div>
            </div>
            <div class="history-desc">
                <div class="year"><p>2010 -</p></div>
                <p class="history">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <div class="clear"></div>
            </div>
            <div class="history-desc">
                <div class="year"><p>2013 -</p></div>
                <p class="history">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.</p>
                <div class="clear"></div>
            </div>
        </div>
        <div class="col_1_of_3 span_1_of_3">
            <h3>Opportunities</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
            <div class="list">
                <ul>
                    <li><a href="#">Text of the printing</a></li>
                    <li><a href="#">Lorem Ipsum has been the standard</a></li>
                    <li><a href="#">Dummy text ever since the 1500s</a></li>
                    <li><a href="#">Unknown printer took a galley</a></li>
                    <li><a href="#">Led it to make a type specimen</a></li>
                    <li><a href="#">Not only five centuries</a></li>
                    <li><a href="#">Electronic typesetting</a></li>
                    <li><a href="#">Unchanged. It was popularised</a></li>
                    <li><a href="#">Sheets containing Lorem Ipsume</a></li>
                </ul>
            </div>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
        </div>
    </div>
</div>', CAST(N'2023-08-22 10:22:56.127' AS DateTime), NULL, CAST(N'2023-08-22 10:22:56.127' AS DateTime), NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[About] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID], [Content], [Status], [LanguageID]) VALUES (1, N'<p>CÔNG TY CỔ PHẦN TƯ VẤN KỸ THUẬT SEAS </p>

<br />
<p>Địa chỉ: 26 Nguyễn Thiện Thuật </p>
<br />
<p>Số điện thoại: 0384684207 </p>', 1, NULL)
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Decriptions], [Images], [CategoryID], [Detail], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [LanguageID], [ShowOnHome], [ToHot], [ViewCount], [Tags]) VALUES (1, N'Sản phẩm mới', N'San-pham-moi', N'S?n ph?m thân thi?n v?i môi tru?ng', N'/Data/images/vai-tro-cua-thien-nhien-1.png', NULL, N'<p>Sản phẩm th&acirc;n thiện với m&ocirc;i trường</p>
', CAST(N'2023-08-16 09:39:20.723' AS DateTime), N'K99', NULL, NULL, N'Sản phẩm', N'Sản phẩm', 1, N'vi', 0, NULL, NULL, N'tin tức, thời sự')
SET IDENTITY_INSERT [dbo].[Content] OFF
INSERT [dbo].[ContentTag] ([ContentID], [TagID], [LanguageID]) VALUES (1, N'thoi-su', NULL)
INSERT [dbo].[ContentTag] ([ContentID], [TagID], [LanguageID]) VALUES (1, N'tin-tuc', NULL)
INSERT [dbo].[ContentTag] ([ContentID], [TagID], [LanguageID]) VALUES (2, N'thoi-su', NULL)
INSERT [dbo].[ContentTag] ([ContentID], [TagID], [LanguageID]) VALUES (2, N'tin-tuc', NULL)
INSERT [dbo].[Credential] ([GroupID], [RoleID]) VALUES (N'MOD', N'VIEW_USER')
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreateDate], [Status], [LanguageID]) VALUES (1, N'Ton kha', N'123', N'123', N'123', N'123', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Footer] ON 

INSERT [dbo].[Footer] ([ID], [Content], [Status], [LanguageID]) VALUES (1, N'<div class="wrap">
            <div class="section group">
                <div class="col_1_of_4 span_1_of_4">
                    <h4>Information</h4>
                    <ul>
                        <li><a href="/gioi-thieu">About Us</a></li>
                        <li><a href="/lien-he">Customer Service</a></li>
                        <li><a href="/van-chuyen">Orders and Returns</a></li>
                        <li><a href="/lien-he">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col_1_of_4 span_1_of_4">
                    <h4>Why buy from us</h4>
                    <ul>
                        <li><a href="/gioi-thieu">About Us</a></li>
                        <li><a href="/lien-he">Customer Service</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="/van-chuyen">Site Map</a></li>
                        <li><a href="#">Search Terms</a></li>
                    </ul>
                </div>
                <div class="col_1_of_4 span_1_of_4">
                    <h4>My account</h4>
                    <ul>
                        <li><a href="/lien-he">Sign In</a></li>
                        <li><a href="/gio-hang">View Cart</a></li>
                        <li><a href="#">My Wishlist</a></li>
                        <li><a href="#">Track My Order</a></li>
                        <li><a href="/lien-he">Help</a></li>
                    </ul>
                </div>
                <div class="col_1_of_4 span_1_of_4">
                    <h4>Contact</h4>
                    <ul>
                        <li><span>+038-468-4207</span></li>
                    </ul>
                    <div class="social-icons">
                        <h4>Follow Us</h4>
                        <ul>
                            <li><a href="#" target="_blank"><img src="/Assets/Client/images/facebook.png" alt="" /></a></li>
                            <li><a href="#" target="_blank"><img src="/Assets/Client/images/twitter.png" alt="" /></a></li>
                            <li><a href="#" target="_blank"><img src="/Assets/Client/images/skype.png" alt="" /> </a></li>
                            <li><a href="#" target="_blank"> <img src="/Assets/Client/images/dribbble.png" alt="" /></a></li>
                            <li><a href="#" target="_blank"> <img src="/Assets/Client/images/linkedin.png" alt="" /></a></li>
                            <div class="clear"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </div>', 1, NULL)
SET IDENTITY_INSERT [dbo].[Footer] OFF
INSERT [dbo].[Languages] ([ID], [Value], [Status]) VALUES (N'vi', N'Tiếng Việt', 1)
INSERT [dbo].[Languages] ([ID], [Value], [Status]) VALUES (N'en', N'Tiếng Anh', 1)
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Name], [Link], [DisplayOrder], [TypeID], [Status], [LanguageID]) VALUES (1, N'Trang chủ', N'/', 1, 1, 1, NULL)
INSERT [dbo].[Menu] ([ID], [Name], [Link], [DisplayOrder], [TypeID], [Status], [LanguageID]) VALUES (2, N'Giới thiệu', N'/gioi-thieu', 2, 1, 1, NULL)
INSERT [dbo].[Menu] ([ID], [Name], [Link], [DisplayOrder], [TypeID], [Status], [LanguageID]) VALUES (3, N'Tin tức', N'/tin-tuc', 3, 1, 1, NULL)
INSERT [dbo].[Menu] ([ID], [Name], [Link], [DisplayOrder], [TypeID], [Status], [LanguageID]) VALUES (4, N'Sản phẩm', N'/san-pham', 4, 1, 1, NULL)
INSERT [dbo].[Menu] ([ID], [Name], [Link], [DisplayOrder], [TypeID], [Status], [LanguageID]) VALUES (5, N'Liên hệ', N'/lien-he', 5, 1, 1, NULL)
INSERT [dbo].[Menu] ([ID], [Name], [Link], [DisplayOrder], [TypeID], [Status], [LanguageID]) VALUES (6, N'Tài khoản', N'/tai-khoan', 1, 2, 1, NULL)
INSERT [dbo].[Menu] ([ID], [Name], [Link], [DisplayOrder], [TypeID], [Status], [LanguageID]) VALUES (7, N'Đăng xuất', N'/dang-xuat', 2, 3, 1, NULL)
INSERT [dbo].[Menu] ([ID], [Name], [Link], [DisplayOrder], [TypeID], [Status], [LanguageID]) VALUES (8, N'Vận chuyển', N'/van-chuyen', 3, 2, 1, NULL)
INSERT [dbo].[Menu] ([ID], [Name], [Link], [DisplayOrder], [TypeID], [Status], [LanguageID]) VALUES (9, N'Đăng nhập', N'/dang-nhap', 4, 2, 1, NULL)
INSERT [dbo].[Menu] ([ID], [Name], [Link], [DisplayOrder], [TypeID], [Status], [LanguageID]) VALUES (10, N'Đăng ký', N'/dang-ky', 5, 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[Menu] OFF
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [CustomerID], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [LanguageID]) VALUES (1, 3, 1, 8000000, 0, N'Trần Khả', N'0988173590', N'123', N'trantonkha@gmail.com', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [CustomerID], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [LanguageID]) VALUES (1, 4, 1, 8000000, 0, N'Trần Khả', N'0988173590', N'123', N'trantonkha@gmail.com', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [CustomerID], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [LanguageID]) VALUES (1, 5, 1, 8000000, 0, N'Trần Khả', N'0988173590', N'123', N'trantonkha@gmail.com', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [CustomerID], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [LanguageID]) VALUES (1, 7, 1, 8000000, 0, N'Trần Tôn Khả', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [CustomerID], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [LanguageID]) VALUES (2, 2, 1, 5000000, 0, N'Trần Khả', N'123', N'123', N'123', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [CustomerID], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [LanguageID]) VALUES (2, 3, 1, 5000000, 0, N'Trần Khả', N'0988173590', N'123', N'trantonkha@gmail.com', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [CustomerID], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [LanguageID]) VALUES (2, 7, 1, 5000000, 0, N'Trần Tôn Khả', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [CustomerID], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [LanguageID]) VALUES (3, 2, 1, 25000000, 0, N'Trần Khả', N'123', N'123', N'123', NULL, NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [CustomerID], [ShipName], [ShipPhone], [ShipAddress], [ShipEmail], [Status], [LanguageID]) VALUES (7, 15, 3, 8000000, 0, N'123', N'123', N'123', N'123', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [CreateDate]) VALUES (1, CAST(N'2023-08-12 14:43:52.477' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CreateDate]) VALUES (2, CAST(N'2023-08-12 14:52:27.270' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CreateDate]) VALUES (3, CAST(N'2023-08-12 20:19:16.150' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CreateDate]) VALUES (4, CAST(N'2023-08-12 20:22:59.613' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CreateDate]) VALUES (5, CAST(N'2023-08-12 20:30:06.527' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CreateDate]) VALUES (6, CAST(N'2023-08-22 09:42:40.747' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CreateDate]) VALUES (7, CAST(N'2023-08-22 09:48:55.947' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CreateDate]) VALUES (8, CAST(N'2023-08-22 15:13:57.043' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CreateDate]) VALUES (9, CAST(N'2023-08-22 15:14:11.070' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CreateDate]) VALUES (10, CAST(N'2023-08-22 15:16:05.563' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CreateDate]) VALUES (11, CAST(N'2023-08-22 15:16:12.303' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CreateDate]) VALUES (12, CAST(N'2023-08-22 15:17:39.183' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CreateDate]) VALUES (13, CAST(N'2023-08-22 15:18:58.230' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CreateDate]) VALUES (14, CAST(N'2023-08-22 15:26:06.800' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CreateDate]) VALUES (15, CAST(N'2023-08-22 15:26:23.003' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Images], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [NewProduct], [FeatureProduct], [LanguageID], [ShowOnHome], [ToHot], [ViewCount]) VALUES (1, N'Tivi Sony 21 Inch', N'A01', N'tivi-sony-21', N'Ti vi siêu mỏng', N'/Assets/Client/images/preview.jpg', NULL, 8000000, NULL, 1, NULL, 5, N'Ti vi siêu mỏng', NULL, CAST(N'2023-08-10 09:17:13.607' AS DateTime), NULL, CAST(N'2023-08-10 09:17:13.607' AS DateTime), NULL, NULL, NULL, 1, 1, 0, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Images], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [NewProduct], [FeatureProduct], [LanguageID], [ShowOnHome], [ToHot], [ViewCount]) VALUES (2, N'Bộ loa 2.1 Microlap', N'A02', N'loa-2-1-microlap', N'Loa siêu hay', N'/Assets/Client/images/slide-1-image.png', NULL, 5000000, NULL, 1, NULL, 5, N'Loa siêu hay', NULL, CAST(N'2023-08-10 09:17:13.627' AS DateTime), NULL, CAST(N'2023-08-10 09:17:13.627' AS DateTime), NULL, NULL, NULL, 1, 1, 0, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Images], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [NewProduct], [FeatureProduct], [LanguageID], [ShowOnHome], [ToHot], [ViewCount]) VALUES (3, N'Máy ảnh Nikon', N'A03', N'may-anh-nikon', N'Máy ảnh Nikon', N'/Assets/Client/images/feature-pic3.jpg', NULL, 25000000, NULL, 1, NULL, 5, N'Máy ảnh Nikon', NULL, CAST(N'2023-08-10 09:17:13.630' AS DateTime), NULL, CAST(N'2023-08-10 09:17:13.630' AS DateTime), NULL, NULL, NULL, 1, 1, 0, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Images], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [NewProduct], [FeatureProduct], [LanguageID], [ShowOnHome], [ToHot], [ViewCount]) VALUES (4, N'Tivi Plasma siêu phẳng', N'A04', N'tivi-plasma', N'Ti vi siêu mỏng', N'/Assets/Client/images/slide-3-image.jpg', NULL, 10000000, NULL, 1, NULL, 5, N'Ti vi siêu mỏng', NULL, CAST(N'2023-08-10 09:17:13.633' AS DateTime), NULL, CAST(N'2023-08-10 09:17:13.633' AS DateTime), NULL, NULL, NULL, 1, 1, 0, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Images], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [NewProduct], [FeatureProduct], [LanguageID], [ShowOnHome], [ToHot], [ViewCount]) VALUES (5, N'Máy ảnh Sony', N'A05', N'may-anh-sony', N'Máy ảnh đẹp', N'/Assets/Client/images/new-pic1.jpg', NULL, 30000000, NULL, 1, NULL, 5, N'Máy ảnh đẹp', NULL, CAST(N'2023-08-10 09:17:13.637' AS DateTime), NULL, CAST(N'2023-08-10 09:17:13.637' AS DateTime), NULL, NULL, NULL, 1, 0, 1, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Images], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [NewProduct], [FeatureProduct], [LanguageID], [ShowOnHome], [ToHot], [ViewCount]) VALUES (6, N'Dàn Karaoke 2.0', N'A06', N'dan-karaoke-2-0', N'Dàn Karaoke 2.0', N'/Assets/Client/images/feature-pic2.jpg', NULL, 9000000, NULL, 1, NULL, 5, N'Dàn Karaoke 2.0', NULL, CAST(N'2023-08-10 09:17:13.640' AS DateTime), NULL, CAST(N'2023-08-10 09:17:13.640' AS DateTime), NULL, NULL, NULL, 1, 0, 1, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Descriptions], [Images], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [NewProduct], [FeatureProduct], [LanguageID], [ShowOnHome], [ToHot], [ViewCount]) VALUES (7, N'Lò nướng', N'A01', N'lo-nuong', N'Lò nướng', N'/Assets/Client/images/productslide-1.jpg', NULL, 8000000, NULL, 1, NULL, 5, N'Lò nướng', NULL, CAST(N'2023-08-10 09:17:13.643' AS DateTime), NULL, CAST(N'2023-08-10 09:17:13.643' AS DateTime), NULL, NULL, NULL, 1, 0, 1, NULL, 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [Code], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [ShowOnHome], [LanguageID]) VALUES (1, N'Đồng hồ', NULL, N'dong-ho', NULL, 1, NULL, CAST(N'2023-08-09 20:37:17.837' AS DateTime), NULL, CAST(N'2023-08-09 20:37:17.837' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [Code], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [ShowOnHome], [LanguageID]) VALUES (2, N'Điện thoại', NULL, N'dien-thoai', NULL, 2, NULL, CAST(N'2023-08-09 20:37:17.850' AS DateTime), NULL, CAST(N'2023-08-09 20:37:17.850' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [Code], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [ShowOnHome], [LanguageID]) VALUES (3, N'Laptop', NULL, N'laptop', NULL, 3, NULL, CAST(N'2023-08-09 20:37:17.850' AS DateTime), NULL, CAST(N'2023-08-09 20:37:17.850' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [Code], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [ShowOnHome], [LanguageID]) VALUES (4, N'PC', NULL, N'PC', NULL, 4, NULL, CAST(N'2023-08-09 20:37:17.853' AS DateTime), NULL, CAST(N'2023-08-09 20:37:17.853' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [Code], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [ShowOnHome], [LanguageID]) VALUES (5, N'Phụ kiện', NULL, N'phu-kien', NULL, 5, NULL, CAST(N'2023-08-09 20:37:17.853' AS DateTime), NULL, CAST(N'2023-08-09 20:37:17.853' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [Code], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [ShowOnHome], [LanguageID]) VALUES (6, N'Phần mềm', NULL, N'phan-mem', NULL, 6, NULL, CAST(N'2023-08-09 20:37:17.857' AS DateTime), NULL, CAST(N'2023-08-09 20:37:17.857' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [Code], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [ShowOnHome], [LanguageID]) VALUES (7, N'Thể thao', NULL, N'the-thao', NULL, 7, NULL, CAST(N'2023-08-09 20:37:17.860' AS DateTime), NULL, CAST(N'2023-08-09 20:37:17.860' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [Code], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [ShowOnHome], [LanguageID]) VALUES (8, N'Loa', NULL, N'loa', NULL, 8, NULL, CAST(N'2023-08-10 08:22:52.610' AS DateTime), NULL, CAST(N'2023-08-10 08:22:52.610' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [Code], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [ShowOnHome], [LanguageID]) VALUES (9, N'Ti vi', NULL, N'ti-vi', NULL, 9, NULL, CAST(N'2023-08-10 08:22:52.623' AS DateTime), NULL, CAST(N'2023-08-10 08:22:52.623' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [Code], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [ShowOnHome], [LanguageID]) VALUES (10, N'Máy ảnh', NULL, N'may-anh', NULL, 10, NULL, CAST(N'2023-08-10 08:22:52.623' AS DateTime), NULL, CAST(N'2023-08-10 08:22:52.623' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[ProductCategory] ([ID], [Name], [Code], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [MetaKeyword], [MetaDescription], [Status], [ShowOnHome], [LanguageID]) VALUES (11, N'Tủ lạnh', NULL, N'tu-lanh', NULL, 11, NULL, CAST(N'2023-08-10 08:22:52.627' AS DateTime), NULL, CAST(N'2023-08-10 08:22:52.627' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_CONTENT', N'Xoa tin tuc')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_USER', N'Xoa User')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_CONTENT', N'Sua tin tuc')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_USER', N'Sua User')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_CONTENT', N'Xem tin tuc')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_USER', N'Xem danh sach')
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Images], [DisplayOrder], [Link], [Decription], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [Status], [LanguageID]) VALUES (1, N'/Assets/Client/images/slide-3-image.jpg', 1, N'/san-pham/tivi-plasma-4', NULL, CAST(N'2023-08-09 20:59:29.303' AS DateTime), NULL, CAST(N'2023-08-09 20:59:29.303' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[Slide] ([ID], [Images], [DisplayOrder], [Link], [Decription], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [Status], [LanguageID]) VALUES (2, N'/Assets/Client/images/feature-pic2.jpg', 2, N'/san-pham/dan-karaoke-2.0-6', NULL, CAST(N'2023-08-09 20:59:29.323' AS DateTime), NULL, CAST(N'2023-08-09 20:59:29.323' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[Slide] ([ID], [Images], [DisplayOrder], [Link], [Decription], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [Status], [LanguageID]) VALUES (3, N'/Assets/Client/images/new-pic1.jpg', 3, N'/san-pham/may-anh-sony-7', NULL, CAST(N'2023-08-09 20:59:29.327' AS DateTime), NULL, CAST(N'2023-08-09 20:59:29.327' AS DateTime), NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Slide] OFF
INSERT [dbo].[Tag] ([ID], [Name]) VALUES (N'thoi-su', N' thời sự')
INSERT [dbo].[Tag] ([ID], [Name]) VALUES (N'tin-tuc', N'tin tức')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Quản trị')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MEMBER', N'Quản trị')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MOD', N'MOD')
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [Status], [ProvinceID], [DistristID], [GroupID], [LanguageID]) VALUES (1, N'K99', N'202cb962ac59075b964b07152d234b70', N'Trần Tôn Khả', NULL, NULL, NULL, CAST(N'2023-08-14 10:06:08.943' AS DateTime), NULL, CAST(N'2023-08-14 10:06:08.943' AS DateTime), NULL, 1, NULL, NULL, N'ADMIN', NULL)
INSERT [dbo].[Users] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [Status], [ProvinceID], [DistristID], [GroupID], [LanguageID]) VALUES (2, N'T99', N'202cb962ac59075b964b07152d234b70', N'Lê Đăng Như Thế', NULL, NULL, NULL, CAST(N'2023-08-16 14:48:28.157' AS DateTime), NULL, CAST(N'2023-08-16 14:48:28.157' AS DateTime), NULL, 1, NULL, NULL, N'MOD', NULL)
INSERT [dbo].[Users] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [Status], [ProvinceID], [DistristID], [GroupID], [LanguageID]) VALUES (3, N'admin', N'202cb962ac59075b964b07152d234b70', N'Lê Đăng Như Thế', NULL, NULL, NULL, CAST(N'2023-08-16 14:48:28.163' AS DateTime), NULL, CAST(N'2023-08-16 14:48:28.163' AS DateTime), NULL, 1, NULL, NULL, N'MEMBER', NULL)
INSERT [dbo].[Users] ([ID], [UserName], [Password], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifyDate], [ModifyBy], [Status], [ProvinceID], [DistristID], [GroupID], [LanguageID]) VALUES (4, N'admin1', N'202cb962ac59075b964b07152d234b70', N'Lê Đăng Như Thế', NULL, NULL, NULL, CAST(N'2023-08-16 14:48:28.167' AS DateTime), NULL, CAST(N'2023-08-16 14:48:28.167' AS DateTime), NULL, 1, NULL, NULL, N'MEMBER', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Category] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (getdate()) FOR [ModifyDate]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((1)) FOR [ShowOnHome]
GO
USE [master]
GO
ALTER DATABASE [TTK_Online] SET  READ_WRITE 
GO
