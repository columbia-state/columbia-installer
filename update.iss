; Columbia State - Installer Update
; Inno Setup Script
; Columbia Team

#define AppName         "SAMP Columbia State"
#define AppYear         "2017"
#define AppVersion      "1.0"
#define AppUpdate       "1.0.0.1"
#define AppPublisher    "Columbia State Team"
#define AppURL          "https://columbia-state.com/"
#define AppExeName      "columbia.exe"

[Setup]
AppId={{6FA39DBB-7372-4FF6-A077-FF5AAC2EBECC}
AppName={#AppName}
AppVersion={#AppUpdate}
AppVerName={#AppName} v{#AppUpdate}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
AllowNoIcons=yes
DefaultDirName={code:GetInstallDir}
DefaultGroupName={#AppName}
SetupIconFile=icon.ico
OutputDir=output\upadate\{#AppUpdate}
OutputBaseFilename=update-cs
SolidCompression=yes
Compression=lzma2/ultra64
InternalCompressLevel=ultra64 
WizardSmallImageFile=image\image_small.bmp
VersionInfoCopyright=© {#AppYear} Columbia™ State
VersionInfoDescription={#AppName} {#AppUpdate}
VersionInfoVersion={#AppUpdate}
Uninstallable=no
AllowCancelDuringInstall=no
AppendDefaultDirName=no
DirExistsWarning=no
DisableDirPage=yes
DisableFinishedPage=yes
DisableProgramGroupPage=yes
DisableWelcomePage=yes
DisableReadyPage=yes
DisableReadyMemo=yes


[Languages]
;Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "serbianlatin"; MessagesFile: "compiler:Languages\SerbianLatin.isl"


[Files]
Source: "include\*"; DestDir: "{tmp}"; Flags: ignoreversion dontcopy
Source: "update\v{#AppUpdate}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs


[Run]
Filename: "{app}\{#AppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(AppName, '&', '&&')}}"; Flags: nowait postinstall


[Messages]
serbianlatin.BeveledLabel= - © {#AppYear} Columbia™ State


[UninstallDelete]
Type: filesandordirs; Name: {app}


[Code]
procedure LoadSkin(lpszPath: PAnsiChar; lpszIniFileName: PAnsiChar); external 'LoadSkin@{tmp}\isskin.dll stdcall delayload';
procedure UnloadSkin; external 'UnloadSkin@{tmp}\isskin.dll stdcall delayload';


function GetInstallDir(def: string): string;
var 
  InstallDir : string;

begin
  Result :='C:\Games\SAMP Columbia State';
  if IsWin64 then
    if RegQueryStringValue(HKEY_LOCAL_MACHINE, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{6FA39DBB-7372-4FF6-A077-FF5AAC2EBECC}_is1','InstallLocation', InstallDir) then begin        
      Result := InstallDir; // Successfully read the value.
    end
  Else
    if RegQueryStringValue(HKEY_LOCAL_MACHINE, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{6FA39DBB-7372-4FF6-A077-FF5AAC2EBECC}_is1', InstallDir) then begin          
      Result := InstallDir; // Successfully read the value.
    end
end;


function InitializeSetup(): Boolean; 
var
    ErrCode: integer;
begin
  Result := True;
  
  ExtractTemporaryFile('isskin.dll');
	ExtractTemporaryFile('skin.cjstyles');
  LoadSkin(ExpandConstant('{tmp}\skin.cjstyles'), '');

  if RegValueExists(HKEY_LOCAL_MACHINE,'Software\Microsoft\Windows\CurrentVersion\Uninstall\{6FA39DBB-7372-4FF6-A077-FF5AAC2EBECC}_is1', 'InstallLocation') then begin
    MsgBox(ExpandConstant('Greška, nemate instaliran Columbia State Launcher.' #13#10 'Posjetite službenu stranicu i skinite isti za nastavk.'), mbInformation, MB_OK);
    ShellExec('open', 'https://columbia-state.com/', '', '', SW_SHOW, ewNoWait, ErrCode);
    Result := False;
  end;    
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