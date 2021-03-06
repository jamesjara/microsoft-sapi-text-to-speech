unit TTS1;
//james jara tts1 costa rica
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleServer, SpeechLib_TLB, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    SpVoice1: TSpVoice;
    ComboBoxVoices: TComboBox;
    Label1: TLabel;
    TrackBarVol: TTrackBar;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Texto: TEdit;
    rate: TTrackBar;
    ComboBoxFormat: TComboBox;
    ComboBoxOutput: TComboBox;
    SpMMAudioOut1: TSpMMAudioOut;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button2: TButton;
    Edit1: TEdit;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TrackBarVolChange(Sender: TObject);
    procedure ComboBoxVoicesChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure rateChange(Sender: TObject);
    procedure formatos;
    procedure ComboBoxFormatChange(Sender: TObject);
    procedure ComboBoxOutputChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure tform1.formatos;
Begin
  ComboBoxFormat.AddItem('SPSF_Default',nil);
  ComboBoxFormat.AddItem('SPSF_NoAssignedFormat',nil);
  ComboBoxFormat.AddItem('SPSF_Text',nil);
  ComboBoxFormat.AddItem('SPSF_NonStandardFormat',nil);
  ComboBoxFormat.AddItem('SPSF_ExtendedAudioFormat',nil);
  // Standard PCM wave formats
  ComboBoxFormat.AddItem('SPSF_8kHz8BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_8kHz8BitStereo',nil);
  ComboBoxFormat.AddItem('SPSF_8kHz16BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_8kHz16BitStereo',nil);
  ComboBoxFormat.AddItem('SPSF_11kHz8BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_11kHz8BitStereo',nil);
  ComboBoxFormat.AddItem('SPSF_11kHz16BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_11kz16BitStereo',nil);
  ComboBoxFormat.AddItem('SPSF_12kHz8BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_12kHz8BitStereo',nil);
  ComboBoxFormat.AddItem('SPSF_12kHz16BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_12kHz16BitStereo',nil);
  ComboBoxFormat.AddItem('SPSF_16kHz8BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_16kHz8BitStereo',nil);
  ComboBoxFormat.AddItem('SPSF_16kHz16BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_16kHz16BitStereo',nil);
  ComboBoxFormat.AddItem('SPSF_22kHz8BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_22kHz8BitStereo',nil);
  ComboBoxFormat.AddItem('SPSF_22kHz16BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_22kHz16BitStereo',nil);
  ComboBoxFormat.AddItem('SPSF_24kHz8BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_24kHz8BitStereo',nil);
  ComboBoxFormat.AddItem('SPSF_24kHz16BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_24kHz16BitStereo',nil);
  ComboBoxFormat.AddItem('SPSF_32kHz8BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_32kHz8BitStereo',nil);
  ComboBoxFormat.AddItem('SPSF_32kHz16BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_32kHz16BitStereo',nil);
  ComboBoxFormat.AddItem('SPSF_44kHz8BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_44kHz8BitStereo',nil);
  ComboBoxFormat.AddItem('SPSF_44kHz16BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_44kHz16BitStereo',nil);
  ComboBoxFormat.AddItem('SPSF_48kHz8BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_48kHz8BitStereo',nil);
  ComboBoxFormat.AddItem('SPSF_48kHz16BitMono',nil);
  ComboBoxFormat.AddItem('SPSF_48kHz16BitStereo',nil);
   // TrueSpeech format
  ComboBoxFormat.AddItem('SPSF_TrueSpeech_8kHz1BitMono',nil);
   // A-Law formats
  ComboBoxFormat.AddItem('SPSF_CCITT_ALaw_8kHzMono',nil);
  ComboBoxFormat.AddItem('SPSF_CCITT_ALaw_8kHzStereo',nil);
  ComboBoxFormat.AddItem('SPSF_CCITT_ALaw_11kHzMono',nil);
  ComboBoxFormat.AddItem('SPSF_CCITT_ALaw_11kHzStereo',nil);
  ComboBoxFormat.AddItem('SPSF_CCITT_ALaw_22kHzMono',nil);
  ComboBoxFormat.AddItem('SPSF_CCITT_ALaw_22kHzStereo',nil);
  ComboBoxFormat.AddItem('SPSF_CCITT_ALaw_44kHzMono',nil);
  ComboBoxFormat.AddItem('SPSF_CCITT_ALaw_44kHzStereo',nil);
  // u-Law formats
  ComboBoxFormat.AddItem('SPSF_CCITT_uLaw_8kHzMono',nil);
  ComboBoxFormat.AddItem('SPSF_CCITT_uLaw_8kHzStereo',nil);
  ComboBoxFormat.AddItem('SPSF_CCITT_uLaw_11kHzMono',nil);
  ComboBoxFormat.AddItem('SPSF_CCITT_uLaw_11kHzStereo',nil);
  ComboBoxFormat.AddItem('SPSF_CCITT_uLaw_22kHzMono',nil);
  ComboBoxFormat.AddItem('SPSF_CCITT_uLaw_22kHzStereo',nil);
  ComboBoxFormat.AddItem('SPSF_CCITT_uLaw_44kHzMono',nil);
  ComboBoxFormat.AddItem('SPSF_CCITT_uLaw_44kHzStereo',nil);
  // ADPCM formats
  ComboBoxFormat.AddItem('SPSF_ADPCM_8kHzMono',nil);
  ComboBoxFormat.AddItem('SPSF_ADPCM_8kHzStereo',nil);
  ComboBoxFormat.AddItem('SPSF_ADPCM_11kHzMono',nil);
  ComboBoxFormat.AddItem('SPSF_ADPCM_11kHzStereo',nil);
  ComboBoxFormat.AddItem('SPSF_ADPCM_22kHzMono',nil);
  ComboBoxFormat.AddItem('SPSF_ADPCM_22kHzStereo',nil);
  ComboBoxFormat.AddItem('SPSF_ADPCM_44kHzMono',nil);
  ComboBoxFormat.AddItem('SPSF_ADPCM_44kHzStereo',nil);
  // GSM 6.10 formats
  ComboBoxFormat.AddItem('SPSF_GSM610_8kHzMono',nil);
  ComboBoxFormat.AddItem('SPSF_GSM610_11kHzMono',nil);
  ComboBoxFormat.AddItem('SPSF_GSM610_22kHzMono',nil);
  ComboBoxFormat.AddItem('SPSF_GSM610_44kHzMono',nil);
  ComboBoxFormat.AddItem('SPSF_NUM_FORMATS',nil);
  COmboBoxFormat.ItemIndex := 19;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  SOTokenOutput: ISpeechObjectToken;
  SOTokenOutputs:ISpeechObjectTokens;
  SOTokenVoice: ISpeechObjectToken;
  SOTokenVoices:ISpeechObjectTokens;
  i:       Integer;
begin
  edit1.Text := 'prueba.wav';
  SOTokenOutputs := Spvoice1.GetAudioOutputs('','');
  SOTokenVoices := SpVoice1.GetVoices('','');
  for I := 0 to SOTokenOutputs.Count - 1 do
  begin
    SOTokenOutput := SOTokenOutputs.Item(i);
    ComboBoxOutput.Items.AddObject(SOTokenOutput.GetDescription(0), TObject(SOTokenVoice));
    SOTokenOutput._AddRef;
  end;
  if ComboBoxOutput.Items.Count > 0 then
  begin
    ComboBoxOutput.ItemIndex := 0;
  end;
  for I := 0 to SOTokenVoices.Count - 1 do
  begin
    SOTokenVoice := SOTokenVoices.Item(i);
    ComboBoxVoices.Items.AddObject(SOTokenVoice.GetDescription(0), TObject(SOTokenVoice));
    SOTokenVoice._AddRef;
  end;
  if ComboBoxVoices.Items.Count > 0 then
  begin
    ComboBoxVoices.ItemIndex := 0;
//    ComboBox1.OnChange(ComboBoxVoices); //ensure OnChange triggers
  end;
  TrackBarVol.Position :=100;
  formatos;
//  SPMMAudioOut1.Format.type_ := 5;
end;

procedure TForm1.TrackBarVolChange(Sender: TObject);
begin
  SpVoice1.Volume := TrackBarVol.Position;
  Label3.Caption := IntToStr(TrackBarVol.Position);
end;

procedure TForm1.ComboBoxVoicesChange(Sender: TObject);
var SOTokenVoice:  ISpeechObjectToken;
begin
  SOTokenVoice := ISpeechObjectToken(Pointer(ComboBoxVoices.Items.Objects[ComboBoxVoices.ItemIndex]));
  SpVoice1.Voice := SOTokenVoice;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  SpVoice1.Speak(texto.Text,1)
end;

procedure TForm1.rateChange(Sender: TObject);
begin
  SpVoice1.Rate := Rate.Position;
//  LabelRatePos.Caption := IntToStr(Rate.Position);
end;

procedure TForm1.ComboBoxFormatChange(Sender: TObject);
begin
  SpVoice1.AllowAudioOutputFormatChangesOnNextSet := False;
  SpVoice1.AudioOutputStream := SpMMAudioOut1.DefaultInterface;
end;

procedure TForm1.ComboBoxOutputChange(Sender: TObject);
var
  SOTokenDevice : ISpeechObjectToken;
begin
  SOTokenDevice:=ISpeechObjectToken(Pointer(ComboBoxOutput.Items.Objects[ComboBoxOutput.ItemIndex]));
  SpVoice1.AudioOutput := SOTokenDevice;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Archivo : string;
  SpFileStream1: TSpFileStream;
  SOTokenVoice:  ISpeechObjectToken;
begin
//  --- ESPECIFICA ARCHIVO DE SALIDA ---
  Archivo := edit1.Text;
  SpFileStream1 := TSpFilestream.Create(nil);
  SpFileStream1.Format.type_ := ComboBoxFormat.ItemIndex -1;
  SpFileStream1.Open(Archivo, SSFMCreateForWrite, False);
// --- SELECCIONA LA VOZ A UTILIZAR ---
  SOTokenVoice := ISpeechObjectToken(Pointer(ComboBoxVoices.Items.Objects[ComboBoxVoices.ItemIndex]));
  SpVoice1.Voice := SOTokenVoice;
// --- SET Volumen, Rate
  SpVoice1.Volume := TrackBarVol.Position;
  SpVoice1.Rate := Rate.Position;
// ASIGNA LOS PARAMETROS DE SALIDA
  SpVoice1.AudioOutputStream := SPFileStream1.DefaultInterface;
// --- GENERA EL TTS
  SpVoice1.Speak(Texto.Text, SVSFDefault);
  SPFileStream1.Close;
  SpFileStream1.Free;
  SpVoice1.AudioOutputStream := nil;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
 x: integer;
begin
  SpVoice1.AudioOutputStream.Format.type_ := 49;
  showmessage(string(x));
  end;

end.
