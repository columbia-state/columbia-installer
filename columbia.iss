; Columbia State - Installer
; Inno Setup Script
; Columbia Team

#define MyAppName "SAMP Columbia State"
#define MyAppYear "2017"
#define MyAppVersion "1.0"
#define MyAppPublisher "Columbia State Team"
#define MyAppURL "https://columbia-state.com/"
#define MyAppExeName "columbia.exe"

[Setup]
AppId={{6FA39DBB-7372-4FF6-A077-FF5AAC2EBECC}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} v{#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName=C:\Games\{#MyAppName}
DefaultGroupName={#MyAppName}
InfoBeforeFile=readme.rtf
SetupIconFile=icon.ico
OutputDir=output
OutputBaseFilename=setup-cs
SolidCompression=yes
Compression=lzma2/ultra64
InternalCompressLevel=ultra64 
WizardImageFile=image.bmp
WizardSmallImageFile=small_image.bmp
VersionInfoCopyright=� {#MyAppYear} Columbia� State
VersionInfoDescription={#MyAppName} Install
VersionInfoVersion={#MyAppVersion}
UninstallFilesDir={localappdata}\Columbia Team\Columbia State
