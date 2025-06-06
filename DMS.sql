USE [master]
GO
/****** Object:  Database [DbTask]    Script Date: 26-05-25 12.20.54 AM ******/
CREATE DATABASE [DbTask]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbUserManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DbUserManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbUserManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DbUserManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DbTask] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbTask].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbTask] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbTask] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbTask] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbTask] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbTask] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbTask] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DbTask] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbTask] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbTask] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbTask] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbTask] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbTask] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbTask] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbTask] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbTask] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DbTask] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbTask] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbTask] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbTask] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbTask] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbTask] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbTask] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbTask] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DbTask] SET  MULTI_USER 
GO
ALTER DATABASE [DbTask] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbTask] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbTask] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbTask] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbTask] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbTask] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DbTask', N'ON'
GO
ALTER DATABASE [DbTask] SET QUERY_STORE = ON
GO
ALTER DATABASE [DbTask] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DbTask]
GO
/****** Object:  Table [dbo].[Colleges]    Script Date: 26-05-25 12.20.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colleges](
	[CollegeID] [int] IDENTITY(1,1) NOT NULL,
	[CollegeName] [varchar](100) NOT NULL,
	[CollegeCode] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CollegeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Designations]    Script Date: 26-05-25 12.20.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designations](
	[DesignationID] [int] IDENTITY(1,1) NOT NULL,
	[CollegeID] [int] NOT NULL,
	[DesignationCode] [varchar](20) NOT NULL,
	[DesignationAcronym] [varchar](10) NOT NULL,
	[DesignationName] [varchar](100) NOT NULL,
	[StreamID] [int] NOT NULL,
	[Priority] [int] NULL,
	[RoleResponsibilities] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[DesignationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Streams]    Script Date: 26-05-25 12.20.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Streams](
	[StreamID] [int] IDENTITY(1,1) NOT NULL,
	[StreamName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StreamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_regUsers]    Script Date: 26-05-25 12.20.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_regUsers](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Mobile] [nvarchar](15) NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_regUsers] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
/****** Object:  StoredProcedure [dbo].[Proc_DesignationInsert]    Script Date: 26-05-25 12.20.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[Proc_DesignationInsert]
    @CollegeID           INT = NULL,
    @DesignationCode     VARCHAR(25) = NULL,
    @DesignationAcronym  VARCHAR(25) = NULL,
    @DesignationName     VARCHAR(50) = NULL,
    @StreamID           INT = NULL,
    @RoleResponsibility VARCHAR(100) = NULL,
    @Priority           INT = NULL
AS
BEGIN
    DECLARE @Success BIT = 0, @Msg VARCHAR(100) = '', @MaxPriority INT

    
    BEGIN TRY
            IF EXISTS (SELECT 1 FROM Designations  WHERE DesignationCode = @DesignationCode AND CollegeID = @CollegeID)
            BEGIN
                SELECT @Success = 0, @Msg = 'Designation with this code already exists for this college'
            END
            ELSE
            BEGIN
			SELECT @MaxPriority = ISNULL(MAX(Priority), 0) FROM Designations  WHERE CollegeID = @CollegeID
                
                IF @Priority IS NULL OR @Priority < 1 OR @Priority > @MaxPriority + 1
                BEGIN
                    SET @Priority = @MaxPriority + 1
                END
                -- Insert new designation with priority
                INSERT INTO Designations(CollegeID,DesignationCode,DesignationAcronym,DesignationName,StreamID,RoleResponsibilities,Priority)
                VALUES(@CollegeID,@DesignationCode,@DesignationAcronym,@DesignationName,@StreamID,@RoleResponsibility,ISNULL(@Priority, 0))
                
                SELECT @Success = 1, @Msg = 'Designation added successfully'
            END
    END TRY
    BEGIN CATCH
        SELECT @Success = 0, @Msg = 'Error: ' + ERROR_MESSAGE()
    END CATCH
    
    SELECT @Success AS Success, @Msg AS Msg
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_RecordDesig]    Script Date: 26-05-25 12.20.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Proc_RecordDesig 'FilterdRecord','',''
CREATE PROC [dbo].[Proc_RecordDesig]
  @Action VARCHAR(25) = NULL,
  @ClgName VARCHAR(50) = NULL,
   @DesignName VARCHAR(50) = NULL
AS
BEGIN
----------
	IF(@Action='College')
    BEGIN 
            select CollegeName,CollegeID, CollegeCode from  Colleges 
	END
	ELSE IF(@Action='Streams')
    BEGIN 
            select  StreamID,StreamName from  Streams 
	END
	ELSE IF(@Action='FilterdRecord')
	 BEGIN 
	select DesignationID,DesignationCode,DesignationAcronym,DesignationName,Priority,RoleResponsibilities,s.StreamName,cg.CollegeName
	 from Designations ds LEFT JOIN Streams s on s.StreamID=ds.StreamID LEFT JOIN Colleges cg ON cg.CollegeID=ds.CollegeID
            WHERE (@ClgName= '' OR	cg.CollegeName= @ClgName ) 
		AND (ds.DesignationName=@DesignName OR @DesignName='')
	END
	ELSE 
	BEGIN 
	select DesignationID,DesignationCode,DesignationAcronym,DesignationName,Priority,RoleResponsibilities,s.StreamName,cg.CollegeName
	 from Designations ds LEFT JOIN Streams s on s.StreamID=ds.StreamID LEFT JOIN Colleges cg ON cg.CollegeID=ds.CollegeID
	END
END	
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertUser]    Script Date: 26-05-25 12.20.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc  [dbo].[USP_InsertUser]
	@Name NVARCHAR(100),
    @Email NVARCHAR(255),
    @Mobile NVARCHAR(15),
    @Address NVARCHAR(500),
    @Password NVARCHAR(255)
  as
  begin
	  declare @status bit=0 ,@msg varchar(100)=null  ,@DemandId int=null
	  BEGIN TRY
		  BEGIN TRANSACTION 
      
			INSERT INTO tbl_regUsers (Name, Email, Mobile, Address, Password)
			VALUES (@Name, @Email, @Mobile, @Address, @Password);
			
			SELECT	@status =1 ,@msg='User successfully registered'	 
	
			COMMIT TRANSACTION;
		END TRY
		BEGIN CATCH   
			ROLLBACK TRANSACTION;
			SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
		
		END CATCH;
		 SELECT @status AS [status], @msg AS [msg];
  end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoginUser]    Script Date: 26-05-25 12.20.55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_LoginUser]
		@Email		NVARCHAR(255),
		@Password	NVARCHAR(255)
  as
  begin
	  declare @status bit=0 ,@msg varchar(100)=null  
	  BEGIN TRY
		  BEGIN TRANSACTION 
      
			IF EXISTS( select 1 from tbl_regUsers  WHERE Email = @Email)
				BEGIN
					IF EXISTS( select 1 from tbl_regUsers  WHERE Email = @Email and Password=@Password)
					begin
						select UserID,Name,Email, Password from tbl_regUsers  WHERE Email = @Email and Password=@Password
						SELECT @status=1, @msg='Password Mached <br//>'
					end
					else 
					BEGIN
						SELECT @status=0, @msg='Wrong Password<br//>'
					END
				END
				ELSE
				BEGIN
					SELECT @status=0, @msg='Email Not Found<br//>'
					
				END
	
			COMMIT TRANSACTION;
		END TRY
		BEGIN CATCH   
			ROLLBACK TRANSACTION;
			SELECT	@status =0 ,@msg=ERROR_MESSAGE()	 
		
		END CATCH;
		 SELECT @status AS [status], @msg AS [msg];
  end
GO
USE [master]
GO
ALTER DATABASE [DbTask] SET  READ_WRITE 
GO
