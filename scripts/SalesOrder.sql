/****** Object:  Table [dbo].[SalesOrder]    Script Date: 6/15/2025 6:26:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SalesOrder](
	[Id] [nvarchar](50) NOT NULL,
	[OrderNumber] [nvarchar](50) NULL,
	[CustomerId] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](100) NULL,
	[OrderDate] [smalldatetime] NULL,
	[DeliveryDate] [smalldatetime] NULL,
	[Status] [nvarchar](10) NULL,
 CONSTRAINT [PK_SalesOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


