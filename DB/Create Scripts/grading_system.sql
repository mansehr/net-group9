SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PermissionType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PermissionType](
	[permission] [varchar](30) NOT NULL,
	[description] [varchar](max) NOT NULL,
 CONSTRAINT [PK_PermissionType] PRIMARY KEY CLUSTERED 
(
	[permission] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Roll]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Roll](
	[roll] [varchar](30) NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_Roll] PRIMARY KEY CLUSTERED 
(
	[roll] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Course]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Course](
	[code] [varchar](30) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[credits] [float] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Person](
	[pnr] [nchar](10) NOT NULL,
	[fName] [varchar](30) NOT NULL,
	[eName] [varchar](30) NOT NULL,
	[email] [varchar](30) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[pnr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LadokResult]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LadokResult](
	[pnr] [nchar](10) NOT NULL,
	[runid] [varchar](30) NOT NULL,
	[code] [varchar](30) NOT NULL,
	[ladokpart] [varchar](30) NOT NULL,
	[reportDate] [datetime] NOT NULL,
	[reportGrade] [varchar](30) NOT NULL,
	[signature] [nchar](10) NOT NULL,
	[ladokDate] [datetime] NOT NULL,
	[ladokGrade] [varchar](30) NOT NULL,
 CONSTRAINT [PK_LadokResult] PRIMARY KEY CLUSTERED 
(
	[pnr] ASC,
	[runid] ASC,
	[code] ASC,
	[ladokpart] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Permission](
	[pnr] [nchar](10) NOT NULL,
	[permission] [varchar](30) NOT NULL,
	[code] [varchar](30) NOT NULL,
	[runid] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Permission_1] PRIMARY KEY CLUSTERED 
(
	[pnr] ASC,
	[code] ASC,
	[runid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PartiPart]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PartiPart](
	[pnr] [nchar](10) NOT NULL,
	[runid] [varchar](30) NOT NULL,
	[code] [varchar](30) NOT NULL,
	[part] [varchar](30) NOT NULL,
	[date] [datetime] NOT NULL,
	[result] [float] NOT NULL,
	[signature] [varchar](30) NOT NULL,
 CONSTRAINT [PK_PartiPart] PRIMARY KEY CLUSTERED 
(
	[pnr] ASC,
	[runid] ASC,
	[code] ASC,
	[part] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Participant]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Participant](
	[pnr] [nchar](10) NOT NULL,
	[roll] [varchar](30) NOT NULL,
	[runid] [varchar](30) NOT NULL,
	[code] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Participant] PRIMARY KEY CLUSTERED 
(
	[pnr] ASC,
	[runid] ASC,
	[code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CoursePart]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CoursePart](
	[runid] [varchar](30) NOT NULL,
	[code] [varchar](30) NOT NULL,
	[part] [varchar](30) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[maxScore] [int] NOT NULL,
 CONSTRAINT [PK_CoursePart] PRIMARY KEY CLUSTERED 
(
	[runid] ASC,
	[code] ASC,
	[part] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LadokPartRun]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LadokPartRun](
	[runid] [varchar](30) NOT NULL,
	[code] [varchar](30) NOT NULL,
	[ladokpart] [varchar](30) NOT NULL,
	[description] [varchar](max) NOT NULL,
 CONSTRAINT [PK_LadokPartRun] PRIMARY KEY CLUSTERED 
(
	[runid] ASC,
	[code] ASC,
	[ladokpart] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GradeLevel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GradeLevel](
	[gradeName] [varchar](30) NOT NULL,
	[runid] [varchar](30) NOT NULL,
	[code] [varchar](30) NOT NULL,
	[ladokPart] [varchar](30) NOT NULL,
	[functionString] [varchar](max) NOT NULL,
	[orderNumber] [float] NOT NULL,
 CONSTRAINT [PK_GradeLevel] PRIMARY KEY CLUSTERED 
(
	[gradeName] ASC,
	[runid] ASC,
	[code] ASC,
	[ladokPart] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LadokPart]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LadokPart](
	[code] [varchar](30) NOT NULL,
	[credits] [float] NOT NULL,
	[name] [varchar](30) NOT NULL,
 CONSTRAINT [PK_LadokPart] PRIMARY KEY CLUSTERED 
(
	[code] ASC,
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseRun]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CourseRun](
	[runid] [varchar](30) NOT NULL,
	[code] [varchar](30) NOT NULL,
	[startDate] [datetime] NOT NULL,
	[description] [varchar](max) NOT NULL,
 CONSTRAINT [PK_CourseRun] PRIMARY KEY CLUSTERED 
(
	[runid] ASC,
	[code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Login]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Login](
	[pnr] [nchar](10) NOT NULL,
	[Pass] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[pnr] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PermissionType_PermissionType]') AND parent_object_id = OBJECT_ID(N'[dbo].[PermissionType]'))
ALTER TABLE [dbo].[PermissionType]  WITH CHECK ADD  CONSTRAINT [FK_PermissionType_PermissionType] FOREIGN KEY([permission])
REFERENCES [dbo].[PermissionType] ([permission])
GO
ALTER TABLE [dbo].[PermissionType] CHECK CONSTRAINT [FK_PermissionType_PermissionType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Person_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[Person]'))
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Person] FOREIGN KEY([pnr])
REFERENCES [dbo].[Person] ([pnr])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Person]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LadokResult_LadokPartRun]') AND parent_object_id = OBJECT_ID(N'[dbo].[LadokResult]'))
ALTER TABLE [dbo].[LadokResult]  WITH CHECK ADD  CONSTRAINT [FK_LadokResult_LadokPartRun] FOREIGN KEY([runid], [code], [ladokpart])
REFERENCES [dbo].[LadokPartRun] ([runid], [code], [ladokpart])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LadokResult] CHECK CONSTRAINT [FK_LadokResult_LadokPartRun]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LadokResult_Permission]') AND parent_object_id = OBJECT_ID(N'[dbo].[LadokResult]'))
ALTER TABLE [dbo].[LadokResult]  WITH CHECK ADD  CONSTRAINT [FK_LadokResult_Permission] FOREIGN KEY([signature], [code], [runid])
REFERENCES [dbo].[Permission] ([pnr], [code], [runid])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LadokResult] CHECK CONSTRAINT [FK_LadokResult_Permission]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Permission_CourseRun]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permission]'))
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_CourseRun] FOREIGN KEY([runid], [code])
REFERENCES [dbo].[CourseRun] ([runid], [code])
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Permission_CourseRun]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Permission_Login]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permission]'))
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Login] FOREIGN KEY([pnr])
REFERENCES [dbo].[Login] ([pnr])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Permission_Login]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Permission_PermissionType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permission]'))
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_PermissionType] FOREIGN KEY([permission])
REFERENCES [dbo].[PermissionType] ([permission])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Permission_PermissionType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PartiPart_CoursePart]') AND parent_object_id = OBJECT_ID(N'[dbo].[PartiPart]'))
ALTER TABLE [dbo].[PartiPart]  WITH CHECK ADD  CONSTRAINT [FK_PartiPart_CoursePart] FOREIGN KEY([runid], [code], [part])
REFERENCES [dbo].[CoursePart] ([runid], [code], [part])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PartiPart] CHECK CONSTRAINT [FK_PartiPart_CoursePart]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PartiPart_Participant]') AND parent_object_id = OBJECT_ID(N'[dbo].[PartiPart]'))
ALTER TABLE [dbo].[PartiPart]  WITH CHECK ADD  CONSTRAINT [FK_PartiPart_Participant] FOREIGN KEY([pnr], [runid], [code])
REFERENCES [dbo].[Participant] ([pnr], [runid], [code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PartiPart] CHECK CONSTRAINT [FK_PartiPart_Participant]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Participant_CourseRun]') AND parent_object_id = OBJECT_ID(N'[dbo].[Participant]'))
ALTER TABLE [dbo].[Participant]  WITH CHECK ADD  CONSTRAINT [FK_Participant_CourseRun] FOREIGN KEY([runid], [code])
REFERENCES [dbo].[CourseRun] ([runid], [code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Participant] CHECK CONSTRAINT [FK_Participant_CourseRun]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Participant_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[Participant]'))
ALTER TABLE [dbo].[Participant]  WITH CHECK ADD  CONSTRAINT [FK_Participant_Person] FOREIGN KEY([pnr])
REFERENCES [dbo].[Person] ([pnr])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Participant] CHECK CONSTRAINT [FK_Participant_Person]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Participant_Roll]') AND parent_object_id = OBJECT_ID(N'[dbo].[Participant]'))
ALTER TABLE [dbo].[Participant]  WITH NOCHECK ADD  CONSTRAINT [FK_Participant_Roll] FOREIGN KEY([roll])
REFERENCES [dbo].[Roll] ([roll])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Participant] NOCHECK CONSTRAINT [FK_Participant_Roll]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CoursePart_CourseRun]') AND parent_object_id = OBJECT_ID(N'[dbo].[CoursePart]'))
ALTER TABLE [dbo].[CoursePart]  WITH CHECK ADD  CONSTRAINT [FK_CoursePart_CourseRun] FOREIGN KEY([runid], [code])
REFERENCES [dbo].[CourseRun] ([runid], [code])
GO
ALTER TABLE [dbo].[CoursePart] CHECK CONSTRAINT [FK_CoursePart_CourseRun]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LadokPartRun_CourseRun]') AND parent_object_id = OBJECT_ID(N'[dbo].[LadokPartRun]'))
ALTER TABLE [dbo].[LadokPartRun]  WITH CHECK ADD  CONSTRAINT [FK_LadokPartRun_CourseRun] FOREIGN KEY([runid], [code])
REFERENCES [dbo].[CourseRun] ([runid], [code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LadokPartRun] CHECK CONSTRAINT [FK_LadokPartRun_CourseRun]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LadokPartRun_LadokPart]') AND parent_object_id = OBJECT_ID(N'[dbo].[LadokPartRun]'))
ALTER TABLE [dbo].[LadokPartRun]  WITH NOCHECK ADD  CONSTRAINT [FK_LadokPartRun_LadokPart] FOREIGN KEY([code], [ladokpart])
REFERENCES [dbo].[LadokPart] ([code], [name])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LadokPartRun] NOCHECK CONSTRAINT [FK_LadokPartRun_LadokPart]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GradeLevel_LadokPartRun]') AND parent_object_id = OBJECT_ID(N'[dbo].[GradeLevel]'))
ALTER TABLE [dbo].[GradeLevel]  WITH CHECK ADD  CONSTRAINT [FK_GradeLevel_LadokPartRun] FOREIGN KEY([runid], [code], [ladokPart])
REFERENCES [dbo].[LadokPartRun] ([runid], [code], [ladokpart])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GradeLevel] CHECK CONSTRAINT [FK_GradeLevel_LadokPartRun]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LadokPart_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[LadokPart]'))
ALTER TABLE [dbo].[LadokPart]  WITH CHECK ADD  CONSTRAINT [FK_LadokPart_Course] FOREIGN KEY([code])
REFERENCES [dbo].[Course] ([code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LadokPart] CHECK CONSTRAINT [FK_LadokPart_Course]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseRun_Course]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseRun]'))
ALTER TABLE [dbo].[CourseRun]  WITH CHECK ADD  CONSTRAINT [FK_CourseRun_Course] FOREIGN KEY([code])
REFERENCES [dbo].[Course] ([code])
GO
ALTER TABLE [dbo].[CourseRun] CHECK CONSTRAINT [FK_CourseRun_Course]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Login_Person]') AND parent_object_id = OBJECT_ID(N'[dbo].[Login]'))
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Person] FOREIGN KEY([pnr])
REFERENCES [dbo].[Person] ([pnr])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Person]
