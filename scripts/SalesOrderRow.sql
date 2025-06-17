/****** Object:  Table [dbo].[SalesOrderRow]    Script Date: 6/15/2025 6:26:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SalesOrderRow](
	[Id] [nvarchar](30) NOT NULL,
	[OrderId] [nvarchar](50) NOT NULL,
	[BeerId] [nvarchar](50) NULL,
	[BeerName] [nvarchar](50) NULL,
	[Quantity] [decimal](18, 0) NULL,
	[UnitOfMeasure] [nvarchar](5) NULL,
	[Price] [decimal](18, 0) NULL,
	[Currency] [nvarchar](3) NULL,
 CONSTRAINT [PK_SalesOrderRow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


