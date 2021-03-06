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
WizardImageFile=image\image.bmp
WizardSmallImageFile=image\image_small.bmp
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
Name: "Framework";    Description: "Instaliraj Microsoft .NET Framework 4.5 (Online)"; GroupDescription: "Sofver za podr�ku"; Flags: checkablealone
;Name: "MVCppRedist";  Description: " Microsoft Visual C++ Redist"; GroupDescription: "Support Software"; Flags: unchecked

[Files]
Source: "files\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "include\*"; DestDir: "{tmp}"; Flags: ignoreversion dontcopy
Source: "support\*"; DestDir: "{tmp}"; Flags: ignoreversion dontcopy

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{tmp}\dxwebsetup.exe"; Parameters: "/q"; StatusMsg: "Install Microsoft DirectX online..."; Tasks: DirectX; Flags: waituntilterminated
Filename: "{tmp}\vcredist_2005 _SP1_x86.exe"; Parameters: "/q"; StatusMsg: "Install Microsoft Visual C++ Runtime..."; Tasks: VisualCpp; Flags: waituntilterminated
;Filename: "{tmp}\vcredist_2005_x86.exe"; Parameters: "/q"; StatusMsg: "Install Microsoft Visual C++ Runtime..."; Tasks: VisualCpp; Flags: waituntilterminated
Filename: "{tmp}\vcredist_2008_SP1_x86.exe"; Parameters: "/q"; StatusMsg: "Install Microsoft Visual C++ Runtime..."; Tasks: VisualCpp; Flags: waituntilterminated
;Filename: "{tmp}\vcredist_2008_x86.exe"; Parameters: "/q"; StatusMsg: "Install Microsoft Visual C++ Runtime..."; Tasks: VisualCpp; Flags: waituntilterminated
Filename: "{tmp}\vcredist_2010_SP1_x86.exe"; Parameters: "/q /norestart"; StatusMsg: "Install Microsoft Visual C++ Runtime..."; Tasks: VisualCpp; Flags: waituntilterminated
;Filename: "{tmp}\vcredist_2010_x86.exe"; Parameters: "/q /norestart"; StatusMsg: "Install Microsoft Visual C++ Runtime..."; Tasks: VisualCpp; Flags: waituntilterminated
;Filename: "{tmp}\vcredist_2012_Update4_x86.exe"; Parameters: "/q /norestart"; StatusMsg: "Install Microsoft Visual C++ Runtime..."; Tasks: VisualCpp; Flags: waituntilterminated
;Filename: "{tmp}\vcredist_2013_x86.exe"; Parameters: "/install /quiet /norestart"; StatusMsg: "Install Microsoft Visual C++ Runtime..."; Tasks: VisualCpp; Flags: waituntilterminated
;Filename: "{tmp}\vcredist_2015_Update3_x86.exe"; Parameters: "/install /quiet /norestart"; StatusMsg: "Install Microsoft Visual C++ Runtime..."; Tasks: VisualCpp; Flags: waituntilterminated
Filename: "{tmp}\dotNetFx45_Full_setup.exe"; Parameters: "/q /norestart"; StatusMsg: "Install Microsoft .NET Framework online..."; Tasks: Framework; Flags: waituntilterminated

Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent


[Messages]
serbianlatin.BeveledLabel= - � {#MyAppYear} Columbia� State

[UninstallDelete]
Type: filesandordirs; Name: {app}

[Code]
procedure LoadSkin(lpszPath: PAnsiChar; lpszIniFileName: PAnsiChar); external 'LoadSkin@{tmp}\isskin.dll stdcall delayload';
procedure UnloadSkin; external 'UnloadSkin@{tmp}\isskin.dll stdcall delayload';

function InitializeSetup(): Boolean; 
begin
  ExtractTemporaryFile('dxwebsetup.exe');
  ExtractTemporaryFile('vcredist_2005 _SP1_x86.exe');
  //ExtractTemporaryFile('vcredist_2005_x86.exe');
  ExtractTemporaryFile('vcredist_2008_SP1_x86.exe');
  //ExtractTemporaryFile('vcredist_2008_x86.exe');
  ExtractTemporaryFile('vcredist_2010_SP1_x86.exe');
  //ExtractTemporaryFile('vcredist_2010_x86.exe');
  //ExtractTemporaryFile('vcredist_2012_Update4_x86.exe');
  //ExtractTemporaryFile('vcredist_2013_x86.exe');
  //ExtractTemporaryFile('vcredist_2015_Update3_x86.exe');
  ExtractTemporaryFile('dotNetFx45_Full_setup.exe');
  ExtractTemporaryFile('isskin.dll');
	ExtractTemporaryFile('skin.cjstyles');
  LoadSkin(ExpandConstant('{tmp}\skin.cjstyles'), '');
  Result := True;
end;

procedure DeinitializeSetup(); 
begin
  UnloadSkin();
end;

procedure InitializeWizard();
begin
  WizardForm.PageNameLabel.Width:=230;
  WizardForm.PageDescriptionLabel.Width:=250;

  WizardForm.WizardSmallBitmapImage.Left:=310;
  WizardForm.WizardSmallBitmapImage.Top:=0;
  WizardForm.WizardSmallBitmapImage.Width:=180;
  WizardForm.WizardSmallBitmapImage.Height:=58;
end;