program TTTS;

uses
  Forms,
  TTS1 in 'TTS1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'TelewareTTS';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
