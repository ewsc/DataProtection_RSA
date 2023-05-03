Unit Main;

Interface

Uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

Type
    TMainForm = class(TForm)
        EditP: TEdit;
        EditQ: TEdit;
    EncButton: TButton;
        Button2: TButton;
        InfoMemo: TMemo;
        Edit3: TEdit;
        Edit4: TEdit;
        ResultMemo: TMemo;
        Procedure FormCreate(Sender: TObject);
    procedure EditPChange(Sender: TObject);
    procedure EditQChange(Sender: TObject);
    procedure EncButtonClick(Sender: TObject);
    Private
       { Private declarations }
    Public
       { Public declarations }
    End;

Var
    MainForm: TMainForm;

Implementation

{$R *.dfm}


Function IsPrime(X: Integer): Boolean;
Var
    I: Integer;
Begin
    Result := False;
    If not Odd(X) And (X <> 2) Then Exit;
    I := 3;
    While i <= Sqrt(X) do
    Begin
        If X Mod I = 0 then Exit;
        Inc(I, 2);
    End;
    Result := true;
End;

Procedure TMainForm.EditPChange(Sender: TObject);
Begin
    EncButton.Enabled := (Length(EditP.Text) > 0) And (Length(EditQ.Text) > 0);
End;

Procedure TMainForm.EditQChange(Sender: TObject);
Begin
    EncButton.Enabled := (Length(EditP.Text) > 0) And (Length(EditQ.Text) > 0);
End;

Procedure ClearMemos(ResultMemo: TMemo; InfoMemo: TMemo);   
Begin
    ResultMemo.Clear;
    InfoMemo.Clear;
End;

Function GCD(A, B: Integer) : Integer;
Var
    Temp: Integer;
Begin
    While not(B = 0) do
    Begin
        Temp := B;
		B := A Mod B;
		A := Temp;
    End;
    Result := A;
End;

Function GetRandExp(Phi, R: Integer) : Integer;
Var
    E: Integer;
Begin
    E := 1 + Random(R);
    While (True) Do
    Begin
        If GCD(E, Phi) = 1 then
        Begin
            Result := E;
            Break;
        End;
        E := (E + 1) Mod R;
        If (E <= 2) then 
            E := 3;
    End;
End;

Function Inverse(N, Modulus: Integer) : Integer;
Var
    A, B, X, Y, X0, Y0, Q, Temp: Integer;
Begin
    A := N;
    B := Modulus;
    X := 0;
    Y := 1;
    X0 := 1;
    Y0 := 0;
    While not (B = 0) do
    Begin
        Q := A Div B;
		Temp := A Mod B;
		A := B;
		B := Temp;
		Temp := X; X := X0 - Q * X; X0 := Temp;
		Temp := Y; Y := Y0 - Q * Y; Y0 := Temp;
    End;
    If (X0 < 0) then
        X0 := X0 + Modulus;
	Result := X0;
End;

Procedure TMainForm.EncButtonClick(Sender: TObject);
Var
    P, Q, R, Phi, Exp, D: Integer;
Begin
    ClearMemos(ResultMemo, InfoMemo);
    P := StrToInt(EditP.Text);
    Q := StrToInt(EditQ.Text);
    If (IsPrime(P) and IsPrime(Q)) then
    Begin
        InfoMemo.Lines.Add('> P: ' + EditP.Text + ' is prime number;');
        InfoMemo.Lines.Add('> Q: ' + EditQ.Text + ' is prime number;');
        R := P * Q;
        InfoMemo.Lines.Add('> R: ' + IntToStr(R) + ';');
        If R < 128 then
        Begin
            ShowMessage('Modulus is less than 128, cannot encode single bytes. Input another prime numbers.');
            Exit;
        End;
        Phi := (P - 1) * (P - 1);
        InfoMemo.Lines.Add('> Phi: ' + IntToStr(Phi) + ';');
        Exp := GetRandExp(Phi, R);
        InfoMemo.Lines.Add('> Exp: ' + IntToStr(Exp) + ';');
        D := Inverse(Exp, Phi);
        InfoMemo.Lines.Add('> Private Exponent: ' + IntToStr(D) + ';');
        InfoMemo.Lines.Add('> Private Key: {' + IntToStr(D) + ', ' + IntToStr(R) + '};');
    End
    Else
        ShowMessage('Given numbers are not prime numbers!');
End;

Procedure TMainForm.FormCreate(Sender: TObject);
Begin
    ClearMemos(ResultMemo, InfoMemo);
End;

End.
