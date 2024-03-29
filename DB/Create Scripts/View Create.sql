USE [NET-Prototype1]
GO
/****** Object:  View [dbo].[CoursePartView]    Script Date: 05/28/2009 13:36:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CoursePartView]
AS
SELECT        dbo.CourseRun.code, dbo.CourseRun.startDate, dbo.CourseRun.description AS CourseRunDescription, dbo.Course.name, 
                         dbo.Course.description AS CourseDescription, dbo.PartiPart.date, dbo.Participant.pnr, dbo.PartiPart.part
FROM            dbo.Course INNER JOIN
                         dbo.CourseRun ON dbo.Course.code = dbo.CourseRun.code INNER JOIN
                         dbo.Participant ON dbo.CourseRun.runid = dbo.Participant.runid AND dbo.CourseRun.code = dbo.Participant.code INNER JOIN
                         dbo.PartiPart ON dbo.Participant.pnr = dbo.PartiPart.pnr AND dbo.Participant.runid = dbo.PartiPart.runid AND dbo.Participant.code = dbo.PartiPart.code
WHERE        (dbo.PartiPart.date =
                             (SELECT        MAX(date) AS Expr1
                               FROM            dbo.PartiPart AS PartiPart_1
                               WHERE        (pnr = dbo.Participant.pnr) AND (runid = dbo.Participant.runid) AND (code = dbo.Participant.code)))


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[26] 2[31] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Course"
            Begin Extent = 
               Top = 0
               Left = 3
               Bottom = 127
               Right = 173
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CourseRun"
            Begin Extent = 
               Top = 0
               Left = 219
               Bottom = 156
               Right = 395
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Participant"
            Begin Extent = 
               Top = 2
               Left = 426
               Bottom = 153
               Right = 602
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PartiPart"
            Begin Extent = 
               Top = 6
               Left = 889
               Bottom = 176
               Right = 1064
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3135
         Alias = 900
         Table = 1170
         Output = 1020
         Append = 1400
         NewValue = 1170
         SortType = 1350
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CoursePartView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    SortOrder = 1410
         GroupBy = 1350
         Filter = 2880
         Or = 1140
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CoursePartView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CoursePartView'