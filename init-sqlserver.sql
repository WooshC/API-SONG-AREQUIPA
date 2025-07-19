USE [master]
GO
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'usr_polimusic_gr2' AND type = 'S') -- 'S' indicates SQL login
BEGIN
    CREATE LOGIN [usr_polimusic_gr2] 
        WITH PASSWORD = N'Politecnica1', 
             DEFAULT_DATABASE = [master], 
             CHECK_EXPIRATION = OFF, 
             CHECK_POLICY = OFF;
    PRINT 'Login "usr_polimusic_gr2" created successfully.';
END
ELSE
BEGIN
    PRINT 'Login "usr_polimusic_gr2" already exists.';
END;
GO

--DROP DATABASE IF EXISTS [BDD_PoliMusic_Song]
--GO
/****** Create:  Database [BDD_BytesMusic]    ******/
IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'BDD_PoliMusic_Song')
BEGIN
    CREATE DATABASE [BDD_PoliMusic_Song];
    PRINT 'Database created successfully.';
END
ELSE
BEGIN
    PRINT 'Database already exists.';
END
GO

USE [BDD_PoliMusic_Song]
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'usr_polimusic_gr2')
BEGIN
-- For login login_name, create a user in the database
    CREATE USER usr_polimusic_gr2 FOR LOGIN usr_polimusic_gr2 WITH DEFAULT_SCHEMA = [dbo];
    PRINT 'User created successfully.';
END
ELSE
BEGIN
    PRINT 'User usr_polimusic_gr2 already exists.';
END
GO

IF NOT EXISTS (
    SELECT 1 FROM sys.database_role_members
    WHERE member_principal_id = ( SELECT principal_id FROM sys.database_principals WHERE name = N'usr_polimusic_gr2' )
    AND role_principal_id = ( SELECT principal_id FROM sys.database_principals WHERE name = N'db_owner' )
)
BEGIN
    EXEC sp_addrolemember N'db_owner', N'usr_polimusic_gr2';
	PRINT 'User usr_polimusic_gr2 added to db_owner role successfully.';
END
ELSE
BEGIN
    PRINT 'User usr_polimusic_gr2 is already a member of db_owner role.';
END
GO

/****** Create:  Table [dbo].[TBL_SONG]    ******/
CREATE TABLE [dbo].[TBL_SONG](
	[ID_SONG] [int] IDENTITY(1,1) NOT NULL,
	[SONG_NAME] [varchar](50) NOT NULL,
	[SONG_PATH] [varchar](255) NOT NULL,
	[PLAYS] [int] NULL,
 CONSTRAINT [PK_TBL_SONG_MS] PRIMARY KEY CLUSTERED 
(
	[ID_SONG] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/*Populate Table*/
INSERT INTO TBL_SONG (SONG_NAME, SONG_PATH) VALUES('Adventure','../songFiles/bensound-adventure.mp3');
INSERT INTO TBL_SONG (SONG_NAME, SONG_PATH) VALUES('Buddy','../songFiles/bensound-buddy.mp3');
INSERT INTO TBL_SONG (SONG_NAME, SONG_PATH) VALUES('Dance','../songFiles/bensound-dance.mp3');
INSERT INTO TBL_SONG (SONG_NAME, SONG_PATH) VALUES('Dreams','../songFiles/bensound-dreams.mp3');
INSERT INTO TBL_SONG (SONG_NAME, SONG_PATH) VALUES('Energy','../songFiles/bensound-energy.mp3');
GO
SELECT count(*) FROM TBL_SONG
GO 