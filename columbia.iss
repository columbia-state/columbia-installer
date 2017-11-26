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
VersionInfoCopyright=� {#MyAppYear} Columbia� State
VersionInfoDescription={#MyAppName} Install
VersionInfoVersion={#MyAppVersion}
UninstallFilesDir={localappdata}\Columbia Team\Columbia State

[Languages]
;Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "serbianlatin"; MessagesFile: "compiler:Languages\SerbianLatin.isl"

[Tasks]
Name: "desktopicon";  Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: checkablealone
Name: "DirectX";      Description: "Instaliraj Microsoft DirectX (Online)"; GroupDescription: "Sofver za podr�ku"; Flags: checkablealone
Name: "VisualCpp";    Description: "Instaliraj Microsoft Visual C++ Redistributable"; GroupDescription: "Sofver za podr�ku"; Flags: checkablealone
Name: "Framework";    Description: "Instaliraj Microsoft .NET Framework 4.0 (Online)"; GroupDescription: "Sofver za podr�ku"; Flags: checkablealone
;Name: "MVCppRedist";  Description: " Microsoft Visual C++ Redist"; GroupDescription: "Support Software"; Flags: unchecked
