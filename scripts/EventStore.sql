/****** Object:  Table [dbo].[EventStore]    Script Date: 6/15/2025 3:34:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EventStore](
	[MessageId] [nvarchar](50) NOT NULL,
	[AggregateId] [nvarchar](50) NOT NULL,
	[AggregateName] [nvarchar](250) NOT NULL,
	[AggregateType] [nvarchar](100) NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[Data] [varbinary](max) NOT NULL,
	[Metadata] [varbinary](max) NOT NULL,
	[Version] [int] NOT NULL,
	[CommitPosition] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_EventStore] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


